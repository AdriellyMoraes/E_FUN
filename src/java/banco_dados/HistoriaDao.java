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
import model.Historia;

/**
 *
 * @author Adrielly Moraes Lustoza
 * @author Raquel de Albuquerque Maciel
 */
public class HistoriaDao {
    
    protected Connection conBanco;
    protected PreparedStatement psComando;
    protected ResultSet rsRegistros;
    
    public HistoriaDao(){
        
    }
    
    public void configurarConexao(Connection conBanco) {
        this.conBanco = conBanco;
    }
    
    public boolean inserirHistoria(Historia h){
        String sql;
        try{
            sql = "INSERT INTO Historia(genero,capitulos,titulo,sinopse,nomeUsuPessoa)"+
                  "VALUES('"+h.getGenero()+"','"+h.getCapitulos()+"','"+h.getTitulo()+"',"+ 
                  "'"+h.getSinopse()+"','"+h.getNomeUsuPessoa()+"'); ";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean alterarHistoria(Historia h){
        try{
            String sql = "UPDATE Historia SET genero = '"+h.getGenero()+"', capitulos = '"+h.getCapitulos()+"', titulo = '"+h.getTitulo()+"', sinopse = '"+h.getSinopse()+"'"
                    + "WHERE codigo = '"+h.getCodigo()+"'";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean excluirHistoria(int codigoHistoria){
        try{
            String sql = "DELETE FROM Historia WHERE codigo = '"+codigoHistoria+"'";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean buscarHistoria(String tituloHistoria){
        try{
            String sql = "SELECT * FROM Historia WHERE titulo LIKE '"+tituloHistoria+"';";
            psComando = conBanco.prepareStatement(sql);
            rsRegistros = psComando.executeQuery();
            rsRegistros.next();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
        public ResultSet listarHistoria(String tituloHistoria){
        try{
            String sql = "SELECT * FROM Historia WHERE titulo LIKE '"+tituloHistoria+"';";
            psComando = conBanco.prepareStatement(sql);
            rsRegistros = psComando.executeQuery();
            rsRegistros.next();
            return rsRegistros;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }
    }
    
    public ResultSet minhasHistorias(String nomeUsuPessoa){
        try{
            String sql = "SELECT * FROM Historia WHERE nomeUsuPessoa = ' " +nomeUsuPessoa+ " ' ";
            psComando = conBanco.prepareStatement(sql);
            rsRegistros = psComando.executeQuery();
            rsRegistros.next();
            return rsRegistros;
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }
    }
    
    public boolean comentarHistoria(Historia h, String descricao){
        String sql;
        try{
            sql = "INSERT INTO ComentarioHistoria(nomeUsuPessoa,codHistoria,dataHoraComent,descricao)"+
                    "VALUES('"+h.getNomeUsuPessoa()+"','"+h.getCodigo()+"',now(),'"+descricao+"');";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean compartilharHistoria(Historia h){
        String sql;
        try{
            sql = "INSERT INTO CompartilhamentoHistoria(nomeUsuPessoa,codHistoria,dataHoraComp)"+
                    "VALUES('"+h.getNomeUsuPessoa()+"','"+h.getCodigo()+"',now());";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean avaliarHistoria(Historia h){
        String sql;
        try{
            sql = "INSERT INTO AvaliacaoHistoria(nomeUsuPessoa,codHistoria,dataHoraCurt)"+
                    "VALUES('"+h.getNomeUsuPessoa()+"','"+h.getCodigo()+"',now());";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
}
