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
	

<!-- 제공한 코드는 SweetAlert2 라이브러리를 로드하는 스크립트입니다.  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- 해당 코드는 jQuery로드  -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 데이트피커 J쿼리등을 사용하기위한 호출 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 제공한 코드는 jQuery UI 라이브러리의 스크립트를 로드하는 부분입니다.  -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<!-- 	관리 추가탭 -->
	<script type="text/javascript">
		//============================ 버튼 구현 ====================================//

		//창고추가 클릭시 행 추가
		function addRow() {

			var row = "<tr>";

			//창고 코드 
			row += "<td>";
			row += "<input type='text' name='wh_code' id='wh_code' required class='#datatablesSimple tr'>";
			row += "</td>";

			//창고 이름
			row += "<td>";
			row += "<input type='text' name='wh_name' id='wh_name' required class='#datatablesSimple tr'>";
			row += "</td>";

			//창고 종류 
			row += "<td>";
			row += "<select name='wh_type' id='wh_type' required class='#datatablesSimple tr'>";
			row += "<option value='1'>--선택--</option>";
			row += "<option value='R'>R:원자재</option>";
			row += "<option value='p'>p:완재품</option>";
			row += "</select>";
			row += "</td>";

			//창고 위치
			row += "<td>";
			row += "<input type='text' name='wh_location' id='wh_location' required class='#datatablesSimple tr'>";
			row += "</td>";

			//창고 전화번호
			row += "<td>";
			row += "<input type='text' name='wh_phone' id='wh_phone' required class='#datatablesSimple tr'>";
			row += "</td>";

			//가용상태
			row += "<td>";
			row += "<select name='wh_status' id='wh_status'>";
			row += "<option value='1'>Y</option>";
			row += "<option value='2'>N</option>";
			row += "</select>";
			row += "</td>";

			//완재품 코드
			row += "<td>";
			row += "<input type='text' name='prod_code' id='prod_code' required class='#datatablesSimple tr'>"
			row += "</td>";

			//원자재 코드
			row += "<td>";
			row += "<input type='text' name='raw_code' id='raw_code' required class='#datatablesSimple tr'>"
			row += "</td>";

			//담당자
			row += "<td>";
			row += "<input type='text' name='emp_num' id='emp_num' required class='#datatablesSimple tr'>"
			row += "</td>";

			//비고
			row += "<td>";
			row += "<input type='text' name='wh_note' id='wh_note' class='#datatablesSimple tr'>"
			row += "</td>";

			//관리
			row += "<td>";
			row += "<button type='submit' onclick='save()' class='B B-info'>저장</button>";
			row += "</td>";

			row += "</tr>";

			$('#datatablesSimple').append(row);
		} // addRow()

		// 저장 -> 저장 공백확인 함수
		function save() {

					var wh_code = $('#wh_code').val();
					var wh_name = $('#wh_name').val();
					var wh_type = $('#wh_type').val();
					var wh_location = $('#wh_location').val();
					var wh_phone = $('#wh_phone').val();
					var prod_code = $('#prod_code').val();
					var raw_code = $('#raw_code').val();
					var emp_num = $('#emp_num').val();
					var wh_note = $('#wh_note').val();

					if (wh_code == "" || wh_name == "" || wh_type == ""
							|| wh_location == "" || wh_phone == ""
							|| prod_code == "" || raw_code == ""
							|| raw_code == "" || emp_num == "") {

						Swal.fire({
							title: "<div style='color:#495057;font-size:20px;font-weight:lighter'>" + "항목을 모두 입력하세요"+ "</div>",
							icon : 'info',
							width : '300px',
						})

					}
				} // save
		
		
        // 페이지를 새로 고치는 함수
		function cancle() {
		    location.reload();
		}		
        
		// 버튼 클릭 이벤트 핸들링
		$('#myButton').click(function() {
		    alert('버튼이 클릭되었습니다.');
		});
		
		//============================ 수정 구현 ====================================//
		
	</script>
</head>
<body class="sb-nav-fixed">

<!-- 로그인이 안되어 있을시 로그인 페이지로 바로가기 -->
<c:if test="${empty sessionScope.emp_num}">
    <c:redirect url="/member/login" />
</c:if>

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
					
					<input type="button" id="myButton" value="확인">
					
					<form action="${pageContext.request.contextPath}/warehouse/warehouseAdd" id="fr" method="post">
						<ol class="breadcrumb mb-4">
						</ol>
						<div class="bnt">
							<input type="button" onclick="cancle()" value="취소">
							<span>&nbsp;</span>
							<input type="button" onclick="addRow()" value="추가">
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
								</select> <input type="text" name="content" size=60
									placeholder="검색어를 입력하세요" id="content"> <input
									type="button" name="search" value="조회" onclick="">

								<table id="datatablesSimple">

									<thead>
										<tr>
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
					<td>
					<input type="button" value="수정" onClick="wareHouseUpdate('${WareHouseDTO.wh_code}')" id="updatehouse"> 
					<span>&nbsp;</span> 
					<input type="button" value="삭제" onClick="wareHousedelete('${WareHouseDTO.wh_code}')" id="deletehouse">
					</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</form>
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
