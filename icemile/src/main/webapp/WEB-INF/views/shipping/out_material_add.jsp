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
<!-- 로그인이 안되어 있을시 로그인 페이지로 바로가기 -->
<c:if test="${empty sessionScope.emp_num}">
	<c:redirect url="/member/login" />
</c:if>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<!-- 사이드바 -->
		<jsp:include page="../include/sidebar.jsp"></jsp:include>
		<!-- 사이드바 -->
		<div id="layoutSidenav_content">
			<form id="warehousList">
				<main>
					<!-- 내용들어가는곳 -->
					<div class="container-fluid px-4">
						<h1 class="mt-4">창고관리</h1>
						<ol class="breadcrumb mb-4">
						</ol>
						<div class="bnt">

							<c:if
								test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
								<input type="button" value="창고추가" id="whAdd">
								<span>&nbsp;</span>
								<input type="button" value="수정" id="updateWh">
								<span>&nbsp;</span>
								<input type="button" value="삭제" id="deleteWh">
								<span>&nbsp;</span>
								<input type="button" value="취소" id="cancelWh" disabled>
								<span>&nbsp;</span>
								<input type="button" value="저장" id="saveWh" disabled>
							</c:if>

						</div>

						<div class="card mb-4">
							<div class="card-body">
								<!--location.reload() 함수를 호출하여 현재 웹 페이지를 다시 로드하도록 지정합니다. -->
								<input type="button" name="allList" value="전체목록"
									onclick="location.reload();"> <select id="category">
									<option value="wh_code">코드</option>
									<option value="wh_name">이름</option>
									<option value="wh_type">종류</option>
									<option value="wh_location">위치</option>
									<option value="wh_status">가용상태</option>
									<option value="emp_num">담당자</option>
								</select> 
								<input type="text" name="content" size=60
									placeholder="검색어를 입력하세요" id="content">
								<input
									type="button" name="search" id="inputwhSearch" value="조회" >
							

									<table id="datatablesSimple">
										<thead>
											<tr>
												<!-- data-sortable="false":데이터를 테이블에서 정렬할수 있는지 여부를 나타내는것 false로 설정되어 있으므로 이 열은 정렬할수 없는 열 -->
												<!-- name="selectedAllProId": 이 속성은 입력 요소에 이름을 부여합니다. 이 경우 "selectedAllProId"로 설정되어 JavaScript나 서버 측 코드에서 이 체크박스를 식별할 수 있습니다. -->
												<th data-sortable="false"><input type="checkbox"
													name="selectedAllProId"></th>
												<th>창고 코드</th>
												<th>창고 이름</th>
												<th>창고 종류</th>
												<th>창고 위치</th>
												<th>창고 전화번호</th>
												<th>창고 가용상태</th>
												<th>완제품 코드</th>
												<th>원자재 코드</th>
												<th>창고 담당자</th>
												<th>비고</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="WareHouseDTO" items="${houseList}">
												<tr>
													<!--체크박스를 선택하면 wh_code가 서버로 이동하면서 checkbox의 값이 지정되어서 체크박스가 어떤행을 선택하게 되는지 알수 있다 -->
													<td><input type="checkbox" name="selectedProId"
														value="${WareHouseDTO.wh_code}"></td>
													<td>${WareHouseDTO.wh_code}</td>
													<td>${WareHouseDTO.wh_name}</td>
													<td>${WareHouseDTO.wh_type}</td>
													<td>${WareHouseDTO.wh_location}</td>
													<td>${WareHouseDTO.wh_phone}</td>

													<c:choose>
														<c:when test="${WareHouseDTO.wh_status == 1}">
															<td>Y</td>
														</c:when>
														<c:when test="${WareHouseDTO.wh_status == 2}">
															<td>N</td>
														</c:when>
													</c:choose>

													<td>${WareHouseDTO.prod_code}</td>
													<td>${WareHouseDTO.raw_code}</td>
													<td>${WareHouseDTO.emp_num}</td>
													<td>${WareHouseDTO.wh_note}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
			</form>

		</div>
	</div>

	<input type="button" value="엑셀파일다운" id="excelProd">

	</div>
	<!-- 내용 들어가는 곳 -->
	</main>

	<!-- 푸터 -->
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<!-- 푸터 -->

	</div>
	</div>

	<!-- 모달 alert를 위한 sweetalert 호출 -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<!-- J쿼리 호출 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/warehouse_im.js"></script>
	<!-- 엑셀파일 저장을 위한 스크립트 호출 -->
	<script src="https://unpkg.com/file-saver/dist/FileSaver.min.js"></script>
	<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>