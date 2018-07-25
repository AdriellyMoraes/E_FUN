/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banco_dados;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Forum;

/**
 *
 * @author Aluno
 */
public class ForumDao {
    
    protected Connection conBanco;
    protected PreparedStatement psComando;
    protected ResultSet rsRegistros;
    
    public ForumDao(){
        
    }
    
    public void configurarConexao(Connection conBanco) {
        this.conBanco = conBanco;
    }
    
    public boolean inserirForum(Forum f){
        String sql;
        try{
            sql = "INSERT INTO Forum(nome,descricao,privacidade,nomeUsuPessoa)"+
                  "VALUES('"+f.getNome()+"','"+f.getDescricao()+"','"+f.getPrivacidade()+"','"+f.getNomeUsuPessoa()+"'); ";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean alterarForum(Forum f){
        try{
            String sql = "UPDATE Forum SET nome = '"+f.getNome()+"', descricao = '"+f.getDescricao()+"', privacidade = '"+f.getPrivacidade()+"'"
                    + " WHERE codigo = '"+f.getCodigo()+"'";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean excluirForum(int codigoForum){
        try{
            String sql = "DELETE FROM Forum WHERE codigo = '"+codigoForum+"'";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean buscarForum(String nomeForum){
        try{
            String sql = "SELECT * FROM Forum WHERE nome LIKE '"+nomeForum+"';";
            psComando = conBanco.prepareStatement(sql);
            rsRegistros = psComando.executeQuery();
            rsRegistros.next();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
        public ResultSet listarForum(String nomeForum){
        try{
            String sql = "SELECT * FROM Forum WHERE nome LIKE '"+nomeForum+"';";
            psComando = conBanco.prepareStatement(sql);
            rsRegistros = psComando.executeQuery();
            rsRegistros.next();
            return rsRegistros;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }
    }
    
    public ResultSet meusForuns(String nomeUsuPessoa){
        try{
            String sql = "SELECT * FROM Forum WHERE nomeUsuPessoa = ' " +nomeUsuPessoa+ " ' ";
            psComando = conBanco.prepareStatement(sql);
            rsRegistros = psComando.executeQuery();
            rsRegistros.next();
            return rsRegistros;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }
    }
    
    public boolean participarForum(Forum f){
        String sql;
        try{
            sql = "INSERT INTO ParticipacaoForum(nomeUsuPessoa,codForum,dataHoraPart)"+
                  "VALUES('"+f.getNomeUsuPessoa()+"','"+f.getCodigo()+"',now());";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
}
