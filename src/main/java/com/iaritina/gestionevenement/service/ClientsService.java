package com.iaritina.gestionevenement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.iaritina.gestionevenement.dao.ClientDAO;
import com.iaritina.gestionevenement.model.Clients;

@Service
public class ClientsService {
    @Autowired
    private ClientDAO clientDAO;
    public void inscription(Clients clients){
        clients.setMots_de_passe(crypter_le_mot_de_passe(clients.getMots_de_passe()));
        try {
            clientDAO.inscription(clients);
        } catch (Exception e) {
            throw e;
        }
    }
    public static String crypter_le_mot_de_passe(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String hashedPassword = encoder.encode(password);
        return hashedPassword;
    }
    public Clients login (Clients clients){
        Clients resultat=null;
        clients.setMots_de_passe(crypter_le_mot_de_passe(clients.getMots_de_passe()));
        try {
            resultat=clientDAO.login(clients);
        } catch (Exception e) {
            throw e;
        }
        return resultat;
    }
}
