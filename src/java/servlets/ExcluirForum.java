package servlets;

import banco_dados.ConexaoBancoDados;
import banco_dados.ForumDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adrielly Moraes Lustoza
 * @author Raquel de Albuquerque Maciel
 */
public class ExcluirForum extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomeUsuario;
        nomeUsuario = request.getParameter("nome_Usuario");
        PrintWriter out;
        
        out = response.getWriter();

        try {
            ConexaoBancoDados conexao = new ConexaoBancoDados();
            ForumDao fsDao = new ForumDao();

            if (conexao.abrirConexao()) {
                fsDao.configurarConexao(conexao.obterConexao());

                if (fsDao.excluirForum(Integer.parseInt(request.getParameter("codigo_forum")))) {
                    response.sendRedirect("paginaUsuario.jsp?nomeUsuario="+nomeUsuario);
                } else {
                    out.println("<h2>Não foi possível excluir o registro do fórum!</h2>");
                }
                conexao.fecharConexao();
            } else {
                out.println("<h2>Não foi possível estabelecer conexão com o banco de dados!</h2>");
            }

        } catch (Exception erro) {
            erro.printStackTrace();
            out.println("<h2>Erro do sistema:processo de exclusão do fórum!</h2>");
        }
    }
}
