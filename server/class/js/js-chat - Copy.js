// PediatraWeb-------------------------------------------------------------------------------------------------------------
var myTimer;
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
		}
		callBack();
	} catch(e) {
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

$("#chatContainerBlock").append(HtmlContext);
scrollToLast();
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
var isDoctor =0;
function Validate(){
isDoctor =1;
var txtMessage = $("#txtMessage").val();
	if (txtMessage!=""){
		clearTimeout(myTimer);
		$.ajax({
		  type: 'POST',
		  dataType: 'text',
		  url: 'add_post.php?',
		  cache:0,
		  data: "last_item="+last_item+"&chat_id="+chat_id+"&user_id="+user_id+"&uToken="+uToken+"&message="+txtMessage,     
		  success: addMessageOK,
		  error: callBack
		});
	}
}
//-------------------------------------------------------------------------------------------------------------------------
function addMessageOK(data){
	if (data!=""){
		try {
		var parsed = JSON.parse(data);
		var id = Number(parsed.itemRow); 
		var data_html = parsed.dataHTML;
			
			if (id!=0){ 
			document.getElementById('txtMessage').value="";
			last_item = id;
			addMessage(data_html);
			}
			callBack();
		} catch(e) {
			callBack();
		}
	}
}
//-------------------------------------------------------------------------------------------------------------------------
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
$("#chatContainer").css("display","none");
$("#msgDispose").fadeIn();
}//--------------------------------------------------------------------------------------------------------------------------
function cancelEnd(){
$("#header").fadeIn();
$("#chatContainer").fadeIn();
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