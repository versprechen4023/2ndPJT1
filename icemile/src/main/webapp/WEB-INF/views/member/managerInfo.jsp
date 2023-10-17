<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html lang="en">
   <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>아이스마일</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../resources/css/managerInfo.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    </head>
     <body>
                <main>
                <!-- 내용들어가는곳 -->

  <h1>담당자 정보</h1>
  
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
<td><input type="text" value="${memberDTO.address }" readonly size="45"></td>
</tr>

</table>
 
                <!-- 내용 들어가는 곳 -->
                </main>
  				
  
 <div id="bottomContainer"> 
    <input type="button" id="btn" value="닫기" onclick="window.close();" >
 </div>
 
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 --> 
                

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
    </body>
</html>
