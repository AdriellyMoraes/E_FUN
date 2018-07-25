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
public class Pessoa {
    
    protected String nomeUsuario,
                   nome,
                   email,
                   senha, dataNasc;
    
    public Pessoa(){
        this.nomeUsuario = "";
        this.nome = "";
        this.email = "";
        this.senha = "";
        this.dataNasc = "";
    }
    
    public Pessoa(String nomeUsuario, String nome, String email, String senha, String dataNasc){
        this.nomeUsuario = nomeUsuario;
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.dataNasc = dataNasc;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(String dataNasc) {
        this.dataNasc = dataNasc;
    }
    
}
