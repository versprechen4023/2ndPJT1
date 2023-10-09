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
   margin-bottom : 20px;
   } 
   
th { 
  border-bottom: 1px solid #444444; 
  border: 1px solid; 
  padding: 10px; 
  text-align: center; 
  width: 130px;
   } 
td { 
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



  <h1>담당자 정보</h1>
  
<table border="1">
<colgroup>
<col style="background-color: #E0EBFF;">
<col>
</colgroup> 

<tr>
<th>이름</th>
<td><input type="text" value="${memberDTO.emp_name }" readonly></td>
</tr>

<tr>
<th>사진</th>
<td><img src="../resources/assets/img/photo.jpg" width="100px" height="100px"></td>
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
    <input type="button" value="닫기" onclick="windowClose()" >
 </div>
 </div>
                
              
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->  
                
            </div>
        </div>
<script type="text/javascript">
function windowClose() {
    window.close();
}

</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
    </body>
</html>
