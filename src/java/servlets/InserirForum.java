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
import model.Forum;
import banco_dados.ForumDao;

/**
 *
 * @author Adrielly Moraes Lustoza
 * @author Raquel de Albuquerque Maciel
 */
public class InserirForum extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome, descricao, nomeUsuPessoa, privacidade="";
        int codigoForum = 0;
        PrintWriter out;
        
        nome = request.getParameter("nome");
        descricao = request.getParameter("descricao");
        nomeUsuPessoa = request.getParameter("nome_usuario");
        
        if(request.getParameter("privado") != null){
            privacidade = "privado";
        }
        if(request.getParameter("publico") != null){
            privacidade = "publico";
        }
        
        out = response.getWriter();
        try{
            ConexaoBancoDados conexao = new ConexaoBancoDados();
            ForumDao fsDao = new ForumDao();
            Forum fs = new Forum(nome,descricao,nomeUsuPessoa,privacidade,codigoForum);
            
            if (conexao.abrirConexao()) {
                fsDao.configurarConexao(conexao.obterConexao());
                out.println(nome);
                out.println(descricao);
                out.println(nomeUsuPessoa);
                out.println(privacidade);
                out.println(codigoForum);
                if(fsDao.inserirForum(fs)){
                response.sendRedirect("paginaUsuario.jsp?nomeUsuario="+nomeUsuPessoa);
                }else{
                   out.println();
                   out.println("Não foi possivel cadastrar");
                }      
                conexao.fecharConexao();
                
            }else{
                out.println("<h2>Não foi possível estabelecer conexão com o banco de dados!</h2>");
            }
            
        } catch (Exception erro) {
            erro.printStackTrace();
            out.println("<h2>Erro do sistema: processo de cadastro de fórum!</h2>");
        }
        
    }
}
