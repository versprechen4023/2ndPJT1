<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>warehouse</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
	
<!-- 	관리 추가탭 -->
	<script type="text/javascript">
		//창고 추가
		function warehouseInsert() {
			window
					.open(
							'${pageContext.request.contextPath }/warehouse/warehouseAdd',
							'_blank',
							'width=1300px, height=300px, scrollbars=yes, left=600px, top=300px');
		} //end function
	</script>
	
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
				<div class="container-fluid px-4">
					<h1 class="mt-4">창고관리</h1>
					<ol class="breadcrumb mb-4">
						<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
						<!--                             <li class="breadcrumb-item active">Tables</li> -->
					</ol>
					<div class="bnt">
						<input type="button" value="추가" onclick="warehouseInsert()">
					</div>
					
					<div class="card mb-4">
						<div class="card-body">
						     <input type="button" name="allList" value="전체목록" onclick="">
							  <select id="category">
  								<option value="1">코드</option>
  								<option value="2">이름</option>
  								<option value="3">종류</option>
  								<option value="4">위치</option>
  								<option value="5">가용상태</option>
  								<option value="6">담당자</option>
							   </select>
							  <input type="text" name="content" size=60 placeholder="검색어를 입력하세요" id="content">
							  <input type="button" name="search" value="조회" onclick="">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>순서</th>
										<th>코드</th>
										<th>이름</th>
										<th>종류</th>
										<th>위치</th>
										<th>전화번호</th>
										<th>가용상태</th>
										<th>완제품 코드</th>
										<th>원자재 코드</th>
										<th>담당자</th>
										<th>비고</th>
										<th>관리</th>
									</tr>
								</thead>

								<tbody id="tbody">
									<c:forEach var="WareHouseDTO" items="${houseList}">
										<tr>
											<td></td>
											<td>${WareHouseDTO.wh_code}</td>
											<td>${WareHouseDTO.wh_name}</td>
											<td>${WareHouseDTO.wh_type}</td>
											<td>${WareHouseDTO.wh_location}</td>
											<td>${WareHouseDTO.wh_phone}</td>
											<td>${WareHouseDTO.wh_status}</td>
											<td>${WareHouseDTO.prod_code}</td>
											<td>${WareHouseDTO.raw_code}</td>
											<td>${WareHouseDTO.emp_num}</td>
											<td>${WareHouseDTO.wh_note}</td>
											<td><input type="button" value="수정"
												onClick="wareHouseUpdate('${WareHouseDTO.wh_code}')"
												id="updatehouse"> <span>&nbsp;</span> <input
												type="button" value="삭제"
												onClick="wareHousedelete('${WareHouseDTO.wh_code}')"
												id="deletehouse"></td>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/warehouse_im.js"></script>
</body>
</html>
