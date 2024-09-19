function validation_reception(id) {

    fetch('/demande/validation?id=' + id,
        {
            method: 'POST',
            headers: {
                'Content-Type': 'application/text'
            }

        })
        .then(res => res.text())
        .then(data => {
            document.getElementById("content").innerHTML = data;
        })
}
function recherche_visualisation(mode) {
    var status = [];
    var object = null;
    if (mode == 2) {
        object = {
            region: '',
            district: document.getElementById('district').value,
            commune: document.getElementById('commune').value,
            status: status,
            date_min: document.getElementById('date_debut').value,
            date_max: document.getElementById('date_fin').value,
            annee: document.getElementById('annee'),
            statuss: document.getElementById('statuss').value
        }
    }
    else if (mode == 1) {
        object = {
            region: '',
            district: '',
            commune: '',
            status: status,
            date_min: document.getElementById('date_debut').value,
            date_max: document.getElementById('date_fin').value,
            annee: document.getElementById('annee'),
            statuss: document.getElementById('statuss').value
        }
    } else {
        object = {
            region: document.getElementById('region').value,
            district: document.getElementById('district').value,
            commune: document.getElementById('commune').value,
            status: status,
            date_min: document.getElementById('date_debut').value,
            date_max: document.getElementById('date_fin').value,
            annee: document.getElementById('annee'),
            statuss: document.getElementById('statuss').value
        }
    }
    // const Object = {
    //     region: document.getElementById('region').value,
    //     district: document.getElementById('district').value,
    //     commune: document.getElementById('commune').value,
    //     status: status,
    //     date_debut: document.getElementById('date_debut').value,
    //     date_fin: document.getElementById('date_fin').value,
    //     annee: document.getElementById('annee'),
    //     statuss: document.getElementById('statuss').value
    // };
    console.log('object', (JSON.stringify(object)))
    fetch('/demande/recherche',
        {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(object)
        })
        .then(res => res.text())
        .then(data => {
            document.getElementById("content").innerHTML = data;
        })

}
function check_add(idprojet, types, mode, compte) {


    fetch('/demande/chek-supprimer?id=' + idprojet + '&&mode=' + mode + '&&types=' + types,
        {
            method: 'POST',
            headers: {
                'Content-Type': 'application/text'
            }
        })
        .then(res => res.text())
        .then(data => {
            recherche_ajout(types, compte);
            console.log('ISaiiaiaiiaia', types);
            document.getElementById("session").innerHTML = data;

        });

}
function recherche_ajout(types, mode) {
    var recherche = null
    if (mode == 2) {
        recherche = {
            region: '',
            district: document.getElementById('districtlibelle').value,
            commune: document.getElementById('communelibelle').value
        }
    }
    else if (mode == 1) {
        recherche = {
            region: '',
            district: '',
            commune: document.getElementById('communelibelle').value
        }
    } else {
        recherche = {
            region: document.getElementById('region_libelle').value,
            district: document.getElementById('districtlibelle').value,
            commune: document.getElementById('communelibelle').value
        }
    }


    console.log(types);
    fetch('/demande/recherche-ajout?types=' + types,
        {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(recherche)
        })
        .then(res => res.text())
        .then(data => {
            document.getElementById("contents").innerHTML = data;
        });

}
function rech(valeur) {
    var Object = null
    if (valeur == "2") {
        Object
        Object = {
            district: document.getElementById('iddistrict').value,
            commune: document.getElementById('idcommune').value
        };
    } else {
        Object = {
            region: document.getElementById('idregion').value,
            district: document.getElementById('iddistrict').value,
            commune: document.getElementById('idcommune').value
        };
    }

    console.log('object', Object);
}
function afficher() {
    let input = document.getElementById('form-demande').value;
    var inputContainer = document.getElementById("champSupplementaire");
    if (input == 3) {
        inputContainer.style.display = "block";
    } else {
        inputContainer.style.display = "none";
    }
}
function getCommune() {
    var region = document.getElementById('iddistrict').value;
    if (region == '..............') {
        document.getElementById("commune").innerHTML = '<select id="ranoD" class="form-select" ></select>';
    } else {
        fetch('/tanana/list-commune?param=' + region,
            {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/text'
                }

            })
            .then(res => res.text())
            .then(data => {
                document.getElementById("commune").innerHTML = data;
            });
    }

}
function find_commune() {
    var district = document.getElementById('districtlibelle').value;
    var region = document.getElementById('region_libelle').value;
    if (region == '..............' || district == '..............') {
        document.getElementById("commune").innerHTML = '<select id="communelibelle" class="form-select" ></select>';
    } else {
        fetch('/tanana/find-commune?region=' + region + '&&district=' + district,
            {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/text'
                }

            })
            .then(res => res.text())
            .then(data => {
                document.getElementById("commune").innerHTML = data;
            });
    }

}

function getDistrict() {
    var region = document.getElementById('idregion').value;
    if (region == '..............') {
        document.getElementById("district").innerHTML = '<select id="ranoD" class="form-select" ></select>';
        document.getElementById("commune").innerHTML = '<select id="ranoD" class="form-select" ></select>';
    } else {
        fetch('/tanana/list-district?param=' + region,
            {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/text'
                }

            })
            .then(res => res.text())
            .then(data => {
                document.getElementById("district").innerHTML = data;
                document.getElementById("commune").innerHTML = '<select id="ranoD" class="form-select" ></select>';

            });
    }
}
function find_district() {
    var region = document.getElementById('region_libelle').value;
    if (region == '..............') {
        document.getElementById("district").innerHTML = '<select id="districtlibelle" class="form-select" ></select>';
        document.getElementById("commune").innerHTML = '<select id="communelibelle" class="form-select" ></select>';
    } else {
        fetch('/tanana/find-district?region=' + region,
            {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/text'
                }

            })
            .then(res => res.text())
            .then(data => {
                document.getElementById("district").innerHTML = data;
                document.getElementById("commune").innerHTML = '<select id="communelibelle" class="form-select" ></select>';

            });
    }
}

function ajout_projet(types) {
    var object = {
        idcommune: document.getElementById('idcommune').value,
        nom_demandeur: document.getElementById('nom_du_demandeur').value,
        fichier_bv: document.getElementById('fichier_bv').value,
        nom_fichier: document.getElementById('name_fichier').value,
        // description:document.getElementById('description').value,    
        date_bv: document.getElementById('date_bv').value,
        demande: document.getElementById('demande').value,
        probleme: document.getElementById('probleme').value,
        idtypes_demandes: document.getElementById('idtypes_demandes').value,
        idtypes_traveaux: document.getElementById('idtypes_traveaux').value
    }
    console.log('object', object);
}

function page_nouveaux_projet() {
    fetch('/demande/page-demande-ajout',
        {
            method: 'GET',
            headers: {
                'Content-Type': 'application/text'
            }

        })
        .then(res => res.text())
        .then(data => {
            document.getElementById("nouveau").innerHTML = data;
        });
}

function ajout_parcours(idparcours) {
    fetch('/demande/ajout-parcours?parcours_annee=' + idparcours,
        {
            method: 'POST',
            headers: {
                'Content-Type': 'application/text'
            }
        })
        .then(res => res.text())
        .then(data => {
            console.log('', data);
        });
}