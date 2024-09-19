package com.iaritina.gestionevenement.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iaritina.gestionevenement.model.Clients;
import com.iaritina.gestionevenement.service.ClientsService;




@Controller
@RequestMapping("*")
public class HomeController {
    @Autowired
    private ClientsService clientsService;

    @GetMapping("/")
    private String home(){
        return "client/index";
    }
    @PostMapping("/connexion")
    public String Login(@ModelAttribute Clients compte, Model model,HttpSession session) {
        String page = "client/index";
        Clients value=null;
        try {
            value=clientsService.login(compte);
            session.setAttribute("client", value);
            page="page/acceuil";
        } catch (Exception e) {
            model.addAttribute("erreur", "Mots de passe incorrect ou Mail non existant");
        }
        
        return page;
    }

    @GetMapping("/page-inscription")
    public String page_inscription() {
        String value="";
        try {
            value="page/inscription";
        } catch (Exception e) {
            throw e;
        }
        return value;
    }
    @PostMapping("/inscription")
    public String inscription(@ModelAttribute Clients compte,Model model) {
        String page = "page/inscription";
        try {
            clientsService.inscription(compte);
            model.addAttribute("message", "Inscription reussie");
            model.addAttribute("couleur", "Green");
        } catch (Exception e) {
            model.addAttribute("message", "Inscription refuser");
            model.addAttribute("couleur", "red");
        }
        
        return page;
    }
    
}
