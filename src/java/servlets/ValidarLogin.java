/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import banco_dados.ConexaoBancoDados;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Pessoa;
import banco_dados.PessoaDao;
import java.sql.ResultSet;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.swing.JOptionPane;

/**
 *
 * @author Adrielly Moraes Lustoza
 * @author Raquel de Albuquerque Maciel
 */
@WebServlet(name = "ValidarLogin", urlPatterns = {"/ValidarLogin"})
public class ValidarLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String strEmail, strSenha;
        ResultSet rsRegistro;
        PrintWriter out;
        
        strEmail = request.getParameter("email");
        strSenha = request.getParameter("senha");
        
        out = response.getWriter();
        try{
            ConexaoBancoDados conexao = new ConexaoBancoDados();
            PessoaDao psDao = new PessoaDao();
            if (conexao.abrirConexao()) {
                psDao.configurarConexao(conexao.obterConexao());
                rsRegistro = psDao.listarPessoa(strEmail,strSenha);
                String e = rsRegistro.getString("email");
                String s = rsRegistro.getString("senha");
                if(rsRegistro!=null){
                    if(e.equals(strEmail) && s.equals(strSenha)){
                        response.sendRedirect("paginaUsuario.jsp?nome_usuario="+rsRegistro.getString("nomeUsuario"));
                    }
                    if(e.equals(strEmail) && !s.equals(strSenha)){
                        response.sendRedirect("erroEmail.jsp");
                    }
                }else{
                out.println("<h2>Usuário não cadastrado!!</h2>");
                conexao.fecharConexao();}
            }else{
                out.println("<h2>Não foi possível estabelecer conexão com o banco de dados!</h2>");
            }
            
        } catch (Exception erro) {
            erro.printStackTrace();
            response.sendRedirect("erroEmail.jsp");
        }
        
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

