jQuery(document).ready(function($) {
    $('#showPass').click(function () {
        if ($('#showPass').is(':checked')) {
            $('.nanoPass').attr('type', 'text');
        } else {
            $('.nanoPass').attr('type', 'password');
        }
    });
/////////////////////////////
    //***///// feature count-string-into-inputText <--JSDev-->
    //       $('#txtMessage').keyup(function(){
    //           var devEdit = $(this).val().length;
    //         console.log($(this).val().length);
    //           $("#MyEdit").html(devEdit + '/2000');
    //       });
/////////////////////////////
    $('#valuModal').on('submit', function (ev) {
        $().modal({
            show: true
        });
    });


    $('#myFormShoes').on('submit', function (ev) {
        $('#my-modal').modal({
            show: 'false'
        });

        var data = $(this).serializeObject();
        json_data = JSON.stringify(data);
        $("#results").text(json_data);
        $(".modal-body").text(json_data);

        // $("#results").text(data);

        ev.preventDefault();
    });

    $("#chatSend").submit(function (event) {
        event.preventDefault();
        Validate();
    });

    //////////////////////////////////////////////
    $(function () {
        $('.inputNovk').on('keypress', function (e) {
            if (e.which === 32)
                return false;
        });
    });
    $('select[name=cityOther]').change(function () {
        if ($(this).val() === '5') {
            $('#otherCity').show();
        } else {
            $('#otherCity').hide();
        }
    });
    $('.isValih').click(function () {
        // Expresion regular para validar el correo
        var regex = /[\w-\.]{2,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;

        // Se utiliza la funcion test() nativa de JavaScripts
        if (regex.test($('#email').val().trim())) {
            alert('Correo validado');
        } else {
            alert('La direccón de correo no es valida');
        }
    });
////////////// End JQuery
});
//-----------------------------------------------------------------------------------------------

//var b1 = $("#drCountry option:selected").text();
//var b3 = $("#drCountry option:selected").val();
//if(b1){
//    jQuery.ajax({
//        type: 'GET',
//        dataType: 'text',
//        url: '../../ajax-pdc-find-cities.php',
//        data: 'idCountry='+b3+'&selectName='+b1,
//        error: callErrorDoctors
//    }).done(function (response) {
//        var idName = "drCity";
//        deleteOptions(idName);
//        var sel = document.getElementById(idName);
//        var opt = document.createElement('option');
//        opt.innerHTML = "-Seleccione-";
//        opt.value = "-1"; sel.appendChild(opt);
//        var sel = document.getElementById("drCity");
//        try {
//            var parsedData = JSON.parse(response);
//            var parsedArray = parsedData.cities;
//
//            for (i=0;i<parsedArray.length;i++){
//                var idItem = parsedArray[i].cityID;
//                var nbItem = parsedArray[i].cityName;
//                var opt = document.createElement('option');
//                if (idItem!=""){
//                    opt.innerHTML = nbItem;
//                    opt.value = idItem;
//                    sel.appendChild(opt);
//                }
//                var selectobject= document.getElementById("drCity")
//                for (var i=0; i<selectobject.length; i++){
//                    if (selectobject.options[i].value == '36' )
//                        selectobject.remove(i);
//                }
//            }
//        } catch(e) {
//            display_error("Alerta: verifique la data enviada."+e);
//        }
//    })
//}
/////////ADMIN///////////////
function findCitiesAd(idCountry,selectName){


    if(selectName === 'drCityClinicDe'){

        deleteOptionsAd("drCityClinicDe");
        addObjToComboAd("drCityClinicDe", "-", "-Seleccione-");
        deleteOptionsAd("drClinicDe");
        addObjToComboAd("drClinicDe", "-", "-Seleccione-");
        deleteOptionsAd("delegateDoctor");
        addObjToComboAd("delegateDoctor", "-", "-Seleccione-");

    }else{
        deleteOptionsAd("drCityClinicAd");
        addObjToComboAd("drCityClinicAd", "-", "-Seleccione-");
        deleteOptionsAd("drClinicAd");
        addObjToComboAd("drClinicAd", "-", "-Seleccione-");
    }
    if (idCountry!="-"){
        jQuery("#ajaxLoader").fadeIn();
        jQuery.ajax({
            type: 'GET',
            dataType: 'text',
            url: urlCities + '?idCountry='+idCountry+'&selectName='+selectName,
            cache:0,
            success: displayCitiesAd,
            error: callErrorDoctors
        });
    } else {
        displayEmptyCities(selectName);
    }
}
function displayCitiesAd(data){
    var parsed = JSON.parse(data);
    if(parsed.selectName === 'drCityClinicDe'){
        deleteOptionsAd("drCityClinicDe");
        addObjToComboAd("drCityClinicDe", "-", "-Seleccione-");
        deleteOptionsAd("drClinicDe");
        addObjToComboAd("drClinicDe", "-", "-Seleccione-");
    }else{
        deleteOptions("drClinicAd");
        addObjToComboAd("drClinicAd", "-", "-Seleccione-");
        deleteOptions("drCityClinicAd");
        addObjToComboAd("drCityClinicAd", "-", "-Seleccione-");
    }



    jQuery("#ajaxLoader").css("display","none");

    try {
        var parsed = JSON.parse(data);

        deleteOptions(parsed.selectName);
        addObjToComboAd(parsed.selectName, "-", "-Seleccione-");
        var errorID = parsed.errorID;

        if (errorID=="1"){
            var errorMessage = parsed.errorMessage;
            jQuery("#errMessage").html("Alerta: " + errorMessage);
            jQuery("#errMessage").fadeIn();
            setTimeout(jQuery("#errMessage").fadeOut(),5000);
        } else {
            var cityArray = parsed.cities;
            if(parsed.selectName === 'drCityClinicDe'){
                var selectobject= document.getElementById(parsed.selectName)
                for (var i=0; i<selectobject.length; i++){
                    if (selectobject.options[i].value == '36' )
                        selectobject.remove(i);
                }
            }
            for (var i = 0; i < parsed.cities.length; i++) {
                var cityObj = parsed.cities[i];
                addObjToComboAd(parsed.selectName, cityObj.cityID, cityObj.cityName);
            }
            var selectobject= document.getElementById(parsed.selectName)
            for (var i=0; i<selectobject.length; i++){
                if (selectobject.options[i].value == '36' )
                    selectobject.remove(i);
            }

        }

    } catch(e) {
        jQuery("#errMessage").html("Alerta: verifique la data enviada");
        jQuery("#errMessage").fadeIn(); setTimeout(jQuery("#errMessage").fadeOut(),5000);
    }
}

function findClinicsAd(idCity,selectName){

    if(selectName === 'drClinicDe'){
        deleteOptionsAd(selectName);
        addObjToComboAd(selectName, "-", "-Seleccione-");
        deleteOptionsAd("drClinicDe");
        addObjToComboAd("drClinicDe", "-", "-Seleccione-");
        deleteOptionsAd("delegateDoctor");
        addObjToComboAd("delegateDoctor", "-", "-Seleccione-");

    }else{
        deleteOptionsAd(selectName);
        addObjToComboAd(selectName, "-", "-Seleccione-");
        deleteOptionsAd("drClinicAd");
        addObjToComboAd("drClinicAd", "-", "-Seleccione-");
    }

//////////////////////////////////////////////////////////////////////////////////Test JSDev
    //var b1 =  document.getElementById(selectName).selectedIndex;
    var selects = document.getElementById(selectName);
    if(selects == null){
        var selects = document.getElementById(selectName);
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
            success: displayClinicsAd,
            error: callErrorDoctors
        });
    } else {
        displayEmptyClinics(selectName);
    }
}
function displayClinicsAd(data){
    jQuery("#ajaxLoader").css("display","none");

    try {
        var parsed = JSON.parse(data);
        var errorID = parsed.errorID;  //errorID":"1", "errorMessage

        deleteOptionsAd(parsed.selectName);
        addObjToComboAd(parsed.selectName, "-", "-Seleccione-");




        if (errorID=="1"){
            var errorMessage = parsed.errorMessage;
            jQuery("#errMessage").html("Alerta: " + errorMessage);
            jQuery("#errMessage").fadeIn(); setTimeout(jQuery("#errMessage").fadeOut(),5000);
        } else {
            var clinicsArray = parsed.clinics;

            for (var i = 0; i < parsed.clinics.length; i++) {
                var clinicObj = parsed.clinics[i];
                addObjToComboAd(parsed.selectName, clinicObj.clinicID, clinicObj.clinicName);
                //console.log(counter.counter_name);
            }
            jQuery("#babyClinic option[value='20']").remove();
        }

    } catch(e) {
        jQuery("#errMessage").html("Alerta: verifique la data enviada");
        jQuery("#errMessage").fadeIn(); setTimeout(jQuery("#errMessage").fadeOut(),5000);
    }
}

/////////////////// ADMIN ///////////////
//$("#drCountry").change(function() {
//    deleteOptions("drCity");
//    addObjToCombo("drCity", "-1", "-Seleccione-");
//    deleteOptions("drClinic");
//    addObjToCombo("drClinic", "-1", "-Seleccione-");
//    deleteOptions("clinic");
//    addObjToCombo("clinic", "-1", "-Seleccione-");
//
//    var b1 = $("#drCountry option:selected").text();
//    var b3 = $("#drCountry option:selected").val();
//    jQuery.ajax({
//        type: 'GET',
//        dataType: 'text',
//        url: '../../ajax-pdc-find-cities.php',
//        data:'idCountry='+b3+'&selectName='+b1,
//        success: displayCitydoc,
//        error: callErrorDoctors
//    });
//});
//function displayCitydoc(data){
//    var idName = "drCity";
//    deleteOptions(idName);
//    var sel = document.getElementById(idName);
//    var opt = document.createElement('option');
//    opt.innerHTML = "-Seleccione-";
//    opt.value = "-1";
//    sel.appendChild(opt);
//    var sel = document.getElementById("drCity");
//    try {
//        var parsedData = JSON.parse(data);
//        var parsedArray = parsedData.cities;
//
//        for (i=0;i<parsedArray.length;i++){
//            var idItem = parsedArray[i].cityID;
//            var nbItem = parsedArray[i].cityName;
//            var opt = document.createElement('option');
//            if (idItem!=""){
//                opt.innerHTML = nbItem;
//                opt.value = idItem;
//                sel.appendChild(opt);
//            }
//            var optItem = jQuery("drCity").val();
//            console.log(optItem);
//            var selectobject = document.getElementById("drCity")
//            for (var i=0; i<selectobject.length; i++){
//                if (selectobject.options[i].value === '36' )
//                    selectobject.remove(i);
//            }
//
//        }
//
//    } catch(e) {
//        display_error("Alerta: verifique la data enviada."+e);
//    }
//}
//var p1 = $("#drCity option:selected").text();
//var p3 = $("#drCity option:selected").val();
//if(p1){
//    jQuery.ajax({
//        type: 'GET',
//        dataType: 'text',
//        url: '../../ajax-pdc-find-cities.php',
//        data: 'idCountry='+p3+'&selectName='+p1,
//        error: callErrorDoctors
//    }).done(function (response) {
//        var idName = "drCity";
//        deleteOptions(idName);
//        var sel = document.getElementById(idName);
//        var opt = document.createElement('option');
//        opt.innerHTML = "-Seleccione-";
//        opt.value = "-1"; sel.appendChild(opt);
//        var sel = document.getElementById("drCity");
//        try {
//            var parsedData = JSON.parse(response);
//            var parsedArray = parsedData.cities;
//
//            for (i=0;i<parsedArray.length;i++){
//                var idItem = parsedArray[i].cityID;
//                var nbItem = parsedArray[i].cityName;
//                var opt = document.createElement('option');
//                if (idItem!=""){
//                    opt.innerHTML = nbItem;
//                    opt.value = idItem;
//                    sel.appendChild(opt);
//                }
//                var selectobject= document.getElementById("drCity")
//                for (var i=0; i<selectobject.length; i++){
//                    if (selectobject.options[i].value == '36' )
//                        selectobject.remove(i);
//                }
//            }
//        } catch(e) {
//            display_error("Alerta: verifique la data enviada."+e);
//        }
//    })
//    jQuery("#drClinic").val(drClinicInit);
//
//}

function addObjToComboAd(comboName, idVal, desVal){
    var sel = document.getElementById(comboName);
    var opt = document.createElement('option');
    opt.innerHTML = desVal;
    opt.value = idVal;
    sel.appendChild(opt);
}
function deleteOptionsAd(idName){

    jQuery("#"+idName).empty();
    var select = document.getElementById(idName);

    var length = select.options.length;
    for (i=0;i<length;i++)
    {
        select.remove(i);
    }
}
//setTimeout(function(){
//    jQuery("#drCity").val(drCityInit);
//
//    if(drCityInit){
//        var b1 = $("#drCity option:selected").text();
//        var b2 = $("#drCity option:selected").val();
//        jQuery.ajax({
//            type: 'GET',
//            dataType: 'text',
//            url: '../../ajax-pdc-find-clinics.php',
//            data: 'idCity='+b2+'&selectName='+b1,
//            error: callErrorDoctors
//        }).done(function (response) {
//            var idName = "drClinic";
//            deleteOptions(idName);
//            var sel = document.getElementById(idName);
//            var opt = document.createElement('option');
//            opt.innerHTML = "-Seleccione-";
//            opt.value = "-1"; sel.appendChild(opt);
//            var sel = document.getElementById("drClinic");
//            try {
//                var parsedData = JSON.parse(response);
//                var parsedArray = parsedData.clinics;
//
//                for (i=0;i<parsedArray.length;i++){
//                    var idItem = parsedArray[i].clinicID;
//                    var nbItem = parsedArray[i].clinicName;
//                    var opt = document.createElement('option');
//                    if (idItem!="") {
//                        opt.innerHTML = nbItem;
//                        opt.value = idItem;
//                        sel.appendChild(opt);
//                    }
//                }
//            } catch(e) {
//                display_error("Alerta: verifique la data enviada."+e);
//            }
//        });
//    }
//
//}, 5);

    //$("#drCity").change(function() {
    //    var selects = document.getElementById("drCity");
    //    var b1 = selects.options[selects.selectedIndex].text;
    //    var b2 = selects.options[selects.selectedIndex].value;
    //    jQuery.ajax({
    //        type: 'GET',
    //        dataType: 'text',
    //        url: '../../ajax-pdc-find-clinics.php',
    //        data: 'idCity=' + b2 + '&selectName=' + b1,
    //        success: displayClinicDoc,
    //        error: callErrorDoctors
    //    });
    //});

//function displayClinicDoc(data){
//
//    var parsed = JSON.parse(data);
//    deleteOptions("drClinic");
//    jQuery("#drClinic")
//        .append(
//            jQuery("<option></option>").val(-1).html("-seleccione-")
//        );
//
//    var sel = document.getElementById("drClinic");
//    try {
//        var parsedData = JSON.parse(data);
//        var parsedArray = parsedData.clinics;
//
//        for (i=0;i<parsedArray.length;i++){
//            var idItem = parsedArray[i].clinicID;
//            var nbItem = parsedArray[i].clinicName;
//            var opt = document.createElement('option');
//
//            if (idItem!="") {
//                opt.innerHTML = nbItem;
//                opt.value = idItem;
//                sel.appendChild(opt);
//            }
//        }
//        jQuery("#drClinic").val(drClinicInit);
//    } catch(e) {
//        display_error("Alerta: verifique la data enviada."+e);
//    }
//    jQuery("#drClinic").val(drClinicInit);
//}


function devJsVal(e){
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    menorTecla = tecla.toLowerCase();
    letras = " abcdefghijklmnopqrstuvwxyz";
    especiales = [8, 9, 45, 46, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 64, 95];

    tecla_especial = false;

    for(var i in especiales) {
        if(key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }

    if(letras.indexOf(menorTecla) == -1 && !tecla_especial){
            return false;
      }
}
