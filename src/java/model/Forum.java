/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author Aluno
 */
public class Forum {
    
    protected String nome, descricao, nomeUsuPessoa, privacidade;
    protected int codigo;
    
    public Forum(){
        this.nome = "";
        this.descricao = "";
        this.nomeUsuPessoa = "";
        this.privacidade = "";
        this.codigo = 0;
    }
    
    public Forum(String nome, String descricao, String nomeUsuPessoa, String privacidade, int codigo){
        this.nome = nome;
        this.descricao = descricao;
        this.nomeUsuPessoa = nomeUsuPessoa;
        this.privacidade = privacidade;
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
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

    public String getPrivacidade() {
        return privacidade;
    }

    public void setPrivacidade(String privacidade) {
        this.privacidade = privacidade;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    
}
