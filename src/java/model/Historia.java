/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Time;
import java.sql.Date;

/**
 *
 * @author Aluno
 */
public class Historia {
    
    protected   String  genero,
                        capitulos,
                        titulo,
                        sinopse,
                        nomeUsuPessoa;
    protected   int     codigo;
    
    public Historia(){
        this.genero = "";
        this.capitulos = "";
        this.titulo = "";
        this.sinopse = "";
        this.nomeUsuPessoa = "";
        this.codigo = 0;
    }


    public Historia(String genero, String capitulos, String titulo, String sinopse, String nomeUsuPessoa, int codigo) {
        this.genero = genero;
        this.capitulos = capitulos;
        this.titulo = titulo;
        this.sinopse = sinopse;
        this.nomeUsuPessoa = nomeUsuPessoa;
        this.codigo = codigo;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getSinopse() {
        return sinopse;
    }

    public void setSinopse(String sinopse) {
        this.sinopse = sinopse;
    }

    public String getNomeUsuPessoa() {
        return nomeUsuPessoa;
    }

    public void setNomeUsuPessoa(String nomeUsuPessoa) {
        this.nomeUsuPessoa = nomeUsuPessoa;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getCapitulos() {
        return capitulos;
    }

    public void setCapitulos(String capitulos) {
        this.capitulos = capitulos;
    }
    
}
