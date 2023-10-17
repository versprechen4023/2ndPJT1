<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 헤드 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<!-- 헤드 -->
<link href="../resources/css/cardHeaderDefault.css" rel="stylesheet" />
</head>
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 헤더 -->
<body class="sb-nav-fixed">
<div id="layoutSidenav">
		<!-- 사이드바 -->
		<jsp:include page="../include/sidebar.jsp"></jsp:include>
		<!-- 사이드바 -->
            <div id="layoutSidenav_content">
<form id="rawStock">
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
                        <c:if test="${sessionScope.emp_role.charAt(3).toString() eq '1' }">
                        <!-- <input type="button" class ="tableBtn" id="add" value="추가"> -->
                        <input type="button" class ="tableBtn" id="update" value="수정">
                        <!-- <input type="button" class ="tableBtn" id="delete" value="삭제"> -->
                        <input type="button" class ="tableBtn" id="save" value="저장">
                        <input type="button" class ="tableBtn" id="cancel" value="취소">
                        </c:if>
                        </div>
                        
                        <div class="card mb-4" id="card mb-4">
                        
							<div class="card-header">        
							
                             <div class="cardHeaderFirstLine">
                                  
							<select id="category">
  								<option value="stock_code">코드</option>
  								<option value="raw_name">품명</option>
  								<option value="raw_type">종류</option>
  								<option value="wh_code">창고</option>
							</select>&nbsp;
							<input type="text" name="content" size=60 placeholder="검색어를 입력하세요" id="content">&nbsp;
							<input type="button" name="search" value="조회" onclick="stockSearch()">&nbsp;
							 <input type="button" name="allList" value="전체목록" onclick="location.reload();">
                             </div>             
                             
							</div>  
                            <div class="card-body" id="card-body">

                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                        	<th data-sortable="false"><input type="checkbox" name="selectedAll" disabled></th>
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
                                        	<td><input type="checkbox" name="selected" value="${stockDTO.stock_code}"></td>
                                            <td>${stockDTO.stock_code}</td>
                                            <td>${stockDTO.raw_name}</td>
                                            <td>${stockDTO.raw_type}</td>
                                            <td>${stockDTO.stock_status}</td>
                                            <td>${stockDTO.stock_amount}</td>
                                            <td>${stockDTO.wh_code}</td>
                                            <td><a href="#" onclick="memberInfo('${stockDTO.emp_num}')">${stockDTO.emp_num}</a></td>
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
		
		// 담당자 상세 정보
		function memberInfo(emp_num) {
			window.open('${pageContext.request.contextPath }/member/managerInfo?emp_num='+ emp_num+'', '_blank', 'width=590px, height=705px, left=600px, top=300px');
		}
		
		// 담당자를 선택하면 새창을 여는 이벤트 리스너
		$(document).on("click", "input[name='emp_num']", function() {
			window.open('${pageContext.request.contextPath }/member/memberListPopUp', '_blank', 'width=590px, height=705px, left=600px, top=300px');
		});// end function
		
		
		// 수정
		$("#update").click(function(){

		    // 상태를 업데이트로 변경
		    status = "update";

		    // 체크된 체크박스 가져오기
		    var selectedCheckbox = $("input[name='selected']:checked");

		    // 체크된 체크박스가 하나인 경우에만 수정 기능 작동
		    if (selectedCheckbox.length === 1) {

		        // 텍스트태그를 추가할 tr태그를 선택
		        var row = selectedCheckbox.closest("tr");

		        // stock_code 가져오기
		        var stockCode = row.find("td:nth-child(2)").text().trim(); // stock_code 행 선택

		        // stock_amount 행의 HTML 수정
		        var stockAmountCell = row.find("td:nth-child(6)"); // stock_amount 열 선택
		        var empNumCell = row.find("td:nth-child(8)"); // emp_num 행 선택
		        var stockAmountValue = stockAmountCell.text().trim(); // stock_amount 현재 값 가져오기
		        var empNumValue = empNumCell.text().trim(); // stock_amount 현재 값 가져오기
		        stockAmountCell.html('<input type="text" name="stock_amount" value="' + stockAmountValue + '">');
		        empNumCell.html('<input type="text" id="emp_num" name="emp_num" value="' + empNumValue + '">');

		        // hidden input에 stock_code 추가
		        $('#rawStock').append('<input type="hidden" name="stock_code" value="' + stockCode + '">');

		        // 품목수정중에 품목추가,수정,삭제 버튼 비활성화
		        $("#update").attr('disabled','disabled');

		        // 품목수정중에 취소, 저장 버튼 입력 가능
		        $("#cancel").removeAttr("disabled");
		        $("#save").removeAttr("disabled");

		    } else if (selectedCheckbox.length === 0){
		        Swal.fire('수정할 행을 선택해 주십시오.', '실패', 'error');
		    } else {
		        Swal.fire('수정할 행은 한개만 선택 가능합니다.', '실패', 'error');
		    }
		});
		
		
		// 저장
		$('#save').click(function () {

		    // input에 값이 입력되면 저장, input의 값이 변경되면 수정에 의한 저장
		    if(status === "update"){
		        // form 태그의 액션을 변수 선언
		        var formAction = $('#rawStock').attr("action");
		        
		        // 수정된 stock_amount 값을 가져옴
		        var stockAmount = $('#rawStock input[name="stock_amount"]').val();
		        
		        // 현재 날짜와 시간을 가져오기
		        var currentDate = new Date();
		        var year = currentDate.getFullYear();
		        var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
		        var day = ('0' + currentDate.getDate()).slice(-2);
		        var hours = ('0' + currentDate.getHours()).slice(-2);
		        var minutes = ('0' + currentDate.getMinutes()).slice(-2);
		        var seconds = ('0' + currentDate.getSeconds()).slice(-2);

		        // stock_date를 현재 날짜와 시간으로 업데이트
		        var stockDate = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;

		        // 데이터를 담을 객체를 생성
		        var postData = {
		            stock_amount: stockAmount
		        };
		        
		        // stock_date 값을 폼 데이터에 추가
		        $('<input>').attr({
		            type: 'hidden',
		            name: 'stock_date',
		            value: stockDate
		        }).appendTo('#rawStock');
		        
		        $('#rawStock').attr("action", "${pageContext.request.contextPath}/warehouse/updateRawStock");
		        $('#rawStock').attr("method", "POST");
		        
		        // 수정이 완료되었음을 알리는 알림창 띄우기
		        // 알림창을 띄운 다음 isConfirmed(확인을 누를 때까지 기다리는 코드) 확인 누르면 전송되게
		        Swal.fire('수정 완료되었습니다.', '성공', 'success').then(result => {
		            if (result.isConfirmed) {
		                $('#rawStock').submit();
		            }
		        });
		    } 
		});
		
		// 취소 -> 새로고침
		$('#cancel').click(function () {
		    location.reload(); // 현재 페이지를 다시 불러옵니다.
		}); // end cancle function
		
		
		
		// Table 초기화를 위한 전역변수 선언
		var simpleDataTableInstance;

		// 테이블 초기화 함수
		function simpleDataTable() {
			// 테이블의 선택자를 찾는다
			const datatablesSimple = document.getElementById('datatablesSimple');
				
				// 테이블 객체를 생성하고 전역변수에 저장한다
		     	simpleDataTableInstance = new simpleDatatables.DataTable(datatablesSimple, {
		        
		      		// 페이지 표시 버튼 삭제
		      		perPageSelect : false,
		      		// 검색창 삭제
		      		searchable : false,
		      		// 페이지당 목록 10개
		      		perPage : 10,
		      
		      		//라벨 수정
		      		labels: {
		      		placeholder: "검색",
		      		noResults : "검색 결과가 없습니다",
		      		noRows : "데이터가 없습니다",
		      		info : ""
		      		}
		      }); // end 초기화
		    
		}//end function

		// 돔이 로드될 때 테이블 초기화
		window.addEventListener('DOMContentLoaded', event => {
			simpleDataTable();
		});
		
		
		
		// 조회를 눌렀을때 실행되는 물품 검색관련 함수
		function stockSearch() {
			
		// 값 전달 하기위한 JSON 타입 변수선언
		var json = {
		      category: $('#category').val(),
		      content: $('#content').val()
		      };
			
			   
		// 검색 결과값을 받아오기 위한 ajax 호출
		$.ajax({
		 		url : '${pageContext.request.contextPath}/warehouse_ajax/rawStockSearch',
		 		// JSON타입의 변수를 스트링으로 변환한다
		 		data: JSON.stringify(json),
		 		// JSON타입의 변수를 전송한다
		 	    contentType: 'application/json',
		 		type : 'POST',
		 		// 반환은 JSON 타입
		 		dataType: 'json',
		 		// 통신성공시 콜백함수 JSON매개변수에 JSON타입의 배열이 입력된다
		 		success:function(json){
		 				  
		 			// tbody 내용을 초기화
		 			$('tbody').empty();
							
		 			// 배열 크기만큼 반복
		 			json.forEach(function (data) {
		 				// tr 태그 생성
		 				var $tr = $('<tr>');
		 				    //tr 에 내용추가
		 				    $tr.append(
		 				    '<td><input type="checkbox" name="selected" value="' + data.stock_code + '"></td>',
		 				    "<td>"+data.stock_code+"</td>",
		 				    "<td>"+data.raw_name+"</td>",
		 				    "<td>"+data.raw_type+"</td>",
		 				    "<td>"+data.stock_status+"</td>",
		 				    "<td>"+data.stock_amount+"</td>",
		 				  	"<td>"+data.wh_code+"</td>",
		 				    '<td><a href="#" onclick="memberInfo(\'' + data.emp_num + '\')">' + 'admin' + '</a></td>',
		 				    "<td>"+data.stock_date+"</td>"
		 				    );
		 				 // 생성한 <tr> 요소를 tbody에 추가
		 				 $('tbody').append($tr);
		 				});
		 				    
	  				   // 테이블 재생성 마찬가지로 데이터가있는 경우에만 객체 재생성
	  				   if(json.length !== 0){
	  				       simpleDataTable();
	  				   // 그렇지않은경우 기존 객체를 유지하고 페이징만 삭제
	  				   } else if(json.length === 0){
	  	 				    // 페이징을 삭제
	  	 				   	$('.datatable-pagination-list').remove();
	  	 			   }
		 			  
		 			}// 콜백함수 종료지점
		      });// end_of_ajax
		}// end function
		
		
		// 폼제출을 막고 엔터키로 조회가 가능하게 하는 함수
		// 텍스트타입 제출을 막음
		$('input[type="text"]').keydown(function() {
			// 엔터키 이벤트 발생을 확인한다
			if (event.keyCode === 13) {
				// 폼 태그 제출을 막는다
		 		event.preventDefault();
				// 검색 함수를 실행한다
		 		stockSearch();
				// 검색입력창을 초기화한다
		 		$('#content').val("");
			}// end if
		});// end function
	
		
		// 수량이랑 실수량 개수가 다를 경우 실수량 글자를 빨간색으로 처리
		$(document).ready(function() {
		    // 각 테이블 행을 순회합니다.
		    $('table#datatablesSimple tbody tr').each(function() {
		        var stockStatus = $(this).find('td:nth-child(5)').text(); // stock_status의 값을 가져옵니다
		        var stockAmount = $(this).find('td:nth-child(6)').text(); // stock_amount의 값을 가져옵니다

		        // stock_status와 stock_amount를 비교합니다
		        if (stockStatus !== stockAmount) {
		            // stock_amount 셀에 빨간 글씨 스타일을 적용합니다
		            $(this).find('td:nth-child(6)').css('color', 'red');
		        }
		    });
		});



		
		
        </script>
        
        
        
    </body>
</html>