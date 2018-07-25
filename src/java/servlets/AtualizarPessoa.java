package servlets;

import banco_dados.ConexaoBancoDados;
import banco_dados.PessoaDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import model.Pessoa;

/**
 *
 * @author Adrielly Moraes Lustoza
 * @author Raquel de Albuquerque Maciel
 */
public class AtualizarPessoa extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String strNomeUsuario, strNome, strEmail, strSenha, strDataNasc;
        String nomeUsuario;
        PrintWriter out;
        
        nomeUsuario = request.getParameter("nomeUsuario");
        strNomeUsuario = request.getParameter("usrUser");
        strNome = request.getParameter("usrName");
        strEmail = request.getParameter("usrEmail");
        strSenha = request.getParameter("psw");
        strDataNasc = request.getParameter("usrBirth");
        
        out = response.getWriter();
        
        try{
            ConexaoBancoDados conexao = new ConexaoBancoDados();
            PessoaDao psDao = new PessoaDao();
            Pessoa ps = new Pessoa(strNomeUsuario, strNome, strEmail, strSenha, strDataNasc);
            
            if (conexao.abrirConexao()) {
                psDao.configurarConexao(conexao.obterConexao());
                if(psDao.alterarPessoa(ps,nomeUsuario)){
                    JOptionPane.showMessageDialog(null,"Dados Atualizados!");
                    response.sendRedirect("paginaUsuario.jsp?nomeUsuario="+strNomeUsuario);
                }else{
                    out.println("<h2>Não foi possível alterar o usuário!</h2>");
                }
                
                conexao.fecharConexao();
                
            }else{
                out.println("<h2>Não foi possível estabelecer conexão com o banco de dados!</h2>");
            }
            
        } catch (Exception erro) {
            erro.printStackTrace();
            out.println("<h2>Erro do sistema: processo de alteração de usuário!</h2>");
        }
        
    }        
}    

