<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <!-- 내용들어가는곳 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">지점 관리</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        
                       <div>
                        <div class="bnt">
<%--                         <c:if test="${sessionScope.emp_role.charAt(0).toString() eq '1' }"> --%>
                       <input type="button" value="지점 등록" onclick="branchReg()"></div>
<%--                         </c:if> --%>
                        <div class="card mb-4">
<!--                             <div class="card-header"> -->
<!--                                 <i class="fas fa-table me-1"></i> -->
<!--                                 DataTable Example -->
<!--                             </div> -->
                            <div class="card-body">
                            
                            <!-- 지점 검색 기능 -->
							<select id="category">
  								<option value="branch_code">지점코드</option>
  								<option value="branch_name">지점명</option>
  								<option value="emp_num">가맹 담당자명</option>
  								<option value="branch_phone">지점 연락처</option>
							</select>
							<input type="text" name="content" size=60 placeholder="검색어를 입력하세요"
								id="content">
							<input type="button" name="search" value="조회" onclick="branchSearch()">
                            <!-- 지점 검색 기능 -->
                            
                                <table id="datatablesSimple">
                                
                                    <thead>
                                    <!-- "테이블 머리글"을 나타냅니다. 이 부분은 테이블의 제목 행들을 담습니다. 보통 테이블의 컬럼명이나 제목이 들어갑니다. -->
                                        <tr>
                                            <th>코드</th>
                                            <th>지점명</th>
                                            <th>사업자번호</th>
                                            <th>대표자</th>
                                            <th>연락처</th>
                                            <th>우편번호</th>
                                            <th>주소</th>
                                            <th>이메일</th>
                                            <th>담당자</th>
<%--                                             <c:if test="${sessionScope.emp_role.charAt(0).toString() eq '1' }"> --%>
											<th data-sortable="false">관리</th>
<%-- 											</c:if> --%>

                                        </tr>
                                    </thead>
                                    <tbody id= "tbody">
                                    <c:forEach var="sellDTO" items="${branchList }">
                                        <tr>
                                            <td>${sellDTO.branch_code }</td> 
                                            <td>${sellDTO.branch_name }점</td>
                                            <td>${sellDTO.branch_reg }</td>
                                            <td>${sellDTO.branch_ceo }</td>
                                            <td>${sellDTO.branch_phone }</td>
                                            <td>${sellDTO.branch_post }</td>
                                            <td>${sellDTO.branch_add }</td>
                                            <td>${sellDTO.branch_email }</td>
                                            <td><%-- ${memberDTO.emp_num } --%>박소현</td>
<%--                                             <c:if test="${sessionScope.emp_role.charAt(0).toString() eq '1' }"> --%>
											<td><input type="button" value="수정"
												onclick="branchUpdate('${sellDTO.branch_code}')" id="updateBranch">
												<input type="button" value="삭제"
												onclick="branchDelete('${sellDTO.branch_code}')" id="deleteBranch">
											</td>
<%-- 											</c:if> --%>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
