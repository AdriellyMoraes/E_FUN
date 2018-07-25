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
public class Supervisor {
    
    protected String cpf,
                     nome,
                     email;
    protected Date dataDemissao, dataAdmissao;
    
    public Supervisor(){
        this.cpf = "";
        this.nome = "";
        this.email = "";
        this.dataDemissao = new Date();
        this.dataAdmissao = new Date();
    }
    
    public Supervisor(String cpf, String nome, String email, Date dataDemissao, Date dataAdmissao){
        this.cpf = cpf;
        this.nome = nome;
        this.email = email;
        this.dataDemissao = dataDemissao;
        this.dataAdmissao = dataAdmissao;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
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

    public Date getDataDemissao() {
        return dataDemissao;
    }

    public void setDataDemissao(Date dataDemissao) {
        this.dataDemissao = dataDemissao;
    }

    public Date getDataAdmissao() {
        return dataAdmissao;
    }

    public void setDataAdmissao(Date dataAdmissao) {
        this.dataAdmissao = dataAdmissao;
    }
    
    
    
}
