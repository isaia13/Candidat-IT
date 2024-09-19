package com.iaritina.gestionevenement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.iaritina.gestionevenement.model.Clients;
// Acces au Base de donnee
@Repository
public class ClientDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    // Fonction pour connecter 
    public Clients login (Clients clients){
        Clients resultat=new Clients();
        String sql="select * from clients where mots_de_passe ='"+clients.getMots_de_passe()+"' and email ='"+clients.getEmail()+"'" ;
        List<Clients> listClients=null;
        try {
            listClients= (List<Clients>) jdbcTemplate.query(sql,
                    new BeanPropertyRowMapper<Clients>(Clients.class));   
                    if(listClients!=null && listClients.size()>0){
                        resultat=listClients.get(0);
                    }
        } catch (Exception e) {
            throw e;
        }
        return resultat;
    } 
    // Fonction d'inscription 
    public void inscription(Clients clients){
        String sql="insert into clients(nom,email,mots_de_passe) values(?,?,?)";
        try {
            jdbcTemplate.update(sql, preparedStatement -> {
                preparedStatement.setString(1, clients.getNom());
                preparedStatement.setString(2, clients.getEmail());
                preparedStatement.setString(3, clients.getMots_de_passe());
            });
        } catch (Exception e) {
            throw e;
        }
        
    }
}
