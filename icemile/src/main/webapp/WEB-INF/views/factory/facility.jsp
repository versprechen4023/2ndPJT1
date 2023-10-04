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
                <!-- 내용 들어가는 곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">설비 관리</h1>
                        <form id="fr">
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        <!-- 아이디 session 들고 와서 admin일 때만 추가~저장 버튼 보이게 -->
                        <c:if test="${sessionScope.emp_num eq 'admin'}">
                        <input type="button" onclick="addRow()" id="add" value="추가">
                        <input type="button" id="update" value="수정">
                        <input type="button" id="delete" value="삭제">
                        <input type="button" id="save" value="저장">
                        <input type="button" id="cancel" value="취소">
                        </c:if>
                        </div>
                        <div class="card mb-4">
<!--                             <div class="card-header"> -->
<!--                                 <i class="fas fa-table me-1"></i> -->
<!--                                 DataTable Example -->
<!--                             </div> -->
                            <div class="card-body" id="card-body">
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                        	<th data-sortable="false"><input type="checkbox" name="selectedAllLineCo"></th>
                                            <th>코드</th>
                                            <th>라인 이름</th>
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
                                            <td>${facilityDTO.line_process}</td>
                                            <td>${facilityDTO.line_status}</td>
                                            <td>${facilityDTO.emp_num}</td>
                                            <td>${facilityDTO.line_note}</td>
                                            <!-- <td><input type="button" value="수정"
												onclick="facilityUpdate()" id="updatefac">
												<input type="button" value="삭제"
												onclick="facilityDelete()" id="updatefac"></td> -->
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
		
		// 함수 시작지점
		$(document).ready(function() {

		// 정규식 제어함수
		function formTest(formData) {
			
			// 결과값 반환을 위한 변수선언
			var result = true;
			
			// 반복문 제어를 위한 변수선언
			var continueFor = true;
			
			// &을 기준으로 끊고 배열 변수를 선언한다 이후 배열에 따라 반복문을 시행한다
			// 기준 데이터는 아래와같다 "content=&type=&line_name="...
			var formArray = formData.split("&");

		    // 사용자에게 알려주기위해 영문 키값을 한글로 매핑한다
		    // 매핑을 위한 JSON 변수선언
		    var koreanNames = {
				"line_code": "라인 코드", 
				"line_name": "라인 이름", 
				"line_phone": "라인 전화번호", 
				"line_process": "생산 공정",
				"line_status": "가동 상태",
				"emp_num": "담당자",
				"line_note": "비고"
			};
			// 반복문을 사용하여 각 항목을 검사한다
			for (var i = 0; i < formArray.length; i++) {
			  
			  // 키값의 기준점은 = 이된다
			  var keyValue = formArray[i].split("=");
			  // 키변수에 키값을 담는다
			  var key = decodeURIComponent(keyValue[0]);
			  // 밸류 변수에 키의 리터럴 값을 담는다
			  var value = decodeURIComponent(keyValue[1]);
			  
			  // 비고와 검색칸은 비어있어도 상관없음
			  if ((key === "line_note" || key === "content") && value === ""){
				  continue;
			  }
			  
			  if (value === "") {
			    // 값이 비어 있는 경우 결과값은 false가 된다
			    Swal.fire(koreanNames[key]+' 값을 입력해주십시오.', '', 'info');
			    result = false;
			    break; // 비어있는 필드를 발견하면 반복문을 종료하고 false를 반환한다
			  }
			  
			  // 중복값 검사수행
			  if (key === "line_name" && value !== "") {
				  // ajax 호출
				  $.ajax({
					  	type: "GET",
				        url: "${pageContext.request.contextPath}/factory_ajax/searchLineName",
				        data: {"line_name": value},
				        success: function(response) {
				        	// 공백을 제거한다
		            		const resultAjax = $.trim(response);
		            		
				        	if(resultAjax == "false"){
				        		result = false;
				        		continueFor = false;
				        		Swal.fire('이미 존재하는 이름입니다 다른 이름을 입력하십시오', '', 'info');
				        	} 
				        }//success 콜백함수 종료지점
				  });// ajax
				  
				  // 중복값이 있다면 반복문을 종료한다
				  if(!continueFor){
					  break;
				  }
			 } // end 중복값 검증

			}// end for
			
			// 결과값 반환
			return result;
		}// end function formTest(formData)
		
 		// 추가
 		// addRow()라는 함수
  		function addRow() {
 			
        	// 변수 row에 <tr> 태그 할당
			var row = "<tr>";
			
			// 이 함수의 목적이 추가(add)인 것을 나타내기 위함
			status = "add";
			
			// 체크박스
			row += "<td>";
			row += "</td>";
			
			// 라인코드
			row += "<td>";
			row += "</td>";
			
			// 라인명
			row += "<td>";
			row += "<input type='text' name='line_name' id='line_name' required class='#datatablesSimple tr'>";
			row += "</td>";
			
			// 전화번호
			row += "<td>";
			row += "<input type='text' name='line_phone' id='line_phone' required class='#datatablesSimple tr'>";
			row += "</td>";
			
			// 생산공정
			row += "<td>";
			row += "<input type='text' name='line_process' id='line_process' required class='#datatablesSimple tr'>";
			row += "</td>";
			
			// 가동상태
			row += "<td>";
			row += "<input type='text' name='line_status' id='line_status' required class='#datatablesSimple tr'>";
			row += "</td>";
			
			// 담당자
			row += "<td>";
			row += "<input type='text' name='emp_num' id='emp_num' required class='#datatablesSimple tr'>";
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
		} // end function addRow
		
		
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
      		
				// $(# )안에 있는 값 반환(.val()이 그 역할)해서 
				// 선언한 var 변수에 할당
				var line_name = $('#line_name').val();
				var line_phone = $('#line_phone').val();
				var line_process = $('#line_process').val();
				var line_status = $('#line_status').val();
				var emp_num = $('#emp_num').val();
				var line_note = $('#line_note').val();
				
				// 아래 입력해 준 컬럼에 입력 안 되어 있으면 입력하라는 하단 알림창 뜬다
				if(line_name == "" || line_phone == "" || line_process == "" ||
						line_status == "" || emp_num == ""){
					
					// <link>의 sweetalert2.min.js.css 및 
					// <script>의 sweetalert2.min.js 추가 시 사용 가능
					Swal.fire({
						title: "<div style='color:#495057;font-size:20px;font-weight:lighter'>" + "항목을 모두 입력하세요"+ "</div>",
						icon: 'info',
						width: '300px',
					})
				
				// input에 값이 입력되면 저장, input의 값이 변경되면 수정에 의한 저장
				}else {
					// form 태그의 액션을 변수 선언
			        var formAction = $('#fr').attr("action");
					
			        var postData = {
			                line_name: line_name,
			                line_phone: line_phone,
			                line_process: line_process,
			                line_status: line_status,
			                emp_num: emp_num,
			                line_note: line_note
			            };

					// 상태가 add면 addPro로 넘어가서 input에 입력한 값이 데이터베이스로 넘어간다
			        if (status === "add") {
			            $('#fr').attr("action", "/home/factory/addPro");
			        // 상태가 update면 update로 넘어가서 변경한 input의 값이 데이터베이스에 업데이트 된다
			        } else if (status === "update") {
			            $('#fr').attr("action", "/home/factory/updateFacility");
			        }

			        $('#fr').attr("method", "POST");
			        $('#fr').submit();
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
			
					// 반복문에 따라 이너 html 실행 모든 입력칸을 텍스트태그로 바꾼다
					$(this).html('<input type="text" name="' + cellName + '" id="' + cellId + '" value="' + cellValue + '"' + cellOption + ' >');
				});// end_find(행 검색 반복문 종료지점)
	
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
		    // 모든 selectedProId 체크박스의 상태를 selectedAllLineCo와 동일하게 설정한다
		    // $this로 AllProId의 상태를 가져온다
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
		 
    	 		// AJAX 제출전에 값이 입력되어있는지 정규식 검사를 수행한다
		 		if(formTest(formData)){
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
				 }// end if(formTest(formData)) 정규식검사
				}// end else
		});//end delete function
		
	});// end 함수
        
        </script>
        
        
        
    </body>
</html>
