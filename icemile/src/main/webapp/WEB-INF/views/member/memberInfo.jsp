<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    
    <style type="text/css">
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
*{
    font-family: 'Pretendard-Regular';
}

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
     <body class="sb-nav-fixed">
        
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->
        <div id="layoutSidenav">
<!-- 사이드바 -->
<jsp:include page="../include/sidebar.jsp"></jsp:include>
<!-- 사이드바 -->
        
            <div id="layoutSidenav_content">
                <main>
                <!-- 내용들어가는곳 -->



  <h1>마이페이지</h1>
  
<table border="1">
<!-- <colgroup> -->
<!-- <col style="background-color: #E0EBFF;"> -->
<!-- <col> -->
<!-- </colgroup>  -->

<tr>
<th>이름</th>
<td><input type="text" value="${memberDTO.emp_name }" readonly></td>
</tr>

<tr>
<th>사진</th>
<td><img src="../resources/assets/img/photo.jpg" width="25%" height="100%"></td>
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
    <input type="button" value="수정" onclick="memberUpdate('${sessionScope.emp_num}')" id="updateEmp" >
     <input type="button" value="비밀번호 변경"  onclick="memberPassword('${sessionScope.emp_num}')" id="passwordEmp" >
 </div>
 </div>
                
              
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->  
                
            </div>
        </div>
<script type="text/javascript">
function memberUpdate(emp_num){
	window.open('${pageContext.request.contextPath }/member/empUpdate?emp_num='+emp_num, '_blank', 'width=600px, height=1000px, left=600px, top=300px');
}
function memberPassword(emp_num){
	window.open('${pageContext.request.contextPath }/member/passwordUpdate', '_blank', 'width=600px, height=600px, left=600px, top=300px');
}
</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
    </body>
</html>
