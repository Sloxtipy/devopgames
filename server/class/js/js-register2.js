function validateUser(isDoctor){
	if (isDoctor==1){
			if (jQuery("#name").val()==""){
			showMessageErr2("Alerta: debe llenar el campo Nombre");  return false
			}
			else if (jQuery("#lname").val()==""){
			showMessageErr2("Alerta: debe llenar el campo Apellido"); return false
			}
			else if ((jQuery("#sex1").is(':checked')==false)&&(jQuery("#sex2").is(':checked')==false)){
			showMessageErr2("Alerta: debe seleccionar el sexo"); return false
			}
			 else if (jQuery("#email").val()==""){
			showMessageErr2("Alerta: debe llenar el campo Email");  return false
			}
			else if (jQuery("#phone").val()==""){
			showMessageErr2("Alerta: debe llenar el campo");  return false
			}
			else if (jQuery("#clinic").val()=="-1"){
			showMessageErr2("Alerta: seleccionar la cl&iacute;nica"); return false
			}
				} else {
						if (jQuery("#usrLogin").val()==""){
								showMessageErr("Alerta: debe llenar el campo USUARIO."); //jQuery("#usrLogin").focus();
						return false
						}
						else if (jQuery("#pass1").val()==""){
								showMessageErr("Alerta: debe llenar el campo CLAVE"); //jQuery("#pass1").focus();
						 return false
						}
						else if (jQuery("#pass2").val()==""){
									showMessageErr("Alerta: debe llenar el campo CLAVE2");// jQuery("#pass2").focus();
						 return false
						}
						else if (jQuery("#pass1").val()!=jQuery("#pass2").val()){
								showMessageErr("Alerta: las claves no concuerdan");// jQuery("#pass2").focus();
						 return false
						}						 
						else if (jQuery("#firstname").val()==""){
									showMessageErr("Alerta: debe llenar el campo NOMBRE");// jQuery("#firstname").focus();
						return false
						}
						 else if (jQuery("#lastname").val()==""){
							 		showMessageErr("Alerta: debe llenar el campo APELLIDO"); //jQuery("#lastname").focus();
						return false
						}										
						else if (jQuery("#ptemail").val()==""){
								showMessageErr("Alerta: debe llenar el campo EMAIL"); //jQuery("#ptemail").focus();
						 return false
						}
						else if (jQuery("#ptcountry").val()=="-1"){
									showMessageErr("Alerta: seleccionar el pa&iacute;s");// jQuery("#ptcountry").focus();
						 return false
						}						
						else if (jQuery("#babyName").val()==""){
									showMessageErr("Alerta: debe llenar el campo Nombre del Bebe");
						return false
						}
						else if (jQuery("#babyLastName").val()==""){
									showMessageErr("Alerta: debe llenar el campo Apellido de su Bebe");
						return false
						}
						 else if (jQuery("#babyNick").val()==""){
							 		showMessageErr("Alerta: debe llenar el campo Apodo de su Bebe");
						return false
						}
						else if (jQuery("#babyBirthDay").val()==""){
								showMessageErr("Alerta: debe seleccionar la fecha de nacimiento");
						return false
						}
						 else if ((jQuery("#bbsex1").is(':checked')==false)&&(jQuery("#bbsex2").is(':checked')==false)){
							 	showMessageErr("Alerta: debe seleccionar el sexo");
						return false
						}
						else if (jQuery("#babyClinic").val()=="-"){
								showMessageErr("Alerta:  debe seleccionar una cl&iacute;nica.");
						jQuery("#babyClinic").focus(); return false
						}
						else if (jQuery("#babyDoctor").val()=="-"){
								showMessageErr("Alerta:  debe seleccionar un doctor.");
						return false
						}

	}
	return true
}
function showMessageErr(theMsg){
jQuery("#ajaxError").fadeIn();
jQuery("#ajaxError").html(theMsg);
setTimeout(function(){ jQuery("#ajaxError").css("display","none"); }, 4000);
}

function showMessageErr2(theMsg){
jQuery("#ajaxError2").fadeIn();
jQuery("#ajaxError2").html(theMsg);
setTimeout(function(){ jQuery("#ajaxError2").css("display","none"); }, 4000);
}

function validateSubmit(){
if (!validateUser(jQuery("#typeusr").val())){
	return false
}

var formData = jQuery("#frm_register").serialize();
if (jQuery("#typeusr").val()==1){
     jQuery("#loaderDoctor").fadeIn()
     } else {
         jQuery("#ajaxLoader").fadeIn();
     }
	jQuery("#ajaxLoader").fadeIn();
	jQuery.ajax({type: "POST",url: urlProcess
	,data:formData
	, cache:0
	, dataType: 'text'
	, success: postSubmit 
	}); 
}

function postSubmit(data){
		if (jQuery("#typeusr").val()==1)
			{
				 jQuery("#loaderDoctor").css("display","none");
			} else
			{
			jQuery("#ajaxLoader").css("display","none");}
			try {
					var parsed = JSON.parse(data);
					var errorID = parsed.errorID;
					var errorMessage = parsed.errorDesES;
					if (errorID=="0"){
					var token = parsed.token;
					jQuery("#selectionArea").css("display","none");
					jQuery("#doctorArea").css("display","none");
					jQuery("#patientArea").css("display","none");

					var strHTML = "";
						if (isDoctor!=1){
						strHTML = "<br><br><div id='conf-bear'><h2>Gracias por registrarse en Pediatraweb!, en breves momentos se redireccionar&aacute; a la carga de sus beb&eacute;s.</h2></div><br><br><br><br>";
						} else {
						strHTML = "<br><br><h2>Gracias por registrarse en Pediatraweb!</h2><br><br><br><br>";
						}
					strHTML = strHTML + imageConfirmation;
					jQuery('#confirmation').html(strHTML);
					jQuery('#confirmation').fadeIn();
					jQuery('html,body').animate({
					   scrollTop: jQuery("#conf-bear").offset().top+10
					});

						if (isDoctor==1){
						urlRedirect = urlRedirectDR;
						}

					setTimeout(function(){ window.location.replace(urlRedirect+"?token="+token)},1000);
					} else {
						if (isDoctor!=1){
						showMessageErr(errorMessage);
						} else {
						showMessageErr2(errorMessage);
						}
					}
						} catch(e) {
								if (isDoctor!=1){
								showMessageErr("Error en conexion");
								} else {
								showMessageErr2("Error en conexion");
								}
						}

}

function selectDoctor(){
isDoctor = 1;
jQuery("#typeusr").val("1");
jQuery("#selectionArea").css("display","none");
jQuery("#doctorArea").fadeIn();
}

function selectPatient(){
isDoctor = 0;
jQuery("#typeusr").val("0");
jQuery("#selectionArea").css("display","none");
jQuery("#patientArea").fadeIn();
}

//------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------Babys
function findDoctors(idClinic){
	if (idClinic!="-"){
	jQuery("#ajaxLoader").fadeIn();
			jQuery.ajax({
			  type: 'GET',
			  dataType: 'text',
			  url: urlDoctors + '?idClinic='+idClinic,
			  cache:0,
			  success: displayDoctors,
			  error: callErrorDoctors
			});
	}
}
/// amaita inicio prueba
function findClinics(idCity,selectName){
	deleteOptions("clinic");
	addObjToCombo("clinic", "-", "-Seleccione-");
	deleteOptions("babyDoctor");
	addObjToCombo("babyDoctor", "-", "-Seleccione-");
	jQuery('#fs input').remove();
	jQuery("#fs").hide();

//////////////////////////////////////////////////////////////////////////////////Test JSDev
	//var b1 =  document.getElementById(selectName).selectedIndex;
	var selects = document.getElementById("drCityClinic");
	if(selects == null){
		var selects = document.getElementById("CityClinic");
	}
	var b1 = selects.options[selects.selectedIndex].text;

	if(b1 == '-Otra Ciudad-') {
		jQuery("#fn").show();
		jQuery("#fn").append('<input type="text" id="GenericInput0" name="OtraCiudad" class="css-textinput" placeholder="Indique la Ciudad"/>');
	
		}else{
		
		jQuery('#fn input').remove();
		jQuery("#fn").hide();

	}
///////////////////////////////////////////////////////////////////////////////////////
	if (idCity!="-"){
	jQuery("#ajaxLoader").fadeIn();
			jQuery.ajax({
			  type: 'GET',
			  dataType: 'text',
			  url: urlClinics + '?idCity='+idCity+'&selectName='+selectName,
			  cache:0,
			  success: displayClinics,
			  error: callErrorDoctors
			});
	} else {
	displayEmptyClinics(selectName);
	}
}
function findClinicsPts(idCity,selectName){
	var valIdCity = Number(idCity);
	deleteOptions(selectName);
	addObjToCombo(selectName, "-", "-Seleccione-");
	if(selectName == "babyClinic"){
		deleteOptions("babyDoctor");
		addObjToCombo("babyDoctor", "-", "-Seleccione-");
	}

	jQuery('#fs input').remove();
	jQuery("#fs").hide();

//////////////////////////////////////////////////////////////////////////////////Test JSDev
	//var b1 =  document.getElementById(selectName).selectedIndex;
	var selects = document.getElementById("drCityClinic");
	if(selects == null){
		var selects = document.getElementById("CityClinic");
	}
	var b1 = selects.options[selects.selectedIndex].text;

	if(b1 == '-Otra Ciudad-') {
		jQuery("#fn").show();
		jQuery("#fn").append('<input type="text" id="GenericInput0" name="OtraCiudad" class="css-textinput" placeholder="Indique la Ciudad"/>');
	}else{
		jQuery('#fn input').remove();
		jQuery("#fn").hide();

	}
///////////////////////////////////////////////////////////////////////////////////////
	if (idCity!=="-" && valIdCity !==109 ) {
		jQuery("#ajaxLoader").fadeIn();
		jQuery.ajax({
			type: 'GET',
			dataType: 'text',
			url: urlClinicsPt,
			data: 'idCity=' + idCity + '&selectName=' + selectName,
			cache: 0,
			success: displayClinicsPt,
			error: callErrorDoctors
		});
	}
	if(valIdCity===109){
			displayEmptyClinicsPW(selectName);		}
	if(idCity === "-"){
		displayEmptyClinicsPts(selectName);
	}


}

////////
function JsDevFact(){

	var selectsx = document.getElementById("clinic");
	var s1 =  selectsx.options[selectsx.selectedIndex].text;

		if (s1 === '-Otra Institución-') {
			jQuery("#fs").show();
			jQuery("#fs").append('<input type="text" id="GenericInput1" name="OtraInstitucion" class="css-textinput" placeholder="Ingrese Institucion"/>');
		}else{
			jQuery('#fs input').remove();
			jQuery("#fs").hide();

		}

}
////////////////
function findCities(idCountry,selectName){

	deleteOptions("drCityClinic");
	addObjToCombo("drCityClinic", "-", "-Seleccione-");

	deleteOptions("clinic");
	addObjToCombo("clinic", "-", "-Seleccione-");
	jQuery('#fn input').remove();
	jQuery("#fn").hide();
	jQuery('#fs input').remove();
	jQuery("#fs").hide();

	if (idCountry!="-"){
		jQuery("#ajaxLoader").fadeIn();
		jQuery.ajax({
			type: 'GET',
			dataType: 'text',
			url: urlCities + '?idCountry='+idCountry+'&selectName='+selectName,
			cache:0,
			success: displayCities,
			error: callErrorDoctors
		});
	} else {
		displayEmptyCities(selectName);
	}
}

//amaita fin prueba
///--
function findCitiesPt(idCountryPt,selectNamePt){
	if(selectNamePt == "CityClinic"){
		deleteOptions("CityClinic");
		addObjToCombo("CityClinic", "-", "-Seleccione-");
		deleteOptions("babyClinic");
		addObjToCombo("babyClinic", "-", "-Seleccione-");
		deleteOptions("babyDoctor");
		addObjToCombo("babyDoctor", "-", "-Seleccione-");

	}

	if (idCountryPt!="-"){
		jQuery("#ajaxLoader").fadeIn();
		jQuery.ajax({
			type: 'GET',
			dataType: 'text',
			url: urlCitiesPt+ '?idCountryPt='+idCountryPt+'&selectNamePt='+selectNamePt,
			cache:0,
			success: displayCitiesPt,
			error: callErrorDoctors
		});
	} else {
		displayEmptyCities(selectNamePt);
	}
}
////---


function addObjToCombo(comboName, idVal, desVal){
var sel = document.getElementById(comboName);
var opt = document.createElement('option');
	opt.innerHTML = desVal;
	opt.value = idVal;
	sel.appendChild(opt);
}

function displayDoctors(data){
jQuery("#ajaxLoader").css("display","none");
	deleteOptions("babyDoctor");
	addObjToCombo("babyDoctor", "-", "-Seleccione-");
try {
			var parsed = JSON.parse(data);
			var errorID = parsed.errorID;  //errorID":"1", "errorMessage

			if (errorID=="1"){
			var errorMessage = parsed.errorMessage;
			jQuery("#errMessage").html("Alerta: " + errorMessage);
			jQuery("#errMessage").fadeIn(); setTimeout(jQuery("#errMessage").fadeOut(),5000);
			} else {
			var doctorsArray = parsed.doctors;

				for (var i = 0; i < parsed.doctors.length; i++) {
					var doctorObj = parsed.doctors[i];
					addObjToCombo("babyDoctor", doctorObj.doctorID, doctorObj.doctorName);
				}
			}

		} catch(e) {
			jQuery("#errMessage").html("Alerta: verifique la data enviada");
			jQuery("#errMessage").fadeIn(); setTimeout(jQuery("#errMessage").fadeOut(),5000);
		}
}
function callErrorDoctors() {
	jQuery("#ajaxLoader").css("display", "none");
	jQuery("#errMessage").html("Alerta:no hay conexion en este momento");
	jQuery("#errMessage").fadeIn();
	setTimeout(jQuery("#errMessage").fadeOut(), 5000)
}


// amaita prueba inicio
function displayEmptyClinics (selectName) {
    deleteOptions(selectName);
    addObjToCombo(selectName, "-", "-Seleccione-");
}
function displayEmptyClinicsPts (selectName) {
	deleteOptions(selectName);
	addObjToCombo(selectName, "-", "-Seleccione-");
}
function displayEmptyClinicsPW (selectName) {
	deleteOptions(selectName);
	addObjToCombo(selectName, "30", "-Asignado por PediatraWeb-");
	deleteOptions("babyDoctor");
	addObjToCombo("babyDoctor", "1641", "PEDIATRAWEB, ASIGNADO");
}
function displayClinicsPt(data){

	var parsed = JSON.parse(data);
	if(parsed.selectName == "drCityClinic"){
		deleteOptions("babyDoctor");
		addObjToCombo("babyDoctor", "-", "-Seleccione-");
		jQuery('#fs input').remove();
		jQuery("#fs").hide();
	}
	jQuery("#ajaxLoader").css("display","none");


	try {
		var parsed = JSON.parse(data);
		var errorID = parsed.errorID;  //errorID":"1", "errorMessage

		deleteOptions(parsed.selectName);
		addObjToCombo(parsed.selectName, "-", "-Seleccione-");
	//	addObjToCombo(parsed.selectName, "20", "-Otra Institución-");



		if (errorID=="1"){
			var errorMessage = parsed.errorMessage;
			jQuery("#errMessage").html("Alerta: " + errorMessage);
			jQuery("#errMessage").fadeIn(); setTimeout(jQuery("#errMessage").fadeOut(),5000);
		} else {
			var clinicsArray = parsed.clinics;

			for (var i = 0; i < parsed.clinics.length; i++) {
				var clinicObj = parsed.clinics[i];
				addObjToCombo(parsed.selectName, clinicObj.clinicID, clinicObj.clinicName);
				//console.log(counter.counter_name);
			}
			//jQuery("#babyClinic option[value='20']").remove();
		}

	} catch(e) {
		jQuery("#errMessage").html("Alerta: verifique la data enviada");
		jQuery("#errMessage").fadeIn(); setTimeout(jQuery("#errMessage").fadeOut(),5000);
	}
}


function displayClinics(data){
jQuery("#ajaxLoader").css("display","none");

try {
			var parsed = JSON.parse(data);
			var errorID = parsed.errorID;  //errorID":"1", "errorMessage

            deleteOptions(parsed.selectName);
            addObjToCombo(parsed.selectName, "-", "-Seleccione-");
		//	addObjToCombo(parsed.selectName, "20", "-Otra Institución-");

			if (errorID=="1"){
			var errorMessage = parsed.errorMessage;
			jQuery("#errMessage").html("Alerta: " + errorMessage);
			jQuery("#errMessage").fadeIn(); setTimeout(jQuery("#errMessage").fadeOut(),5000);
			} else {
			var clinicsArray = parsed.clinics;

				for (var i = 0; i < parsed.clinics.length; i++) {
					var clinicObj = parsed.clinics[i];
					addObjToCombo(parsed.selectName, clinicObj.clinicID, clinicObj.clinicName);
					//console.log(counter.counter_name);
				}
				//jQuery("#babyClinic option[value='20']").remove();
			//	jQuery("#clinic option[value='30']").remove();
			}

		} catch(e) {
			jQuery("#errMessage").html("Alerta: verifique la data enviada");
			jQuery("#errMessage").fadeIn(); setTimeout(jQuery("#errMessage").fadeOut(),5000);
		}
}
///////////REGION
//
function displayEmptyCities (selectName) {
    deleteOptions(selectName);
    addObjToCombo(selectName, "-", "-Seleccione-");
	//addObjToCombo(selectName, "36", "-Otra Ciudad-");
}

function displayCities(data){
	var parsed = JSON.parse(data);

	deleteOptions("babyClinic");
	addObjToCombo("babyClinic", "-", "-Seleccione-");
	deleteOptions("babyDoctor");
	addObjToCombo("babyDoctor", "-", "-Seleccione-");
	deleteOptions("CityClinic");
	addObjToCombo("CityClinic", "-", "-Seleccione-");

	jQuery("#ajaxLoader").css("display","none");

	try {
		var parsed = JSON.parse(data);
		deleteOptions(parsed.selectName);
		addObjToCombo(parsed.selectName, "-", "-Seleccione-");
		//addObjToCombo(parsed.selectName, "-2", "-Otra Ciudad-");
		var errorID = parsed.errorID;

		if (errorID=="1"){
			var errorMessage = parsed.errorMessage;
			jQuery("#errMessage").html("Alerta: " + errorMessage);
			jQuery("#errMessage").fadeIn();
			setTimeout(jQuery("#errMessage").fadeOut(),5000);
		} else {
			var cityArray = parsed.cities;

			for (var i = 0; i < parsed.cities.length; i++) {
				var cityObj = parsed.cities[i];
				addObjToCombo(parsed.selectName, cityObj.cityID, cityObj.cityName);
			}
			jQuery("#drCityClinic option[value='109']").remove();
		}

	} catch(e) {
		jQuery("#errMessage").html("Alerta: verifique la data enviada");
		jQuery("#errMessage").fadeIn(); setTimeout(jQuery("#errMessage").fadeOut(),5000);
	}
}
function displayCitiesPt(data){
	var parsed = JSON.parse(data);
	jQuery("#ajaxLoader").css("display","none");

	try {
		var parsed = JSON.parse(data);
		deleteOptions(parsed.selectName);
		addObjToCombo(parsed.selectName, "-", "-Seleccione-");
		var errorID = parsed.errorID;

		if (errorID=="1"){
			var errorMessage = parsed.errorMessage;
			jQuery("#errMessage").html("Alerta: " + errorMessage);
			jQuery("#errMessage").fadeIn();
			setTimeout(jQuery("#errMessage").fadeOut(),5000);
		} else {
			var cityArray = parsed.cities;

			for (var i = 0; i < parsed.cities.length; i++) {
				var cityObj = parsed.cities[i];
				addObjToCombo(parsed.selectName, cityObj.cityID, cityObj.cityName);
			}
		}

	} catch(e) {
		jQuery("#errMessage").html("Alerta: verifique la data enviada");
		jQuery("#errMessage").fadeIn(); setTimeout(jQuery("#errMessage").fadeOut(),5000);
	}
}
//amaita prueba fin

function deleteOptions(idName){

			jQuery("#"+idName).empty();
			var select = document.getElementById(idName);

			var length = select.options.length;
				for (i=0;i<length;i++)
				{
					select.remove(i);
				}
}
