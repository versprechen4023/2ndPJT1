<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
    </head>
    <body>
        <div id="layoutError">
            <div id="layoutError_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-6">
                                <div class="text-center mt-4">
                                    <h1 class="display-1">401</h1>
                                    <p class="lead">비인가 접근(Unauthorized)</p>
                                    <p>접근이 거부되었습니다.</p>
                                    <p>Access to this resource is denied.</p>
                                    <a href="${pageContext.request.contextPath }/main/index">
                                        <i class="fas fa-arrow-left me-1"></i>
                                        메인으로 돌아가기
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutError_footer">
         	<!-- 푸터 -->
			<jsp:include page="../include/footer.jsp"></jsp:include>
			<!-- 푸터 --> 
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
    </body>
</html>