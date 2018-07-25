package servlets;

import banco_dados.ConexaoBancoDados;
import banco_dados.PessoaDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Adrielly Moraes Lustoza
 * @author Raquel de Albuquerque Maciel
 */
public class ExcluirPessoa extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out;
        
        out = response.getWriter();

        try {
            ConexaoBancoDados conexao = new ConexaoBancoDados();
            PessoaDao psDao = new PessoaDao();

            if (conexao.abrirConexao()) {
                psDao.configurarConexao(conexao.obterConexao());

                if (psDao.excluirPessoa(request.getParameter("nome_usuario"))) {
                    response.sendRedirect("inicial.jsp");
                } else {
                    out.println("<h2>Não foi possível excluir o registro do usuário!</h2>");
                }
                conexao.fecharConexao();
            } else {
                out.println("<h2>Não foi possível estabelecer conexão com o banco de dados!</h2>");
            }

        } catch (Exception erro) {
            erro.printStackTrace();
            out.println("<h2>Erro do sistema:processo de exclusão do usuário!</h2>");
        }
    }
}
