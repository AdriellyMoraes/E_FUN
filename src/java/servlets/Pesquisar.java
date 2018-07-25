/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import banco_dados.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adrielly Moraes Lustoza
 * @author Raquel de Albuquerque Maciel
 */
public class Pesquisar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ResultSet rsRegistro;
        PrintWriter out;
        String nomeUsuarioP,nomeP;
        String tituloH,sinopseH,nomeUsuPessoaH;
        String nomeF;
        String pesquisa;

        pesquisa = request.getParameter("pesquisar");

        out = response.getWriter();
        /*response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />");
        out.println("<title>SGC - Versão 1.0</title>");
        out.println("<link href='clinica_medica.css' rel='stylesheet' type='text/css' />");
        out.println("</head>");
        out.println("<body class='FundoPagina'>");
        out.println("<p class='TituloAplicacao'>SGC - Sistema de Gestão de Clínicas 1.0 </p>");
        out.println("<p class='TituloPagina'>Resultado da Pesquisa </p>");*/
        try {
            ConexaoBancoDados conexao = new ConexaoBancoDados();

            PessoaDao ps = new PessoaDao();
            HistoriaDao hs = new HistoriaDao();
            ForumDao fs = new ForumDao();
            
            if (conexao.abrirConexao()) {
                ps.configurarConexao(conexao.obterConexao());

                if(ps.buscarPessoa(pesquisa)){
                    rsRegistro = ps.pesquisarPessoa(pesquisa);
                    out.println("Nome de Usuário: "+rsRegistro.getString("nomeUsuario")+"<br>");
                    out.println("Nome: "+rsRegistro.getString("nome")+"<br><br><br>");
                }
                
                if(hs.buscarHistoria(pesquisa)){
                    rsRegistro = hs.listarHistoria(pesquisa);
                    out.println("Título: "+rsRegistro.getString("titulo")+"<br>");
                    out.println("Sinopse: "+rsRegistro.getString("sinopse")+"<br>");
                    out.println("Nome de Usuário: "+rsRegistro.getString("nomeUsuPessoa")+"<br><br><br>");
                }
                
                if(fs.buscarForum(pesquisa)){
                    rsRegistro = fs.listarForum(pesquisa);
                    out.println("Nome do Fórum: "+rsRegistro.getString("nome")+"<br><br><br>");
                }
                conexao.fecharConexao();
            } else {
                out.println("<h2>Não foi possível estabelecer conexão com o banco de dados!</h2>");
            }
        } catch (Exception erro) {
            erro.printStackTrace();
            out.println("<h2>Erro do sistema:processo de cadastro do funcionário!</h2>");
        }
    }
}
