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
                                            <td>IM000014</td>
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
		
        </script>
        
        
        
    </body>
</html>
