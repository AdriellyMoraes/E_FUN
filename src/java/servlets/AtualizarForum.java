package servlets;

import banco_dados.ConexaoBancoDados;
import banco_dados.ForumDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import model.Forum;

/**
 *
 * @author Adrielly Moraes Lustoza
 * @author Raquel de Albuquerque Maciel
 */
public class AtualizarForum extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome, descricao, opcaoPrivacidade, nomeUsuPessoa;
        int codigoForum;
        PrintWriter out;
        
        nome = request.getParameter("nomeForum");
        descricao = request.getParameter("descricaoForum");
        opcaoPrivacidade = request.getParameter("privacidadeForum");
        nomeUsuPessoa = request.getParameter("nome_usuario");
        codigoForum = Integer.parseInt(request.getParameter("codigo_forum"));
        
        out = response.getWriter();
        
        try{
            ConexaoBancoDados conexao = new ConexaoBancoDados();
            ForumDao fsDao = new ForumDao();
            Forum fs = new Forum(nome,descricao,nomeUsuPessoa,opcaoPrivacidade,codigoForum);
            
            if (conexao.abrirConexao()) {
                fsDao.configurarConexao(conexao.obterConexao());
                if(fsDao.alterarForum(fs)){
                    JOptionPane.showMessageDialog(null,"Dados Atualizados!");
                    response.sendRedirect("paginaUsuario.jsp?nomeUsuario="+nomeUsuPessoa);
                }else{
                    out.println("<h2>Não foi possível alterar o fórum!</h2>");
                }
                
                conexao.fecharConexao();
                
            }else{
                out.println("<h2>Não foi possível estabelecer conexão com o banco de dados!</h2>");
            }
            
        } catch (Exception erro) {
            erro.printStackTrace();
            out.println("<h2>Erro do sistema: processo de alteração de fórum!</h2>");
        }
        
    }        
}    

