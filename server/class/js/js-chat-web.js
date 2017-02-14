// PediatraWeb-------------------------------------------------------------------------------------------------------------
var myTimer;
//// JQuery Functions
jQuery(document).ready(function($) {


	//$(document).on("change", ".custom-file-input", this, function(e){
	//	GetBase64( e.target );
	//});
	//function GetBase64( input ) {
	//	if ( input.files && input.files[0] ) {
	//		var FR = new FileReader();
	//		FR.onload = function(e) {
	//			var str = e.target.result;
	//			/* preview it ( if you wanted to ) */
	//			$('#preview-img').attr( "src", str );
	//			/* upload it to server */
	//			UploadFile(str);
	//		};
	//		FR.readAsDataURL( input.files[0] );
	//	}
	//}
	//function UploadFile( file_str ) {
	//	var img = file_str;
	//	img ? mesgtype = 2 : mesgtype = 1;
	//		$.ajax({
	//			type: 'POST',
	//			dataType: 'text',
	//			enctype: 'multipart/form-data',
	//			tmp_dir:'tmp',
	//			url: '/private/ws/ws-chat-message.php?',
	//			cache: 0,
	//			data: "&chatid=" + chat_id + "&user=" + user_id + "&token=" + uToken +"&imageToUpload=" + img + "&messagetype=" +mesgtype ,
	//			success: addMessageOK,
	//			error: callBack
	//		}).done(function (response) {
	//			console.log('Done in Img',response);
	//		}).fail(function (err) {
	//			console.error('Error in Img', err);
	//		})
	//}
	$('#dSubmitCl').on('click', function () {
		window.location.href = "/chat-pdc-consulta.php";
	});
	$('#doctrsAsign').on('click', function () {
		window.location.href = "/pdc-mis-doctores.php";
	});

	$body = $(".diora");

$('#consulDll').on('submit', function(event){
	event.preventDefault();
	var infData = $(this).serialize();
	$body.addClass("loading")
	console.log('loadingStart');
		jQuery.ajax({
			type: 'POST',
			dataType: 'text',
			url: 'private/ws/ws-chat-started.php?',
			enctype: 'multipart/form-data',
			cache: 0,
			data: infData + "&token=" + uToken,
			error: callBack
		}).done(function (response) {
				var parRespo = JSON.parse(response);
				var idError = parRespo.errorID;
					if(Number(idError) === 2){
						jQuery.ajax({
							type: 'POST',
							dataType: 'text',
							url: 'private/ws/ws-chat-start.php?',
							enctype: 'multipart/form-data',
							cache: 0,
							data: infData +"&user="+user_id+"&token=" + uToken,
							error: callBack
						}).done(function (response) {
							var idBaby = jQuery("#select-babys").val();
							var restPars = JSON.parse(response);
							var errId = restPars.errorID;
							var idChat = restPars.chatID;
							var  urlC = '/private/chat/serv.php?w0Rk3='+idChat;
							urlX = urlC + '&4UB!=' + user_id + '&0aKz=' + uToken + '&33xAc=' + idBaby;
							if(Number(errId) === 0){
								window.location.href = urlX;
								$body.removeClass("loading");
								console.log('loadingRemove');
								}
						});
					}
		});
});
	$('#myFormWeb').on('submit', function (event) {
		event.preventDefault();
		var txtMessage = $("#txtMessage").val();
		txtMessage ? mesgtype = 1 : mesgtype = 2;
		if (txtMessage!==""){
			clearTimeout(myTimer);
			jQuery.ajax({
					type: 'POST',
					dataType: 'text',
					url: '/private/ws/ws-chat-message.php?',
					enctype: 'multipart/form-data',
					cache: 0,
					data: "&chatid=" + chat_id + "&user=" + user_id + "&token=" + uToken + "&message=" + txtMessage + "&messagetype=" +mesgtype,
					success: addMessageOK,
					error: callBack
				});
		}
	});
});
//-------------------------------------------------------------------------------------------------------------------------
function seekMessages(){
clearTimeout(myTimer);
	jQuery.ajax({
	  type: 'POST',
	  dataType: 'text',
	  url: '/private/chat/search_posts.php?',
	  cache:0,
	  data: "last_item="+last_item+"&chat_id="+chat_id+"&user_id="+user_id+"&patient_id="+patient_id+"&uToken="+uToken,     
	  success: displayResults,
	  error: callBack
	});
}
//-------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------
function startChatWeb(){
	scrollMeDownWeb();
	myTimer = setInterval(function (){
		seekMessages();
	}, 5000);
}
//-------------------------------------------------------------------------------------------------------------------------
function callBack(){
clearTimeout(myTimer);
myTimer = setInterval(function() 
{
	seekMessages();
},5000);
}
//-------------------------------------------------------------------------------------------------------------------------
function displayResults(data){
	var parsed = JSON.parse(data);
	var id = Number(parsed.itemRow); 
	var data_html = parsed.dataHTML;
	var notificationID = parsed.notification;
	var closed = parsed.closed;

		try {
			if (closed === "1"){
			chatEnded();
			return false;
			}
		//console.log("notificationID:"+notificationID);
			if (notificationID!==0){
			addNotification(notificationID);
			}
			if (id !== 0 ){
			last_item = id;

			addMessage(data_html);
			registerPhotoSwipe();
			}
			callBack();
		} catch(e){
			callBack();
		}
}
//-------------------------------------------------------------------------------------------------------------------------
function addMessage(HtmlContext){
var str = HtmlContext;
var findWidth = "width";
var findImage = "<img";
var isImage = str.indexOf(findImage);
	if (isImage!=-1){
	var isWidthAvailable = str.indexOf(findWidth);
		if (isWidthAvailable==-1){
		HtmlContext = str.replace(findImage, findImage+" width=240 height=240");
		//Seteo del width	
		}
	}
HtmlContext = HtmlContext.replace('"', '\"');
HtmlContext = HtmlContext.replace(/(?:\r\n|\r|\n)/g, '<br />');
jQuery("#chatContainerBlock").append(HtmlContext);
	scrollToLastWeb();

}

//-------------------------------------------------------------------------------------------------------------------------
function scrollMeDownWeb(){
	
		jQuery('#filaChat').animate({
			scrollTop: jQuery("#bottomScroll").offset().top - 120
		});

}
//-------------------------------------------------------------------------------------------------------------------------
function scrollToLastWeb(){

		jQuery('#filaChat').animate({
			scrollTop: jQuery("#bottomScroll").offset().top - 120
		});
}
//-------------------------------------------------------------------------------------------------------------------------
var isDoctor = 0;
function Validate(){
var isDoctor = 1;
var txtMessage = jQuery("#txtMessage").val();

	if (txtMessage!==""){
		clearTimeout(myTimer);
			jQuery.ajax({
				type: 'POST',
				dataType: 'text',
				url: '/private/ws/ws-chat-message.php?',
				cache: 0,
				data: "&chatid=" + chat_id + "&user=" + user_id + "&token=" + uToken + "&message=" + txtMessage,
				success: addMessageOK,
				error: callBack
			});
	}
}
//-------------------------------------------------------------------------------------------------------------------------
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

function addMessageOK(data){
      
      var id = Number(last_item);
    	if (data !== ''){
         var obj = jQuery.parseJSON(data);
			//var id = Number(obj.itemRow);
			var data_html = obj.messageHTML;

    try {
			if (id !== 0){ 
			        document.getElementById('txtMessage').value="";
				    document.getElementById('fileCont').value="";
                    
			        if (isDoctor === 1)
                    {
			                valSize();
			        }
                    
                    last_item = id;
                    addMessage(data_html);
			}
			callBack();
		    }
         catch(err) {
			callBack();
		} 
	}
}
//-------------------------------------------------------------------------------------------------------------------------
function ValidateEnd(){
var resp = confirm("Esta seguro que desea CULMINAR este chat?");
	if (resp === true){
		
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
		if (errorID === 0){ 
		clearTimeout(myTimer);
		$("#header").css("display","none");
		$("#chatContainer").css("display","none");
		$("#dr-footer").css("display","none");
		$("#culminado").fadeIn();
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
		jQuery.ajax({
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
		jQuery.ajax({
		  type: 'POST',
		  dataType: 'text',
		  url: 'void-dr.php?',
		  cache:0,
		  data: "chat_id="+chat_id+"&user_id="+user_id+"&uToken="+uToken,     
		  success: displayEndChat,
		  error: errClosingChat
		});
}//--------------------------------------------------------------------------------------------------------------------------
