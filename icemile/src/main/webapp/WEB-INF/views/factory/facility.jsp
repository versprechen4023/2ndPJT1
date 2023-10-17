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
<link href="../resources/css/cardHeaderDefault.css" rel="stylesheet" />
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
                        <h1 class="mt-4">설비 관리</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        <!-- 아이디 session 들고 와서 admin일 때만 추가~저장 버튼 보이게 -->
                        <c:if test="${sessionScope.emp_role.charAt(2).toString() eq '1' }">
                        <input type="button" class ="tableBtn" id="add" value="추가">
                        <input type="button" class ="tableBtn" id="update" value="수정">
                        <input type="button" class ="tableBtn" id="delete" value="삭제">
                        <input type="button" class ="tableBtn" id="save" value="저장" disabled>
                        <input type="button" class ="tableBtn" id="cancel" value="취소" disabled>
                        </c:if>
                        </div>
                        
                        <div class="card mb-4" id="card mb-4">
                        
                            <div class="card-header">
                            
                             <div class="cardHeaderFirstLine">
                            	<input type="button" name="allList" value="전체목록" onclick="location.reload();">&nbsp;
									<select id="category">
  										<option value="line_code">코드</option>
  										<option value="line_name">이름</option>
									</select>&nbsp;
								<input type="text" name="content" size=60 placeholder="검색어를 입력하세요" id="content">&nbsp;
								<input type="button" name="search" value="조회" onclick="facilitySearch()">                             
                             </div>
                            </div>
                            
                            <div class="card-body" id="card-body">

                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                        	<th data-sortable="false"><input type="checkbox" name="selectedAllLineCo"></th>
                                            <th>코드</th>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                            <th>생산 공정</th>
                                            <th>가동 상태</th>
                                            <th>담당자</th>
                                            <th>비고</th>
                                            <!-- <th>관리</th> -->
                                        </tr>
                                    </thead>
                                    <tbody id="tableBody">
                                    	<c:forEach var="facilityDTO" items="${facilityList}">
                                        <tr>
                                        	<td><input type="checkbox" name="selectedLineCo" value="${facilityDTO.line_code}"></td>
                                            <td>${facilityDTO.line_code}</td>
                                            <td>${facilityDTO.line_name}</td>
                                            <td>${facilityDTO.line_phone}</td>
                                            <td class="facility-process">${facilityDTO.line_process}</td>
                                            <td class="facility-status">${facilityDTO.line_status}</td>
                                            <td><a href="#" onclick="memberInfo('${facilityDTO.emp_num}')">${facilityDTO.emp_num}</a></td>
                                            <td>${facilityDTO.line_note}</td>
                                            <!-- <td><input type="button" value="수정"
												onclick="facilityUpdate()" id="updatefac">
												<input type="button" value="삭제"
												onclick="facilityDelete()" id="updatefac"></td> -->
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
        <!-- <script src="../resources/js/facilityList_im.js"></script> -->
        
        
		<script type="text/javascript">
		
		// 추가, 수정 을 구분하기위한 전역변수선언
		// 전역변수란? 함수 밖에서 선언하고 어디서든지 사용 가능한 변수
		var status = "";
		
		// 함수 시작지점
		$(document).ready(function() {
		
 		// 추가
  		$("#add").click(function() {
 			
        	// 변수 row에 <tr> 태그 할당
			var row = "<tr>";
			
			// 상태를 업데이트로 변경한다
			// 이 함수의 목적이 추가(add)인 것을 나타내기 위함
			status = "add";

			
			// 체크박스
			row += "<td>";
			row += '<input type="checkbox" name="selectedLineCo" disabled>';
			row += "</td>";
			
			// 라인코드
			row += "<td>";
			row += "<select name='line_code' id='line_code' required class='#datatablesSimple tr'>";
			row += "<option disabled selected>단계 선택</option>";
			row += "<option value='PR'>PR:생산</option>";
			row += "<option value='IN'>IN:검수</option>";
			row += "<option value='PA'>PA:포장</option>";
			row += "</select>";
			row += "</td>";
			
			// 라인명
			row += "<td>";
			row += "<input type='text' name='line_name' id='line_name' readonly required class='#datatablesSimple tr'>";
			row += "</td>";
			
			// 전화번호
			row += "<td>";
			row += "<input type='text' name='line_phone' id='line_phone' placeholder='-을 포함하여 입력하세요' required class='#datatablesSimple tr'>";
			row += "</td>";
			
			// 생산공정
			row += "<td>";
			row += "<select name='line_process' id='line_process' required class='#datatablesSimple tr'>";
			row += "<option disabled selected>차수 선택</option>";
			row += "<option value='1'>1차 공정</option>";
			row += "<option value='2'>2차 공정</option>";
			row += "<option value='3'>3차 공정</option>";
			row += "</select>";
			row += "</td>";
			
			// 가동상태
			row += "<td>";
			row += "<select name='line_status' id='line_status' required class='#datatablesSimple tr'>";
			row += "<option disabled selected>상태 선택</option>";
			row += "<option value='1'>1:가동중</option>";
			row += "<option value='2'>2:대기중</option>";
			row += "<option value='3'>3:고장</option>";
			row += "</select>";
			row += "</td>";
			
			// 담당자
			row += "<td class='empBox' id='empBox'>";
			row += "<input type='text' id='emp_num' name='emp_num' readonly>";
			row += "</td>";
			
			// 비고
			row += "<td>";
			row += "<input type='text' name='line_note' id='line_note' class='#datatablesSimple tr'>";
			row += "</td>";
			
			// 저장 -> 상단에 배치
			//row += "<td>";
			//row += "<input type='submit' id='save' class='B B-info' value='저장'>";
			// 하나씩 취소할 수 있는 버튼도 만들기(삭제 버튼과 동일할 듯)
			//row += "</td>";
	
			// 상단에 할당한 <tr> 태그 닫아 주기
			row += "</tr>";
			
			// 생성한 <tr> 요소를 tbody의 첫 행 위에 추가
			$('tbody tr:nth-child(1)').before(row);
			
		  	// 품목추가중에 품목추가,수정,삭제 버튼을 비활성화한다
		  	// disabled(비활성화) 속성 추가(attr) -> .attr('속성 이름', '속성 값')
		  	$("#add").attr('disabled','disabled');
		  	$("#update").attr('disabled','disabled');
			$("#delete").attr('disabled','disabled');
			
			// 품목추가중에 취소, 저장 버튼입력이 가능하다
			// disabled(비활성화) 속성 제거(removeAttr)
			$("#cancel").removeAttr("disabled");
			$("#save").removeAttr("disabled");
			
	        // 라인 이름 변경 이벤트 리스너 추가
	        $("#line_code").on("change", function() {
	            var codeValue = $(this).val();
	            var lineName = $("#line_name");

	            if (codeValue === 'PR') {
	                lineName.val('생산 라인');
	            } else if (codeValue === 'IN') {
	                lineName.val('검수 라인');
	            } else if (codeValue === 'PA') {
	                lineName.val('포장 라인');
	            } else {
	                lineName.val('');
	            }
	        });
		}); // end function addRow
		
		
/* 		function addRow() {
		const table = document.querySelector('#datatablesSimple tbody');
    const newRow = table.insertRow(0);
    
    const inputType = 'text';
    for (let i = 0; i < 6; i++) {
        const newCell = newRow.insertCell(i);
        const input = document.createElement('input');
        input.type = inputType;
        newCell.appendChild(input);
    }

    const saveCell = newRow.insertCell(6);
    const saveButton = document.createElement('input');
    saveButton.type = 'submit';
    saveButton.id = 'save';
    saveButton.value = '저장';

    saveButton.addEventListener('click', function() {

        var line_name = $('#line_name').val();
        var line_phone = $('#line_phone').val();
        var line_process = $('#line_process').val();
        var line_status = $('#line_status').val();
        var emp_num = $('#emp_num').val();
        var line_note = $('#line_note').val();

        if (line_name == "" || line_phone == "" || line_process == "" ||
            line_status == "" || emp_num == "") {
            Swal.fire({
                icon: 'info',
                width: '300px',
            });
        } else {
/*             const xhr = new XMLHttpRequest();
            xhr.open('POST', '/home/factory/addPro', true);
            xhr.send(formData);

            xhr.onload = function() {
                if (xhr.status === 200) {
                    alert('데이터가 성공적으로 저장되었습니다.');
                } else {
                    alert('데이터 저장 중 오류가 발생했습니다.');
                }
            }; 
        }
    });

    saveCell.appendChild(saveButton);
} */

		
			// 저장
         	$('#save').click(function () {
         		
         	    // 일반 전화번호 유효성 검사(080,070 제외)
         	    var num = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))-(\d{3,4})-(\d{4})$/;
         	    var tel = $('#facilityList input[name="line_phone"]').val().trim();
         	    if (!num.test(tel)) {
         	        Swal.fire('전화번호 형식이 올바르지 않습니다', '', 'info');
         	        return; // 전화번호 형식이 올바르지 않으면 더 이상 진행하지 않음
         	    }
      		
				// $(# )안에 있는 값 반환(.val()이 그 역할)해서 
				// 선언한 var 변수에 할당
				var line_code = $('#line_code').val();
				var line_name = $('#line_name').val();
				var line_phone = $('#line_phone').val();
				var line_process = $('#line_process').val();
				var line_status = $('#line_status').val(); 
				var emp_num = $('#emp_num').val();
				var line_note = $('#line_note').val();
				
				// 아래 입력해 준 컬럼에 입력 안 되어 있으면 입력하라는 하단 알림창 뜬다
				if(line_code == "" || line_name == "" || line_phone == "" || line_process == "" ||
						line_status == "" || emp_num == ""){
					
					// <link>의 sweetalert2.min.js.css 및 
					// <script>의 sweetalert2.min.js 추가 시 사용 가능
					Swal.fire({
						title: "<div style='color:#495057;font-size:20px;font-weight:lighter'>" + "항목을 모두 입력하세요"+ "</div>",
						icon: 'info',
						width: '300px',
					})
				
				// input에 값이 입력되면 저장, input의 값이 변경되면 수정에 의한 저장
				}else if(status === "update"){
					// form 태그의 액션을 변수 선언
			        var formAction = $('#facilityList').attr("action");
					
			        var postData = {
			                line_name: line_name,
			                line_phone: line_phone,
			                line_process: line_process,
			                line_status: line_status,
			                emp_num: emp_num,
			                line_note: line_note
			            };
				
				            $('#facilityList').attr("action", "${pageContext.request.contextPath}/factory/updateFacility");
					        $('#facilityList').attr("method", "POST");
					        Swal.fire('수정 완료되었습니다.', '성공', 'success').then(result => {
					            if (result.isConfirmed) {
					                $('#facilityList').submit();
					            }
					        });
				}else if(status === "add"){
						        	 
										// form 태그의 액션을 변수 선언
								        var formAction = $('#facilityList').attr("action");
										
								        var postData = {
								                line_name: line_name,
								                line_phone: line_phone,
								                line_process: line_process,
								                line_status: line_status,
								                emp_num: emp_num,
								                line_note: line_note
								            };
								        
								        $('#facilityList').attr("action", "${pageContext.request.contextPath}/factory/addPro");
								        $('#facilityList').attr("method", "POST");
								        Swal.fire('등록 완료되었습니다.', '성공', 'success').then(result => {
								            if (result.isConfirmed) {
								                $('#facilityList').submit();
								            }
								        });
						        	} 
						});// end save function
			
			
			// 취소 -> 새로고침
			$('#cancel').click(function () {
			    location.reload(); // 현재 페이지를 다시 불러옵니다.
			}); // end cancle function
			
			
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
		
		
		// thead의 체크박스를 클릭했을때 전체체크가되게끔 이벤트를 발생시킨다
		$('input[name="selectedAllLineCo"]').click(function() {
		    // 모든 selectedLineCo 체크박스의 상태를 selectedAllLineCo와 동일하게 설정한다
		    // $this로 selectedAllLineCo의 상태를 가져온다
		    $('input[name="selectedLineCo"]').prop('checked', $(this).prop('checked'));
		});// end function
		
		
		// 삭제
		$("#delete").click(function() {
	
			// 체크박스가 체크된 여부를 확인하기위한 변수선언
			var selectedCheckbox = $("input[name='selectedLineCo']:checked");
	
			// 체크박스가 선택되어있지않다면 에러가 발생한다
			if (selectedCheckbox.length === 0){
				Swal.fire('삭제할 행을 선택해 주십시오.', '실패', 'error');
			} 
			// 체크박스가 선택되어있다면 함수실행
			else {
		
		 		// 데이터를 전송하기위한 폼 데이터 직렬화
    	 		var formData = $('#facilityList').serialize();
		 		
    	 			// 문제없다면 ajax 실행
         			$.ajax({
             			type: "POST",
             			url: "${pageContext.request.contextPath}/factory_ajax/deleteFacility",
             			data: formData,
             			// 통신성공시 콜백함수 response매개변수에 "true" or "false" 결과값이 입력된다
             			success: function(response) {
            	 			// 공백을 제거한다
            	 			const result = $.trim(response);
            	 
                 			if (result == "true") {
                	 			Swal.fire('라인 삭제가 완료되었습니다.', '성공', 'success').then(result => {
                					// 사용자가 확인창을 누르면 실행
                		 			if(result.isConfirmed){
                		 				location.reload(); // 성공 시 새로고침 한다
					 				}
							
					 			});// end alert
                 			} else {
                	 			Swal.fire('라인 삭제에 문제가 발생했습니다.', '실패', 'error');
                 			}
             			},
             			error: function () {
            	 			Swal.fire('서버통신에 문제가 발생했습니다.', '실패', 'error');
             			}
        			});// end AJAX(라인 삭제)
				}// end else
		});//end delete function
		
		});// end 함수
		
		
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
		function facilitySearch() {
			
			   // 원래 매개변수로 전달할려했으나 처음에 언디파인드가 뜨는 문제가 있음 따라서 변수선언
	 		   var role = '${sessionScope.emp_role}';
	 		   
			   // 값 전달 하기위한 JSON 타입 변수선언
			   var json = {
		        			category: $('#category').val(),
		        			content: $('#content').val()
		       			  };
			
			   
			   // 검색 결과값을 받아오기 위한 ajax 호출
		 	   $.ajax({
		 			  url : '${pageContext.request.contextPath}/factory_ajax/facilitySearch',
		 			  // JSON타입의 변수를 스트링으로 변환한다
		 			  data: JSON.stringify(json),
		 			  // JSON타입의 변수를 전송한다
		 	          contentType: 'application/json',
		 			  type : 'POST',
		 			  // 반환은 JSON 타입
		 			  dataType: 'json',
		 			  // 통신성공시 콜백함수 JSON매개변수에 JSON타입의 배열이 입력된다
		 			  success:function(json){
		 				  	
		 				   	// 아무것도 출력할게 없을때 선택자가 삭제되어 테이블을 더이상 초기화하지 못하는 문제가 있음
		 				   	// 따라서 조건문으로 0개가 아닐때만 테이블을 삭제함
		 				 	if(json.length !== 0){
						    	simpleDataTableInstance.destroy();
		 				 	}
		 				  
		 				    // tbody 내용을 초기화
		 				    $('tbody').empty();
							
		 				    // 배열 크기만큼 반복
		 				    json.forEach(function (data) {
		 				    	// tr 태그 생성
		 				        var $tr = $('<tr>');
		 				    		//tr 에 내용추가
		 				        	$tr.append(
		 				        	'<td><input type="checkbox" name="selectedLineCo" value="' + data.line_code + '"></td>',
		 				        	"<td>"+data.line_code+"</td>",
		 				            "<td>"+data.line_name+"</td>",
		 				           	"<td>"+data.line_phone+"</td>",
		 				            "<td>"+data.line_process+"</td>",
		 				         	"<td>"+data.line_status+"</td>",
		 				         	'<td><a href="#" onclick="memberInfo(\'' + data.emp_num + '\')">' + data.emp_num + '</a></td>',
		 				         	"<td>"+data.line_note+"</td>"
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
		
		
		function memberInfo(emp_num) {
			window.open('${pageContext.request.contextPath }/member/managerInfo?emp_num='+ emp_num+'', '_blank', 'width=590px, height=770px, left=600px, top=300px');
		}
		
		// 담당자를 선택하면 새창을 여는 이벤트 리스너
		$(document).on("click", "input[name='emp_num']", function() {
			window.open('${pageContext.request.contextPath }/member/memberListPopUp', '_blank', 'width=590px, height=770px, left=600px, top=300px');
		});// end function
		
		
		// 폼제출을 막고 엔터키로 조회가 가능하게 하는 함수
		// 텍스트타입 제출을 막음
		$('input[type="text"]').keydown(function() {
			// 엔터키 이벤트 발생을 확인한다
			if (event.keyCode === 13) {
				// 폼 태그 제출을 막는다
		 		event.preventDefault();
				// 검색 함수를 실행한다
		 		facilitySearch();
				// 검색입력창을 초기화한다
		 		$('#content').val("");
			}// end if
		});// end function
		
		
		// 생산 공정 프론트에서는 문자열로 보여 주기
		// DOM(Document Object Model 줄임말: document 객체 모델인 DOM은 트리 자료 구조 형태)
		// DOMContentLoaded: 브라우저가 html을 전부 읽고 DOM 트리를 완성하는 즉시 발생
		document.addEventListener('DOMContentLoaded', function() {
			
			// facility-process인 요소 찾아서 statusElements 배열에 할당
		    var statusElements = document.querySelectorAll('.facility-process');
			
			// statusElements 배열의 각 요소에 대한 반복문 실행
		    statusElements.forEach(function(element) {
		    	// 반복 중인 요소의 내용을 statusValue 변수에 할당 후 내용 가져오기
		        var statusValue = element.textContent;
				// switch 구문으로 조건 부여
		        switch (statusValue) {
		            case '1':
		                element.textContent = '1차 공정';
		                break;
		            case '2':
		                element.textContent = '2차 공정';
		                break;
		            case '3':
		                element.textContent = '3차 공정';
		                break;
		            default:
		                element.textContent = '알 수 없음';
		        }
		    });
		});
		

		// 가동 상태 프론트에서는 문자열로 보여 주기
		document.addEventListener('DOMContentLoaded', function() {
		    var statusElements = document.querySelectorAll('.facility-status');

		    statusElements.forEach(function(element) {
		        var statusValue = element.textContent;

		        switch (statusValue) {
		            case '1':
		                element.textContent = '가동중';
		                break;
		            case '2':
		                element.textContent = '대기중';
		                break;
		            case '3':
		                element.textContent = '고장';
		                break;
		            default:
		                element.textContent = '알 수 없음';
		        }
		    });
		});
		
        </script>
        
        
        
    </body>
</html>