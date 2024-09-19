package com.iaritina.gestionevenement.model;

public class Clients {
    int id;
    String nom;
    String email;
    String mots_de_passe;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
   
    public String getMots_de_passe() {
        return mots_de_passe;
    }
    public void setMots_de_passe(String mots_de_passe) {
        this.mots_de_passe = mots_de_passe;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
}
