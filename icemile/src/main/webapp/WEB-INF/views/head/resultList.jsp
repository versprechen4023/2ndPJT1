<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                <!-- 내용 들어가는 곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">생산 실적</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
                        <c:if test="${sessionScope.emp_role.charAt(1).toString() eq '1' }">
							<input type="button" value="추가" id="rsAdd">
							<input type="button" value="수정" id="rsupdate">
							<input type="button" value="삭제" id="rsdelete">
							<input type="button" value="취소" id="rscancel" disabled>
							<input type="button" value="저장" id="rssave" disabled>
						</c:if>
						</div>
                        <div class="card mb-4">
<!--                             <div class="card-header"> -->
<!--                                 <i class="fas fa-table me-1"></i> -->
<!--                                 DataTable Example -->
<!--                             </div> -->
                            <div class="card-body">
                            <div class="card-body">
                            <input type="button" name="allList" value="전체목록" onclick="location.reload();">
                           
                            
                            완료일자
                            <input type="text" name="done_dateBegin" id="done_dateBegin"> ~
                            <input type="text" name="done_dateEnd" id="done_dateEnd" disabled>
                            <br>
                            
                            
                            진행상태
							<select id="rs_process">
  								<option value="">전체</option>
  								<option value="1">진행중</option>
  								<option value="2">마감</option>
							</select>
							<input type="text" name="content" size=60 placeholder="자재명을 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="resultSearch()">
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                        	                                        	
                                        	<th data-sortable="false"><input type="checkbox" name="selectedAllRSList"></th>
                                            <th>실적 코드</th>
                                            <th>작업 지시 코드</th>
                                            <th>작업 지시 완료 날짜</th>
                                            <th>라인 코드</th>
                                            <th>완제품 코드</th>
                                            <th>지시 수량</th>
                                            <th>양품</th>
                                            <th>불량</th>
                                            <th>불량 사유</th>
                                            <th>진행 현황</th>                                            
                                            <th>비고</th>

                                        </tr>
                                    </thead>
                                
                                    <tbody>
                                   	<c:forEach var="ResultListDTO" items="${resultList}">
                                        <tr>
                                        	<td><input type="checkbox" name="selectedRSList" value="${ResultListDTO.result_code}"></td>
                                            <td>${ResultDTO.result_code}</td> 
                                            <td>${ResultDTO.work_code}</td>
                                          	<c:choose>
   												<c:when test="${empty ResultDTO.done_date}">
        											<td>-</td>
    											</c:when>
    											<c:otherwise>
        											<td>${ResultDTO.done_date}</td>
    											</c:otherwise>
											</c:choose>
                                            <td>${ResultDTO.line_code}</td>
                                            <td>${ResultDTO.prod_code}</td>
                                            <td>${ResultDTO.order_amount}</td>
                                            <td>${ResultDTO.good_prod}</td>
                                            <td>${ResultDTO.faulty_prod}</td>
                                            <td>${ResultDTO.faulty_reason}</td>
                                            <c:if test="${ResultListDTO.rs_process eq 0}">
                                            	<td>진행중</td>
                                            </c:if>
                                            <c:if test="${ResultListDTO.rs_process eq 1}">
                                            	<td>마감</td>
                                            </c:if>
                                            <td>${ResultDTO.remark}</td>
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
<!-- 데이트피커 J쿼리등을 사용하기위한 호출 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  데이트피커 커스텀 css-->
<link rel="stylesheet" type="text/css" href="../resources/css/datepicker.css">

<!-- 모달 alert를 위한 sweetalert 호출 -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/js/productList_im.js"></script>
	
<!-- 엑셀파일 저장을 위한 스크립트 호출 -->
	<script src="https://unpkg.com/file-saver/dist/FileSaver.min.js"></script>
    <script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>

<script>
//추가, 수정 을 구분하기위한 전역변수선언
var status = "";

//실적 검색 관련 함수
function resultSearch(){
	// 값을 전달 하기위한 JSON 타입 변수선언
	   var json = {
			   		done_dateBegin: $('#done_dateBegin').val(),
			   		done_dateEnd: $('#done_dateEnd').val(),
			   		status: $('#status').val(),
    				content: $('#content').val()	
					}; //JSON
					
		// 검색 결과값을 받아오기 위한 ajax 호출
		$.ajax({url : '${pageContext.request.contextPath}/head_Ajax/resultSearch',
}// resultSearch()


</body>
</html>
