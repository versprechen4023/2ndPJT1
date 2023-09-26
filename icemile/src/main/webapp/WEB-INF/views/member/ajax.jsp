<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="button" value="intAjax" onclick="intAjax()">
<input type="button" value="listAjax" onclick="listAjax()">
<input type="button" value="jsonAjax" onclick="jsonAjax()">
<input type="button" value="mapAjax" onclick="mapAjax()">


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
var myInt = 1;
var myJson = {
		      num : 1,
		      id : "hong",
		      my : "my"
			 };
			 
	function intAjax() {

		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath }/myNumber',
			data : {
				"myInt" : myInt
			}, // 선택된 값을 서버로 전송
			success : function(data) {
				alert(data);
			}
		});

	}
	
	function listAjax() {

		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath }/myList',
			dataType: 'json',
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					alert(data[i].birthdate);
				}
			}
		});

	}
	
	function jsonAjax() {
		$.ajax({
	        type: "POST",
	        url: '${pageContext.request.contextPath}/myJson',
	        data: JSON.stringify(myJson),
	        contentType: 'application/json',
	        success: function(data) {
	            alert(data);
	        }
	    });
	}
	
	function mapAjax() {

		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath }/myMap',
			dataType: 'json',
			success : function(data) {
				alert(data["id"]);
				alert(data["num"]);
				alert(data["fun"]);
			}
		});

	}
</script>
</body>
</html>
