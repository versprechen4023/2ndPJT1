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
                        <form action="${pageContext.request.contextPath}/factory/addPro" method="post">
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        <button type="button" onclick="addRow()">라인 등록</button>
                        <button type="submit" id="facilitySave" name="facilitySave">저장</button></div>
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
                                    </tfoot>
                                    <tbody>
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
        
        
                <script>
        
        //라인 추가 관련 함
        function addRow() {
        	  // table element 찾기
        	  const table = document.getElementById('datatablesSimple');
        	  
        	  // 새 행(Row) 추가
        	  const newRow = table.insertRow();
        	  
        	  /* // 기존 행에서 클래스를 가져와서 새 행에 추가
        	  const existingRow = document.querySelector('#datatablesSimple tr'); // 기존 행의 첫 번째 <tr> 태그 선택
        	  if (existingRow) {
        	    const newStyle = window.getComputedStyle(existingRow);
        	    for (let i = 0; i < newStyle.length; i++) {
        	      const styleName = newStyle[i];
        	      const styleValue = newStyle.getPropertyValue(styleName);
        	      newRow.style[styleName] = styleValue;
        	    }
        	  } */
        	  
        	  
        	  // 7번째 제외한 나머지 Cell에 input 추가
        	    const inputType = 'text'; // input 타입을 지정
        	    for (let i = 0; i < 6; i++) { // 6번째 셀까지 input을 추가
        	        const newCell = newRow.insertCell(i);
        	        const input = document.createElement('input');
        	        input.type = inputType;
        	        newCell.appendChild(input);
        	    }
                
              //등록 시 관리 cell에는 값 안 넣기
          	  const newCell2 = newRow.insertCell(7);

        	}//addRow
        	
        	function saveData() {
        	    // 여기에서 필요한 작업을 수행하고, 폼을 제출합니다.
        	    document.querySelector('form').submit();
        	}
        
        </script>
        
        
        
    </body>
</html>
