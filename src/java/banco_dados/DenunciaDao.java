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
import model.Denuncia;

/**
 *
 * @author Aluno
 */
public class DenunciaDao {
    
    protected Connection conBanco;
    protected PreparedStatement psComando;
    protected ResultSet rsRegistros;
    
    public DenunciaDao(){
        
    }
    
    public void configurarConexao(Connection conBanco) {
        this.conBanco = conBanco;
    }
    
    public boolean inserirDenuncia(Denuncia d){
        String sql;
        try{
            sql = "INSERT INTO Denuncia(dataHoraDenuncia,descricao)"+
                  "VALUES(now(),'"+d.getDescricao()+"'); "+
                    "INSERT INTO Denunciacao(nomeUsuPessoa)"+
                    "VALUES('"+d.getNomeUsuPessoa()+"');";
            psComando = conBanco.prepareStatement(sql);
            psComando.executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
}
