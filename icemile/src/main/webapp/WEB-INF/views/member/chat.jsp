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
		var openMsg = '웹소켓 연결됨';
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

	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {

	}
	
</script>
</html>