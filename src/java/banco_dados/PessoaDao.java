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
import model.Pessoa;

/**
 *
 * @author Aluno
 */
public class PessoaDao {
    
    protected Connection conBanco;
    protected PreparedStatement psComando;
    protected ResultSet rsRegistros;
    
    public PessoaDao(){
        
    }
    
    public void configurarConexao(Connection conBanco) {
        this.conBanco = conBanco;
    }
    
    public boolean inserirPessoa(Pessoa p){
        String sql;
        try{
            sql = "INSERT INTO Pessoa(nomeUsuario,nome,email,dataNasc,senha)"+
                  "VALUES('"+p.getNomeUsuario()+"','"+p.getNome()+"','"+p.getEmail()+"',"+ 
                  "'"+p.getDataNasc()+"','"+p.getSenha()+"');";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean alterarPessoa(Pessoa p, String nomeUsuario){
        try{
            String sql = "UPDATE Pessoa SET nomeUsuario = '"+p.getNomeUsuario()+"', nome = '"+p.getNome()+"', email = '"+p.getEmail()+"', dataNasc = '"+p.getDataNasc()+"', senha = '"+p.getSenha()+"'"
                    + " WHERE nomeUsuario = '"+nomeUsuario+"';";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean excluirPessoa(String nomeUsuario){
        try{
            String sql = "DELETE FROM Pessoa WHERE nomeUsuario = '"+nomeUsuario+"';";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean buscarPessoa(String nomeUsu){
        try{
            String sql = "SELECT * FROM Pessoa WHERE nomeUsuario LIKE '"+nomeUsu+"';";
            psComando = conBanco.prepareStatement(sql);
            rsRegistros = psComando.executeQuery();
            rsRegistros.next();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    public ResultSet pesquisarPessoa(String nomeUsu){
        try{
                String sql = "SELECT * FROM Pessoa WHERE nomeUsuario LIKE '"+nomeUsu+"';";
            psComando = conBanco.prepareStatement(sql);
            rsRegistros = psComando.executeQuery();
            rsRegistros.next();
            return rsRegistros;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }
    }
    
        public ResultSet listarPessoa(String nomeUsu){
        try{
                String sql = "SELECT * FROM Pessoa WHERE nomeUsuario = '"+nomeUsu+"';";
            psComando = conBanco.prepareStatement(sql);
            rsRegistros = psComando.executeQuery();
            rsRegistros.next();
            return rsRegistros;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }
    }
    
        public ResultSet listarPessoa(String em, String se){
        String sql="";
        try{
            sql = "SELECT * FROM Pessoa WHERE email = '"+em+"' AND senha = '"+se+"';";
            
            psComando = conBanco.prepareStatement(sql);
            rsRegistros = psComando.executeQuery();
            rsRegistros.next();
            return rsRegistros;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }
    }
    
}
