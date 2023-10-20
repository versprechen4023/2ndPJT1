<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html lang="en">
    <head>
<!-- 헤드 -->       
 <jsp:include page="../include/head.jsp"></jsp:include>
 <!-- 헤드 -->   
    <style type="text/css">
body{
	margin: 0px;
/* 	overflow-X: hidden; */
/* 	overflow-Y: hidden; */
	width: 100%;
}

main{
	margin: 8px;
}

h1 {
 	margin-left: 5px;
    font-size: 2em;
    font-weight: 500;
     text-align: center; 
     font-weight: bold; 
     margin-top: 0; 
     margin: auto;
	 height: 110px;
	 line-height: 3.2;
 }	
 
 .btn{
 float: right;
 margin-bottom: 10px;
 }
	
 table {
    width: 45%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
    border-color: #DDE2E6;
    margin-top: 30px;
    margin-bottom: 20px;
    margin: auto;
    
  }
  th{
    border-bottom: 1px solid #444444;
    border-color: #DDE2E6;
    padding: 10px;
    text-align: left;
    font-size: 14px;
    width: 130px; 
    text-align: center; 
      border-left: none;
  border-right: none;
  }
td {
    border-bottom: 1px solid #444444;
    border-color: #DDE2E6;
    padding: 10px;
    text-align: left;
    font-size: 14px;
      border-left: none;
  border-right: none;
  }
  
.tdbold{
font-weight: bold;
}

#msg{
	color: red;
}  

#bottomContainer{
	text-align: center;
	margin: 0 auto;
	margin-bottom: 20px;
}

</style>

    </head>
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->
     <body class="sb-nav-fixed">
        

        <div id="layoutSidenav">
<!-- 사이드바 -->
<jsp:include page="../include/sidebar.jsp"></jsp:include>
<!-- 사이드바 -->
        
            <div id="layoutSidenav_content">
                <main>
                <!-- 내용들어가는곳 -->



  <h1>마이페이지</h1>
  
<table border="1">
<tr>
<th>이름</th>
<td><input type="text" value="${memberDTO.emp_name }" readonly></td>
</tr>

<tr>
<th>사진</th>
<td>
<!-- profilepic 없는 경우 디폴트이미지파일 보여지게 -->
<c:choose>
    <c:when test="${not empty memberDTO.profilepic}">
        <img src="../resources/upload/${memberDTO.profilepic}" alt="사원프로필사진" width="100px" height="100px">
    </c:when>
    <c:otherwise>
        <img src="../resources/assets/img/icemile.png" width="100px" height="100px">
    </c:otherwise>
</c:choose>
</td>
</tr>

<tr>
<th>생년월일</th>
<td><input type="text" value="${memberDTO.birthdate }" readonly></td>
</tr>

<tr>
<th>직급</th>
<td> <input type="text" value="${memberDTO.position }" readonly></td>
</tr>

<tr>
<th>부서</th>
<td><input type="text" value="${memberDTO.dept_name }" readonly></td>
</tr>

<tr>
<th>연락처</th>
<td><input type="text" value="${memberDTO.phone_num }" readonly></td>
</tr>

<tr>
<th>내선번호</th>
<td><input type="text" value="${memberDTO.hotline }" readonly></td>
</tr>

<tr>
<th>이메일</th>
<td><input type="text" value="${memberDTO.email }" readonly></td>
</tr>

<tr>
<th>주소</th>
<td><input type="text" value="${memberDTO.address }" readonly size="35"></td>
</tr>

<tr>
<th>입사일</th>
<td><input type="text" value="${memberDTO.hire_date }" readonly></td>
</tr>

</table>
 
                <!-- 내용 들어가는 곳 -->
                </main>
  
<div style="display: flex; justify-content: center; margin-bottom: 20px; ">
 <div class="btn">
    <input type="button" value="수정" onclick="memberUpdate()" id="updateEmp" >
     <input type="button" value="비밀번호 변경"  onclick="memberPassword()" id="passwordEmp" >
 </div>
 </div>
                
              
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->  
                
            </div>
        </div>
<script type="text/javascript">
function memberUpdate(){
	window.open('${pageContext.request.contextPath }/member/empUpdate', '_blank', 'width=590px, height=673px, left=600px, top=300px');
}
function memberPassword(){
	window.open('${pageContext.request.contextPath }/member/passwordUpdate', '_blank', 'width=330px, height=306px, left=600px, top=300px');
}
</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
    </body>
</html>
