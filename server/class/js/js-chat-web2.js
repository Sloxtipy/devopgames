// PediatraWeb-------------------------------------------------------------------------------------------------------------
var myTimer;
$body = jQuery(".modalD");
//-------------------------------------------------------------------------------------------------------------------------
function seekMessages(){
	clearTimeout(myTimer);
	$.ajax({
		type: 'POST',
		dataType: 'text',
		url: 'search_posts.php?',
		cache:0,
		data: "last_item="+last_item+"&chat_id="+chat_id+"&user_id="+user_id+"&patient_id="+patient_id+"&uToken="+uToken,
		success: displayResults,
		error: callBack
	});
}
//-------------------------------------------------------------------------------------------------------------------------
function startChat(){
	window.location.hash="no-back-button";

	window.location.hash="Again-No-back-button";

	window.onhashchange=function(){window.location.hash="no-back-button";}
	scrollMeDown();
	myTimer = setInterval(function () {seekMessages();}, 5000);
}
//-------------------------------------------------------------------------------------------------------------------------
function callBack(){
	clearTimeout(myTimer);
	myTimer = setInterval(function () {seekMessages();}, 5000);
}
//-------------------------------------------------------------------------------------------------------------------------
function displayResults(data){
	try {
		var parsed = JSON.parse(data);
		var id = Number(parsed.itemRow);
		var data_html = parsed.dataHTML;
		var notificationID = parsed.notification;
		var closed = parsed.closed;


		if (closed=="1"){
			chatEnded();
			return false
		}
		//console.log("notificationID:"+notificationID);
		if (notificationID!=0){
			addNotification(notificationID);
		}

		if (id!=0){
			last_item = id;
			addMessage(data_html);
			registerPhotoSwipe();
		}
		if(data_html!==""){
			PlaySound('sound1');
		}

		callBack();
	} catch(e) {
	//	console.log(e);
		callBack();
	}
}
//-------------------------------------------------------------------------------------------------------------------------
function scrollMeDown(){
	$('html,body').animate({
		scrollTop: $("#bottomScroll").offset().top-120
	});
}
//-------------------------------------------------------------------------------------------------------------------------
function scrollToLast(){
	$('html,body').animate({
		scrollTop: $("#div_id_"+last_item).offset().top-120
	});
}
//-------------------------------------------------------------------------------------------------------------------------
function PlaySound(soundObj) {
	var sound = document.getElementById(soundObj);
	sound.play();
}
//-------------------------------------------------------------------------------------------------------------------------
jQuery("#image").change(function(){
	var typeMsg = "2";
	var selectedFile = $(this).get(0).files[0];
	var file = this.files[0];
	var form = new FormData();
		form.append('imageToUpload', file);
		form.append('chatid', chat_id);
		form.append('user', user_id);
		form.append('token', uToken);
		form.append('messagetype', typeMsg);

	if(selectedFile){
		if (selectedFile.type === "image/jpeg" || selectedFile.type === "image/png" || selectedFile.type === "image/jpg") {

			var reader = new FileReader();

			reader.onload = function (e) {

				$('#imagepreview').attr('src', e.target.result);
				$("#modalImg").dialog({
				closeOnEscape: false,
					open: function(event, ui) {
						$('#cargando').hide();
						$(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
					},
					modal: true,
					dialogClass: 'myColor',
					buttons: {
						"Si": function() {
							$(".ui-dialog-buttonpane button:contains('Confirm')").attr("disabled", true)
								.addClass("ui-state-disabled");
							$("#cargando").show();
							jQuery.ajax({
									type: 'POST',
									url: '/private/ws/v2/ws-chat-message-web.php?',
									cache:false,
									data: form,
									success: displayImg,
									error: callBack,
									processData: false,
									contentType: false
							}).done(function () {
								$('#cargando').hide();
								$("#modalImg").dialog("close");
								document.getElementById("image").value = "";
							})
						},
						No: function() {
							$("#modalImg").dialog("close");
							document.getElementById("image").value = "";
						}
					}
				});
				$("#modalImg").css("display","block");
			}
			reader.readAsDataURL(selectedFile);
		}else{
				$("#modalAlert").dialog({
				modal: true,
				dialogClass: 'myColor',
				buttons: {
					Ok: function() {
						$(this).dialog( "close" );
						document.getElementById("image").value = "";
					}
				}
			});
				$("#modalAlert").css("display","block");
		}
	}

});
//-------------------------------------------------------------------------------------------------------------------------------
function Validate(){
	var msgType = 1;
	var txtMessage = jQuery("#txtMessage").val();
	if (txtMessage!=""){
		document.getElementById('txtMessage').value="";
		clearTimeout(myTimer);
		jQuery.ajax({
			type: 'POST',
			dataType: 'text',
			url: '/private/ws/v2/ws-chat-message.php?',
			cache:0,
			data: "last_item="+last_item+"&chatid="+chat_id+"&user="+user_id+"&token="+uToken+"&message="+txtMessage+"&messagetype="+msgType,
			success: addMessageOK,
			error: callBack
		});
	}
}//-------------------------------------------------------------------------------------------------------------------------
function addMessageOK(data){
	document.getElementById("image").value = "";
	document.getElementById('txtMessage').value="";
	if (data !== ""){
		try {

			var parsed = JSON.parse(data);
			var idErr = Number(parsed.errorID);
			var data_html = parsed.messageHTML;
			if (idErr === 0){
				addMessage(data_html);
			}
			callBack();
		} catch(e) {
			callBack();
		}
	}
}//-------------------------------------------------------------------------------------------------------------------------
function displayImg(response){
	document.getElementById("image").value = "";
	var dataStr =JSON.stringify(response);
	if (response !== ""){
		try {
			var parsed = JSON.parse(dataStr);
			var idErr = Number(parsed.errorID);
			var data_html = parsed.messageHTML;

			if (idErr === 0){
				addMessage(data_html);
			}
			callBack();
		} catch(e) {
			callBack();
		}
	}
}
//-------------------------------------------------------------------------------------------------------------------------
function addMessage(HtmlContext){
	var str = HtmlContext;
	var findWidth = "width";
	var findImage = "<img";
	var isImage = str.indexOf(findImage);
	if (isImage !== -1){
		var isWidthAvailable = str.indexOf(findWidth);
		if (isWidthAvailable === -1){
			HtmlContext = str.replace(findImage, findImage+" width=240 height=240");
			//Seteo del width
		}
	}
	HtmlContext = HtmlContext.replace('"', '\"');
	HtmlContext = HtmlContext.replace(/(?:\r\n|\r|\n)/g, '<br />');
	$("#chatContainerBlock").append(HtmlContext);
	scrollToLast();
}
//---------------------------------------------------------------------------------------------------------------------------------
function ValidateEnd(){
	var resp = confirm("Esta seguro que desea CULMINAR este chat?");
	if (resp==true){

	}
}//-------------------------------------------------------------------------------------------------------------------------
function errClosingChat(){
	alert("Alerta: no hay conexion en este momento");
	callBack();
}//-------------------------------------------------------------------------------------------------------------------------
function displayEndChat(data){
	try {
		var parsed = JSON.parse(data);
		var errorID = Number(parsed.errorID);
		var errorDesES = parsed.errorDesES;
		if (errorID==0){
			clearTimeout(myTimer);
			$("#header").css("display","none");
			$("#chatContainer").css("display","none");
			$("#dr-footer").css("display","none");
			$("#culminado").fadeIn();
			window.location.replace('../../chat-pdc-dr.php');
		} else {
			alert(errorDesES);
		}
		callBack();
	} catch(e) {
		callBack();
	}
}//-------------------------------------------------------------------------------------------------------------------------
function addNotification(lastID){
	lastID = Number(lastID);
//console.log("last id:"+lastID);
	for (i=0;i<=lastID;i++){
		$("#div_id_"+i).find('.notification').attr('class', 'notificationRead');
	}
}//-------------------------------------------------------------------------------------------------------------------------
function chatEnded(){
	clearTimeout(myTimer);
	$("#header").css("display","none");
	$("#chatContainer").css("display","none");
	$("#msgDispose").css("display","none");
	$("#culminado").fadeIn();
	location.href = "../../../chat-pdc.php";

}//--------------------------------------------------------------------------------------------------------------------------
function displayEndMessageBox(){
	$("#dr-footer").css("display","none");
	$("#chatContainer").css("display","none");
	$("#msgDispose").fadeIn();
}//--------------------------------------------------------------------------------------------------------------------------
function cancelEnd(){
	$("#header").fadeIn();
	$("#chatContainer").fadeIn();
	$("#dr-footer").fadeIn();
	$("#msgDispose").css("display","none");
}//--------------------------------------------------------------------------------------------------------------------------
function processEnd(){
	$("#msgDispose").css("display","none");
	$("#header").fadeIn();
	$("#chatContainer").fadeIn();

	clearTimeout(myTimer);
	$.ajax({
		type: 'POST',
		dataType: 'text',
		url: 'close-chat.php?',
		cache:0,
		data: "chat_id="+chat_id+"&user_id="+user_id+"&uToken="+uToken,
		success: displayEndChat,
		error: errClosingChat
	});
}//--------------------------------------------------------------------------------------------------------------------------
function processRefund(){
	$("#msgDispose").css("display","none");
	$("#header").fadeIn();
	$("#chatContainer").fadeIn();

	clearTimeout(myTimer);
	$.ajax({
		type: 'POST',
		dataType: 'text',
		url: 'void-dr.php?',
		cache:0,
		data: "chat_id="+chat_id+"&user_id="+user_id+"&uToken="+uToken,
		success: displayEndChat,
		error: errClosingChat
	});
}//--------------------------------------------------------------------------------------------------------------------------
function valSize(){
	var numChars = 27;
	var str = document.getElementById('txtMessage').value;
	var n = str.length+1;
	if (n<numChars){
		document.getElementById("txtMessage").rows = 1;
	} else {
		nLines = Math.ceil(n/numChars);
		if (nLines>3){
			nLines =3;
		}
		document.getElementById("txtMessage").rows = nLines;
	}
}