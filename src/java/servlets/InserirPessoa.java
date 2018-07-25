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

/**
 *
 * @author Adrielly Moraes Lustoza
 * @author Raquel de Albuquerque Maciel
 */
public class InserirPessoa extends HttpServlet {

    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String strNomeUsuario, strNome, strEmail, strSenha, strDataNasc;
       
        PrintWriter out;
        
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
                out.println(ps.getEmail());
                out.println(ps.getDataNasc()); 
                 out.println(ps.getNome());
                  out.println(ps.getNomeUsuario());
                           out.println(ps.getSenha());
                if(psDao.inserirPessoa(ps)){
                response.sendRedirect("paginaUsuario.jsp?nome_usuario="+strNomeUsuario);
   
                }else{
                   
                    
                   out.println();
                   out.println("Não foi possivel cadastrarrr");
                    
                }      
                conexao.fecharConexao();
                
            }else{
                out.println("<h2>Não foi possível estabelecer conexão com o banco de dados!</h2>");
            }
            
        } catch (Exception erro) {
            erro.printStackTrace();
            out.println("<h2>Erro do sistema: processo de cadastro de usuário!</h2>");
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
