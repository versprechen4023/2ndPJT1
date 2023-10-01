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


/* 사이드바, 헤더, 푸터 제외 내용부분 */
.container{
	width: 500px;		/* 넓이 */
	margin: 0px auto;	/* 중앙 */
}

/* 사원정보에 대한 내용이 들어가는 부분 */
.info{
	margin : -3px auto; /* 중앙 */
	width:360px;		
	height:450px;
	text-align:left;	/* 내용 왼쪽정렬 */
	line-height: 50px;	/* 줄 간격 */
	font-size: 15pt;	/* 글자사이즈 */
	font-weight: bold;	/* 글자굵기 */
	display: table;
  border-collapse: collapse;
/*   width: 100%; */
}

/* 수정버튼 */
.upBut{
/* 	clear:left; 		/* 어울림 해제 */ */
	margin: 0px 230px;	/* 중앙  */
    width: 5.8917vw;
    height: 1.975vw;
    position: absolute;
    left: 49.9688vw;
    top: 36vw;
}

.passUp{
/* 	clear:left; 		/* 어울림 해제 */ */
	margin: 0px 230px;	/* 중앙  */
	height: 1.975vw;
	left: 57.9688vw;
    top: 36vw;
    position: absolute;
	
}

/* input type="text" 에 대한 모든 부분 */
input[type="text"]{
	border-style:none;	/* 내용을 들고올 때 수정 못함, 칸 테두리 없앰 */
	line-height: normal;
}
h1 {
    font-weight: 500;
    line-height: 3.2;
    margin-top: 0;
    margin: auto;
    text-align: center; 
    font-weight: bold;
    height: 110px;
}


table { 
     width: 45%; 
  border-top: 1px solid #444444; 
     border-collapse: collapse; 
      border: 2px solid; 
     margin: auto;
   } 
 th, td { 
  border-bottom: 1px solid #444444; 
  border: 1px solid; 
  padding: 10px; 
  text-align: left; 
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
  
<!--   <div class="container"> -->
<!--   <div class="info"> -->
<table border="1">

<tr>
<th>이름</th>
<td><input type="text" value="${memberDTO.emp_name }" readonly></td>
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
<td><input type="text" value="${memberDTO.address }" readonly size="30"></td>
</tr>

<tr>
<th>입사일</th>
<td><input type="text" value="${memberDTO.hire_date }" readonly></td>
</tr>
  
<!--   </div> -->



 <input type="button" value="수정" class=upBut onclick="memberUpdate('${sessionScope.emp_num}')" id="updateEmp" style="text-align: center;">
 <input type="button" value="비밀번호 변경" class=passUp onclick="memberPassword('${sessionScope.emp_num}')" id="passwordEmp" style="text-align: center;">

<!--  </div> -->
</table>
 
                <!-- 내용 들어가는 곳 -->
                </main>
                
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
