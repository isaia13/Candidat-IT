<%@page import="com.iaritina.gestionevenement.entity.compte.*"%>
<%@page import="com.iaritina.gestionevenement.entity.demande.*"%>
<%@page import="com.iaritina.gestionevenement.entity.view.Carde_Demande"%>
<%
    Compte compte=(Compte)session.getAttribute("Compte");
%>




<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" href="/demande/dashboard">
          <i class="bi bi-grid"></i>
          <span>Tableau de bord</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="/demande/Visualisation">
          <i class="bi bi-layout-text-window-reverse"></i>
          <span>Visualisation Projet</span>
        </a>
      </li>
      <% if(compte.getIdtypeCompte()==1){ %>
        <li class="nav-item">
          <a class="nav-link " data-bs-target="#projet" data-bs-toggle="collapse" href="#">
            <i class="bi bi-layout-text-window-reverse"></i><span>Projet</span><i class="bi bi-chevron-down ms-auto"></i>
          </a>
          <ul id="projet" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
            
            <li>
              <a href="/demande/page-ajout">
                <i class="bi bi-circle"></i><span>Ajout demande</span>
              </a>
            </li>
          </ul>
        </li>
      <% } else if(compte.getIdtypeCompte()==2){ %>
        <li class="nav-item">
          <a class="nav-link " data-bs-target="#pta" data-bs-toggle="collapse" href="#">
            <i class="bi bi-layout-text-window-reverse"></i><span>PTA</span><i class="bi bi-chevron-down ms-auto"></i>
          </a>
          <ul id="pta" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
            <li class="nav-item">
              <a class="nav-link collapsed" href="/demande/page-ajout-parcours?types=PTA">
                <i class="bi bi-grid"></i>
                <span>Ajout</span>
              </a>
            </li><!-- End Dashboard Nav -->
            <li>
              <a href="/demande/list-parcours?types=PTA">
                <i class="bi bi-circle"></i><span>Liste</span>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
        <a class="nav-link collapsed" href="/demande/ptf-projet ">
          <i class="bi bi-layout-text-window-reverse"></i>
          <span>PTF</span>
        </a>
      </li>
      <% } else{%>
      <li class="nav-item">
        <a class="nav-link collapsed" href="/demande/list-parcours?types=PTA">
          <i class="bi bi-layout-text-window-reverse"></i>
          <span>PTA</span>
        </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link " data-bs-target="#LFi" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>LFI et LFR</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="LFi" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
          
          <li>  
            <a href="/demande/page-ajout-parcours?types=LFI" >
              <i class="bi bi-circle"></i><span>Ajout LFI</span>
            </a>
          </li>
          <li>  
            <a href="/demande/page-ajout-parcours?types=LFR" >
              <i class="bi bi-circle"></i><span>Ajout LFR</span>
            </a>
          </li>
          <li>
            <a href="/demande/list-parcours?types=LFI">
              <i class="bi bi-circle"></i><span>Visualisation</span>
            </a>
          </li>
        </ul>
      </li>
      <li c lass="nav-item">
        <a class="nav-link " data-bs-target="#etapes" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>Etapes des projets </span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="etapes" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
          <li>  
            <a href="/demande/page-appel" >
              <i class="bi bi-circle"></i><span>Appel d'offre</span>
            </a>
          </li>
          <li>
            <a href="/demande/page-attribution">
              <i class="bi bi-circle"></i><span>Attribution du marcheé</span>
            </a>
          </li>
          <li>
            <a href="/demande/page-os-donne">
              <i class="bi bi-circle"></i><span>Attribution OS </span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->
      <% } %><!-- End Tables Nav -->
      
      <li>
        <a class="dropdown-item d-flex align-items-center" href="<%=compte.getURL()%>">
          <i class="bi bi-box-arrow-right"></i>
          <span>Deconnection</span>
        </a>
      </li>
     
    </ul>
</aside>