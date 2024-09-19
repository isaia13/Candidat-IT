
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<html lang="fr">
    <jsp:include page="../head.jsp"/>;
<body>
<main>
  <div class="container">
    <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
            <div class="d-flex justify-content-center py-4">
              <a href="index.html" class="logo d-flex align-items-center w-auto">
                <img src="${pageContext.request.contextPath}/assets/img/logo_mineau_mg.png" alt="">
                <span class="d-none d-lg-block">MEAH</span>
              </a>
            </div><!-- End Logo -->
            <div class="card mb-3">
              <div class="card-body">
                <div class="pt-4 pb-2">
                  <h5 class="card-title text-center pb-0 fs-4">Creation compte Client</h5>
                  <p class="text-center small">Entrez votre personnalité en détails </p>
                </div>
                <div>
                    <p style="color: ${couleur};">${message}</p>
                </div>
                <form class="row g-3 needs-validation" action="/inscription"  method="POST" enctype="multipart/form-data" novalidate>
                  <div class="col-12">
                    <label for="yourEmail" class="form-label">Votre Nom</label>
                    <input type="nom" name="nom" class="form-control"  required>
                    <div class="invalid-feedback">S'il vous plait votre nom</div>
                  </div>
                  <div class="col-12">
                    <label for="yourEmail" class="form-label">Votre Email</label>
                    <input type="email" name="email" class="form-control" id="yourEmail" required>
                    <div class="invalid-feedback">S'il vous plait votre adresse email</div>
                  </div>
                  <div class="col-12">
                    <label for="yourPassword" class="form-label">Mot de passe</label>
                    <input type="password" name="mots_de_passe" class="form-control" id="yourPassword" required>
                    <div class="invalid-feedback">S'il vous plait votre mot de passe</div>
                  </div>
                    <div class="col-12">
                      <button type="submit" class="btn btn-primary" >Creer</button>
                    </div>
                    
                  </div>
                </form>
              </div>
            </div>
            <div class="credits">
              Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</main>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
<!-- Vendor JS Files -->
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script>
function getDistrict(){
      var region=document.getElementById('idregion').value;
       fetch('/tanana/list-district?param='+region,
        {
            method: 'GET',
            headers: {
                    'Content-Type': 'application/text'
            }
        
        })
        .then(res => res.text())
        .then(data => {
          document.getElementById("district").innerHTML=data;
          document.getElementById("commune").innerHTML='<select id="ranoD" class="form-select" ></select>';
          
        });
    }
    function getCommune(){
      var region=document.getElementById('iddistrict').value;
       fetch('/tanana/list-commune?param='+region,
        {
            method: 'GET',
            headers: {
                    'Content-Type': 'application/text'
            }
        
        })
        .then(res => res.text())
        .then(data => {
          document.getElementById("commune").innerHTML=data;
        });
    }
</script>
</body>
</html>
