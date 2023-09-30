<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
		<!-- 사이드바 -->
		<jsp:include page="../include/sidebar.jsp"></jsp:include>
		<!-- 사이드바 -->
		<div id="layoutSidenav_content">
                <main>
                <!-- 내용들어가는곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">품목관리</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        <c:if test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
							<input type="button" value="품목추가" onclick="productAdd()">
						</c:if>
                        </div>
                        <div class="card mb-4">
<!--                             <div class="card-header"> -->
<!--                                 <i class="fas fa-table me-1"></i> -->
<!--                                 DataTable Example -->
<!--                             </div> -->
                            <div class="card-body">
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                            <th>코드</th>
                                            <th>품명</th>
                                            <th>종류</th>
                                            <th>단위</th>
                                            <th>수량</th>
                                            <th>가격</th>
                                            <th>유통기한</th>
                                            <th>매입처코드/지점코드</th>
                                            <th>창고코드</th>
                                            <th>비고</th>
											<c:if test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
											<th data-sortable="false">관리</th>
											</c:if>

                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="productAllDTO" items="${productList}">
                                        <tr>
                                            <th>${productAllDTO.prod_code}</th>
                                            <th>${productAllDTO.prod_name}</th>
                                            <th>${productAllDTO.prod_type}</th>
                                            <th>${productAllDTO.prod_unit}</th>
                                            <th>${productAllDTO.prod_amount}</th>
                                            <th>${productAllDTO.prod_price}</th>
                                            <th>${productAllDTO.prod_exp}</th>
                                            <th>${productAllDTO.deal_code}</th>
                                            <th>${productAllDTO.wh_code}</th>
                                            <th>${productAllDTO.prod_note}</th>
                                            <c:if test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
											<td><input type="button" value="수정"
												onclick="prodUpdate('${productAllDTO.prod_code}')" id="updateProd">
												<input type="button" value="삭제"
												onclick="prodDelete('${productAllDTO.prod_code}')" id="deleteProd">
											</td>
											</c:if>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                <!-- 내용 들어가는 곳 -->
                </main>
                
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->  
                
            </div>
        </div>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/productList_im.js"></script>
<script>
function productAdd(){
	window.open('${pageContext.request.contextPath }/product/productAdd', '_blank', 'width=1500px, height=250px, left=200px, top=300px');
} //end function
</script>
    </body>
</html>
