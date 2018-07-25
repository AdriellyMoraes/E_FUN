/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Aluno
 */
public class Denuncia {
    
    protected int codigo;
    protected String descricao, nomeUsuPessoa;
    
    public Denuncia(){
        this.codigo = 0;
        this.descricao = "";
    }

    public Denuncia(int codigo, String descricao, String nomeUsuPessoa) {
        this.codigo = codigo;
        this.descricao = descricao;
        this.nomeUsuPessoa = nomeUsuPessoa;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    public String getNomeUsuPessoa() {
        return nomeUsuPessoa;
    }

    public void setNomeUsuPessoa(String nomeUsuPessoa) {
        this.nomeUsuPessoa = nomeUsuPessoa;
    }
    
}
