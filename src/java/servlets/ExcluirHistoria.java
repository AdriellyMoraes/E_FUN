package servlets;

import banco_dados.ConexaoBancoDados;
import banco_dados.HistoriaDao;
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
public class ExcluirHistoria extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomeUsuario;
        nomeUsuario = request.getParameter("nome_Usuario");
        PrintWriter out;
        
        out = response.getWriter();

        try {
            ConexaoBancoDados conexao = new ConexaoBancoDados();
            HistoriaDao hsDao = new HistoriaDao();

            if (conexao.abrirConexao()) {
                hsDao.configurarConexao(conexao.obterConexao());

                if (hsDao.excluirHistoria(Integer.parseInt(request.getParameter("codigo_historia")))) {
                    response.sendRedirect("paginaUsuario.jsp?nomeUsuario="+nomeUsuario);
                } else {
                    out.println("<h2>Não foi possível excluir o registro da história!</h2>");
                }
                conexao.fecharConexao();
            } else {
                out.println("<h2>Não foi possível estabelecer conexão com o banco de dados!</h2>");
            }

        } catch (Exception erro) {
            erro.printStackTrace();
            out.println("<h2>Erro do sistema:processo de exclusão da história!</h2>");
        }
    }
}
