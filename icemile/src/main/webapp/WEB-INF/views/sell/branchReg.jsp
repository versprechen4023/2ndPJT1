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
        <title>아이스마일</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                   
<h1>지점 추가</h1>
<form action="${pageContext.request.contextPath }/sell/branchReg" method="post">
지점 코드<br>
<!-- 자동 부여 ?-->
<input type="text" name="branch_code" id="branch_code" value="">
<br>
지점명<br>
<input type="text" name="branch_name" id="branch_name">
<br>

사업자 등록 번호<br>
<input type="tel" name="branch_num" id="branch_num">
<br>

대표자명<br>
<input type="text" name="branch_ceo" id="branch_ceo">
<br>

대표자명<br>
<input type="text" name="branch_ceo" id="branch_ceo">
<br>

가맹 담당자<br>
<input type="text" name="emp_num" id="emp_num">
<br>

지점 연락처<br>
<input type="tel" name="emp_num" id="emp_num">
<br>

가맹 담당자<br>
<input type="text" name="emp_num" id="emp_num">
<br>

지점 주소<br>
<input type="text" name="branch_add" id="branch_add">
<br>

지점 주소<br>
<input type="text" name="branch_add" id="branch_add">
<br>

<!-- 주소 API 가지고와서 주소 입력시 자동으로 우편번호 생성될 수는 없나요,,,? -->
지점 우편번호<br>
<input type="tel" name="branch_post" id="branch_post">
<br>

지점 이메일<br>
<input type="email" name="branch_email" id="branch_email">
<br>
<br>

<input type="hidden" id="permission" name="permission" value="">
<input type="submit" value="등록">
</form>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


                <!-- 내용들어가는곳 -->	    
                </main>

<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>