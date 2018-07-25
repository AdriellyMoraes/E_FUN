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
import model.Historia;
import banco_dados.HistoriaDao;

/**
 *
 * @author Adrielly Moraes Lustoza
 * @author Raquel de Albuquerque Maciel
 */
public class InserirHistoria extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String strNomeUsuario, strGenero, strCapitulos, strTitulo, strSinopse;
        int intCodigo = 0;
        PrintWriter out;
        
        strNomeUsuario = request.getParameter("nome_usuario");
        //strNomeUsuario = "zezinho";
        strGenero = request.getParameter("genero");
        strCapitulos = request.getParameter("txtArtigo");
        strTitulo = request.getParameter("titulo");
        strSinopse = request.getParameter("sinopse");
        
        out = response.getWriter();
        try{
            ConexaoBancoDados conexao = new ConexaoBancoDados();
            HistoriaDao hsDao = new HistoriaDao();
            Historia hs = new Historia(strGenero,strCapitulos,strTitulo,strSinopse,strNomeUsuario,intCodigo);
            
            if (conexao.abrirConexao()) {
                hsDao.configurarConexao(conexao.obterConexao());
                out.println(hs.getCapitulos());
                out.println(hs.getCodigo());
                out.println(hs.getGenero());
                out.println(hs.getSinopse());
                out.println(hs.getTitulo());
                out.println(hs.getNomeUsuPessoa());
                if(hsDao.inserirHistoria(hs)){
                    response.sendRedirect("paginaUsuario.jsp?nome_usuario="+strNomeUsuario);
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
            out.println("<h2>Erro do sistema: processo de cadastro de usuário!</h2>");
        }
        
    }
}
