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
<form id="rawOrderList">
                <main>
                <main>
                <!-- 내용들어가는곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">발주</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        <c:if test="${sessionScope.emp_role.charAt(1).toString() eq '1' }">
							<input type="button" value="발주추가" id="rawOrderAdd">
							<input type="button" value="수정" id="updateRawOr">
							<input type="button" value="삭제" id="deleteRawOr">
							<input type="button" value="취소" id="cancelRawOr" disabled>
							<input type="button" value="저장" id="saveRawOr" disabled>
						</c:if>
						</div>
                        <div class="card mb-4">
<!--                             <div class="card-header"> -->
<!--                                 <i class="fas fa-table me-1"></i> -->
<!--                                 DataTable Example -->
<!--                             </div> -->
                            <div class="card-body">
                            <input type="button" name="allList" value="전체목록" onclick="location.reload();">
							<select id="category">
  								<option value="rawOrderAll">전체</option>
  								<option value="rawOrderUn">발주중</option>
  								<option value="rawOrderCom">발주확정</option>
							</select>
							<input type="text" name="content" size=60 placeholder="검색어를 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="productSearch()">
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                        	<th>선택</th>
                                            <th>순서</th>
                                            <th>코드</th>
                                            <th>발주처</th>
                                            <th>품명</th>
                                            <th>발주량</th>
                                            <th>발주 일자</th>
                                            <th>입고 예정일</th>
                                            <th>진행 상황</th>
                                            <th>담당자</th>

                                        </tr>
                                    </thead>
                                    <tfoot>
                                    <!-- "테이블 바닥글"을 나타냅니다. 이 부분은 테이블의 하단 요약 정보나 추가 설명 등을 담습니다. -->
                                    <!-- <tfoot> 부분은 없어도 될 것 같은데 기존 템플릿에 있던 태그라 그냥 둔 겁니다! -->
                                        <tr>
                                        	<th>선택</th>
                                            <th>순서</th>
                                            <th>코드</th>
                                            <th>발주처</th>
                                            <th>품명</th>
                                            <th>발주량</th>
                                            <th>발주 일자</th>
                                            <th>입고 예정일</th>
                                            <th>진행 상황</th>
                                            <th>담당자</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                        	<th class="eachCheck">
            					 				<input type="checkbox" name="cbox" class="eachCheckbox"></th>
                                            <th>1</th>
                                            <th>OB230925거래처코드</th> <!-- 대충... -->
                                            <th>니이거무스?</th>
                                            <th>밀크 초콜릿 무스</th>
                                            <th>30</th>
                                            <th>2023-09-20</th>
                                            <th>2023-09-25</th>
                                            <th>3</th>
                                            <th>IM000001</th>
                                        </tr>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
