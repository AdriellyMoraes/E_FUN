package servlets;

import banco_dados.ConexaoBancoDados;
import banco_dados.HistoriaDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import model.Historia;

/**
 *
 * @author Adrielly Moraes Lustoza
 * @author Raquel de Albuquerque Maciel
 */
public class AtualizarHistoria extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String genero, capitulos, titulo, sinopse, nomeUsuPessoa;
        int codigoHistoria;
        PrintWriter out;
        
        genero = request.getParameter("genero");
        capitulos = request.getParameter("capitulos");
        titulo = request.getParameter("titulo");
        sinopse = request.getParameter("sinopse");
        nomeUsuPessoa = request.getParameter("nome_usuario");
        codigoHistoria = Integer.parseInt(request.getParameter("codigo_historia"));
        
        out = response.getWriter();
        
        try{
            ConexaoBancoDados conexao = new ConexaoBancoDados();
            HistoriaDao hsDao = new HistoriaDao();
            Historia hs = new Historia(genero,capitulos,titulo,sinopse,nomeUsuPessoa,codigoHistoria);
            
            if (conexao.abrirConexao()) {
                hsDao.configurarConexao(conexao.obterConexao());
                if(hsDao.alterarHistoria(hs)){
                    JOptionPane.showMessageDialog(null,"Dados Atualizados!");
                    response.sendRedirect("paginaUsuario.jsp?nomeUsuario="+nomeUsuPessoa);
                }else{
                    out.println("<h2>Não foi possível alterar a história!</h2>");
                }
                
                conexao.fecharConexao();
                
            }else{
                out.println("<h2>Não foi possível estabelecer conexão com o banco de dados!</h2>");
            }
            
        } catch (Exception erro) {
            erro.printStackTrace();
            out.println("<h2>Erro do sistema: processo de alteração de história!</h2>");
        }
        
    }        
}    

