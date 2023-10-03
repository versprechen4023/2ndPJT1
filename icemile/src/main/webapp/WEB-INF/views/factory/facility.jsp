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
                        <form action="${pageContext.request.contextPath}/factory/addPro" id="fr" method="post">
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        <input type="button" onclick="addRow()" value="라인 등록">
                        <input type="reset" id="cancle" value="취소"></div>
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
                                            <th>라인 이름</th>
                                            <th>전화번호</th>
                                            <th>생산 공정</th>
                                            <th>가동 상태</th>
                                            <th>담당자</th>
                                            <th>비고</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableBody">
                                    	<c:forEach var="facilityDTO" items="${facilityList}">
                                        <tr>
                                            <td>${facilityDTO.line_name}</td>
                                            <td>${facilityDTO.line_phone}</td>
                                            <td>${facilityDTO.line_process}</td>
                                            <td>${facilityDTO.line_status}</td>
                                            <td>${facilityDTO.emp_num}</td>
                                            <td>${facilityDTO.line_note}</td>
                                            <td><input type="button" value="수정"
												onclick="memberUpdate('${memberDTO.emp_num}')" id="updateEmp">
												<input type="button" value="삭제"
												onclick="memberDelete('${memberDTO.emp_num}')" id="deleteEmp"></td>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/facilityList_im.js"></script>
        
        
		<script type="text/javascript">
		
        
		// 라인 등록 버튼 클릭 시 행 추가
		function addRow() {
        	
			var row = "<tr>";
			
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
			
			// 저장
			row += "<td>";
			row += "<input type='submit' id='save' class='B B-info' value='저장'>";
			row += "</td>";

			row += "</tr>";
			
			$('#datatablesSimple').append(row);
		} // addRow()
      	
		
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
					
					Swal.fire({
						icon: 'info',
						width: '300px',
					})

				}else{}
			}); // save
			
			
			// 취소버튼(=새로고침)
			$('#cancle').click(function () {
			    location.reload(); // 현재 페이지를 다시 불러옵니다.
			}); // cancle
                	
        
        </script>
        
        
        
    </body>
</html>
