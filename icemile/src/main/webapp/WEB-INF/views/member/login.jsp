<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - SB Admin</title>
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                        <form action="${pageContext.request.contextPath }/member/login" method="post">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="emp_num" name="emp_num" type="text" placeholder="name@example.com" />
                                                <label for="inputEmail">Email address</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="emp_pw" name="emp_pw" type="password" placeholder="Password" />
                                                <label for="inputPassword">Password</label>
                                                <c:if test="${not empty msg}">
                                                	<span>${msg}</span>
                                                </c:if>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                                <label class="form-check-label" for="inputRememberPassword">Remember Password</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="password.html">Forgot Password?</a>
                                                <a class="btn btn-primary" href="${pageContext.request.contextPath }/member/insert">회원가입하러가기</a>
                                                <input type="submit" value="로그인">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="register.html">Need an account? Sign up!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../resources/js/jquery.cookie.js"></script>
<script>
// 전역 변수 선언
var isChecked = false;
var myId = document.getElementById("emp_num");
	// J쿼리 함수 시작점
	$(document).ready(function() {
		
		// 쿠키에서 값을 가져와서 변수에 저장
		var savedId = $.cookie("emp_num");
		// 쿠키에 값이 있다면 아이디창에 출력 및 체크박스 버튼 활성화
		if (savedId) {
			myId.value = savedId;
			$("#inputRememberPassword").prop("checked", true);
			isChecked = true;
		}
		
		// 아이디 기억 체크박스가 체크되어있는지 유무를 변수에 저장
		$("#inputRememberPassword").change(function () {
			isChecked = $(this).prop("checked");
			// 체크 될때 "emp_num" 쿠키값에 아이디값 저장
			$.cookie("emp_num", myId.value, {expires : 7});
		});
		
		// 기억박스가 체크되어있다면 키이벤트 함수 활성화 및 쿠키 저장 활성화
		if(isChecked){
			// 아이디창 입력이 감지될때마다도 마찬가지로 저장
			$("#emp_num").on("keyup", function() {
				$.cookie("emp_num", myId.value, {expires : 7}); // 7일 동안 유지
			});
		} else {
			// 체크박스 풀경우 키이벤트 삭제
			$("#emp_num").off("keyup");
		}
	});
	// 쿠키 삭제 기능 하고싶으면 이함수사용 
	// $.removeCookie("emp_num");
	// 쿠키확인 방법 f12>어플리케이션>왼쪽패널에서 쿠키선택
</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
    </body>
</html>
