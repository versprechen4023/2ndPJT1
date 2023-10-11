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
<form id="proOrderList">
                <main>
                <!-- 내용들어가는곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">수주</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        <c:if test="${sessionScope.emp_role.charAt(1).toString() eq '1' }">
							<input type="button" value="수주추가" id="proOrderAdd">
							<input type="button" value="수정" id="updateProOr">
							<input type="button" value="삭제" id="deleteProOr">
							<input type="button" value="취소" id="cancelProOr" disabled>
							<input type="button" value="저장" id="saveProOr" disabled>
						</c:if>
						</div>
                        <div class="card mb-4">
<!--                             <div class="card-header"> -->
<!--                                 <i class="fas fa-table me-1"></i> -->
<!--                                 DataTable Example -->
<!--                             </div> -->
                            <div class="card-body">
                            <input type="button" name="allList" value="전체목록" onclick="location.reload();">
                            <br>
                            
                            수주일자
                            <input type="text" name="proOrderBegin" id="proOrderBegin" readonly> ~
                            <input type="text" name="proOrderEnd" id="proOrderEnd" readonly disabled>
                            <br>
                            
                            출하예정일
                            <input type="text" name="proOrderOutBegin" id="proOrderOutBegin" readonly> ~
                            <input type="text" name="proOrderOutEnd" id="proOrderOutEnd" readonly disabled>
                            <br>
                            
                            진행상태
							<select id="status">
  								<option value="">전체</option>
  								<option value="1">대기중</option>
  								<option value="2">생산중</option>
  								<option value="3">생산완료</option>
  								<option value="4">출하완료</option>
							</select>
							<input type="text" name="content" size=60 placeholder="담당자를 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="proOrderSearch()">
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                        	<th data-sortable="false"><input type="checkbox" name="selectedAllProOrderId"></th>
                                        	<th>수주코드</th>
                                            <th>담당자</th>
                                            <th>거래처코드</th>
                                            <th>거래처이름</th>
                                            <th>완제품코드</th>
                                            <th>완제품명</th>
                                            <th>완제품가격</th>
                                            <th>주문량</th>
                                            <th>수주금액</th>
                                            <th>수주 일자</th>
                                            <th>출하 예정일</th>
                                            <th>진행 상황</th>
                                            <th>등록일</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <tr>
                                        	<th data-sortable="false"><input type="checkbox" name="selectedProOrderId"></th>
                                        	<th>수주코드</th>
                                            <th>담당자</th>
                                            <th>거래처코드</th>
                                            <th>거래처이름</th>
                                            <th>완제품코드</th>
                                            <th>완제품명</th>
                                            <th>완제품가격</th>
                                            <th>주문량</th>
                                            <th>수주금액</th>
                                            <th>수주 일자</th>
                                            <th>출하 예정일</th>
                                            <th>진행 상황</th>
                                            <th>등록일</th>
                                        </tr>
                                    </tbody>
                                </table>
</form>
                            </div>
                        </div>
                        <input type="button" value="엑셀파일다운" id="excelProOrder">
                    </div>
                <!-- 내용 들어가는 곳 -->
                </main>
                
<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 푸터 -->  
                
            </div>
        </div>
<!-- 데이트피커 J쿼리등을 사용하기위한 호출 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  데이트피커 커스텀 css-->
<link rel="stylesheet" type="text/css" href="../resources/css/datepicker.css">

<!-- 모달 alert를 위한 sweetalert 호출 -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/productList_im.js"></script>
	
<!-- 엑셀파일 저장을 위한 스크립트 호출 -->
	<script src="https://unpkg.com/file-saver/dist/FileSaver.min.js"></script>
    <script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
<script>

</script>
    </body>
</html>
