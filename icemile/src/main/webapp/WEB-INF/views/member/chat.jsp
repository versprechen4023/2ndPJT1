<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>test</title>

</head>
<body>
<div class="chat">
	<ul id="chat_wrap">
			<!-- 채팅 들어오는 자리 -->
    </ul>
</div>
		<input type="text" id="message" placeholder="메세지입력">
		<input type="button" id="sendBtn" value="전송">
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<script type="text/javascript">
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});
	
	var sock = new SockJS('${pageContext.request.contextPath }/chat');
	sock.onopen = onOpen;
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	// 소켓연결동작
	function onOpen(){
		var openMsg = '유저 들어옴';
		console.log(openMsg);
		sock.send(openMsg);
	} 
	// 메시지 전송
	function sendMessage() {
		var msg = $("#message").val();
		console.log(msg);
		sock.send(msg);
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		var addmsg = "";
		addmsg += data
		addmsg += "<br>"
		$("#chat_wrap").append(addmsg);
	}
	// 서버와 연결을 끊었을 때
	function onClose(event) {
		
	}
	
	// 엔터키 입력시 메시지 보내게 이벤트 리스너 활성화
	document.addEventListener("keyup", function(event) {
	    if (event.key === 'Enter') {
	    	sendMessage();
	    	$('#message').val('');
	    }// end if
	});// end function
	
</script>
</html>