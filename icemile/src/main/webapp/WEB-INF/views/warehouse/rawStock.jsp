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

<style>
#empBox {
    display: flex;
}

#emp_num {
    margin-right: 7px;
}
</style>

</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
		<!-- 사이드바 -->
		<jsp:include page="../include/sidebar.jsp"></jsp:include>
		<!-- 사이드바 -->
            <div id="layoutSidenav_content">
<form id="facilityList">
                <main>
                <!-- 내용 들어가는 곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">원자재 재고</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        <!-- 아이디 session 들고 와서 admin일 때만 추가~저장 버튼 보이게 -->
                        <c:if test="${sessionScope.emp_num eq 'admin'}">
                        <!-- <input type="button" class ="tableBtn" id="add" value="추가"> -->
                        <input type="button" class ="tableBtn" id="update" value="수정">
                        <!-- <input type="button" class ="tableBtn" id="delete" value="삭제"> -->
                        <input type="button" class ="tableBtn" id="save" value="저장">
                        <input type="button" class ="tableBtn" id="cancel" value="취소">
                        </c:if>
                        </div>
                        <div class="card mb-4" id="card mb-4">
                            <div class="card-body" id="card-body">
                            <input type="button" name="allList" value="전체목록" onclick="location.reload();">
							<select id="category">
  								<option value="line_code">코드</option>
  								<option value="line_name">이름</option>
							</select>
							<input type="text" name="content" size=60 placeholder="검색어를 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="stockSearch()">
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                        	<th data-sortable="false"><input type="checkbox" name="selectedAll"></th>
                                            <th>코드</th>
                                            <th>원자재 이름</th>
                                            <th>종류</th>
                                            <th>수량</th>
                                            <th>실수량</th>
                                            <th>창고 코드</th>
                                            <th>담당자</th>
                                            <th>확인 날짜</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableBody">
                                    	<c:forEach var="stockDTO" items="${rawStock}">
                                        <tr>
                                        	<td><input type="checkbox" name="selected" value="${facilityDTO.line_code}"></td>
                                            <td>${stockDTO.stock_code}</td>
                                            <td>${stockDTO.raw_name}</td>
                                            <td>${stockDTO.raw_type}</td>
                                            <td>${stockDTO.stock_status}</td>
                                            <td>${stockDTO.stock_amount}</td>
                                            <td>${stockDTO.wh_code}</td>
                                            <td><a href="#" onclick="memberInfo('${stockDTO.emp_num}')">admin</a></td>
                                            <td>${stockDTO.stock_date}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
</form>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/facilityList_im.js"></script>
        
        
		<script type="text/javascript">
		
		
		// 추가, 수정 을 구분하기위한 전역변수선언
		// 전역변수란? 함수 밖에서 선언하고 어디서든지 사용 가능한 변수
		var status = "";
		
		
		
		function memberInfo(emp_num) {
			window.open('${pageContext.request.contextPath }/member/managerInfo?emp_num='+ emp_num+'', '_blank', 'width=590px, height=770px, left=600px, top=300px');
		}
		
		
		// 수정
		$("#update").click(function(){

		// 상태를 업데이트로 변경한다
		// 이 함수의 목적이 수정(update)인 것을 나타내기 위함
		status = "update";

		// 체크박스가 체크된 여부를 확인하기위한 변수선언
		var selectedCheckbox = $("input[name='selectedLineCo']:checked");

		// 체크된 체크박스가 하나인 경우에만 수정 기능 작동
		if (selectedCheckbox.length === 1) {
	
			// 텍스트태그를 추가할 tr태그를 선택한다
			var row = selectedCheckbox.closest("tr");
	
			// input type의 name 값 지정
			var cellNames = [
				"line_code", 
				"line_name", 
				"line_phone", 
				"line_process",
				"line_status",
				"emp_num",
				"line_note"
			];
	
			// input type의 id 값 지정
			var cellIds = [
				"line_code", 
				"line_name", 
				"line_phone", 
				"line_process",
				"line_status",
				"emp_num",
				"line_note"
			];
	
	
			// 각 셀을 수정 가능한 텍스트 입력 필드로 변경(단 첫번째의 체크박스가 있는 셀은 제외한다)
			row.find("td:not(:first-child)").each(function(index) {
		
				// 기존 텍스트 값을 변수에 저장한다
				var cellValue = $(this).text();
				// 삼항연산자 0번째 행(코드)와 1번째행(이름)는 리드온리로 변경할 수 없다
				var cellOption = index === 0 || index === 1 ? "readonly" : "";
				// 반복문의 숫자에 따라 html 태그의 이름을 네임 이름으로 한다
				var cellName = cellNames[index];
				// 반복문의 숫자에 따라 html 태그의 이름을 아이디 이름으로 한다
				var cellId = cellIds[index];
		
				if (cellName === "line_process") {
				    // 선택 옵션 값 가져오기
				    var selectedValue = $(this).find("select").val();
				    $(this).html('<select name="' + cellName + '" id="' + cellId + '" ' + cellOption + '>' + 
				        '<option value="1" ' + (selectedValue === "1" ? "selected" : "") + '>1차 공정</option>' +
				        '<option value="2" ' + (selectedValue === "2" ? "selected" : "") + '>2차 공정</option>' +
				        '<option value="3" ' + (selectedValue === "3" ? "selected" : "") + '>3차 공정</option>' +
				        '</select>');
				} else if (cellName === "line_status") {
				    var selectedValue = $(this).find("select").val();
				    $(this).html('<select name="' + cellName + '" id="' + cellId + '" ' + cellOption + '>' + 
				        '<option value="1" ' + (selectedValue === "1" ? "selected" : "") + '>1:가동중</option>' +
				        '<option value="2" ' + (selectedValue === "2" ? "selected" : "") + '>2:대기중</option>' +
				        '<option value="3" ' + (selectedValue === "3" ? "selected" : "") + '>3:고장</option>' +
				        '</select>');
				} else {
				    $(this).html('<input type="text" name="' + cellName + '" id="' + cellId + '" value="' + cellValue + '"' + cellOption + ' >');			
				}

			});// end_find(행 검색 반복문 종료지점)
			
			// "담당자" 열에 있는 입력란 옆에 "조회" 버튼을 추가
	        //row.find("#empBox").append('<input type="button" name="empSearch" id="empSearch" value="조회">');

			// 품목수정중에 품목추가,수정,삭제 버튼을 비활성화한다
  			$("#add").attr('disabled','disabled');
  			$("#update").attr('disabled','disabled');
			$("#delete").attr('disabled','disabled');
	
			// 품목수정중에 취소, 저장 버튼입력이 가능하다
			$("#cancel").removeAttr("disabled");
			$("#save").removeAttr("disabled");
	
		} // end if

		// 체크박스가 선택되어있지않으면 에러가 발생한다
		else if (selectedCheckbox.length === 0){
			Swal.fire('수정할 행을 선택해 주십시오.', '실패', 'error');
		// 여러개가 체크되어있으면 에러가 발생한다
		} else {
			Swal.fire('수정할 행은 한개만 선택 가능합니다.', '실패', 'error');
		} // end else
	}); // end update function
		
		
        </script>
        
        
        
    </body>
</html>
