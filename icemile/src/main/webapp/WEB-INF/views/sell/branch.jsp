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
        <title>branch</title>
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
                        <div class="bnt">
                        <button>추가</button><button>수정</button>
                        <button>삭제</button><button>취소</button><button>저장</button></div>
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
                                        	<th>선택</th>
                                            <th>순서</th>
                                            <th>코드</th>
                                            <th>지점명</th>
                                            <th>사업자번호</th>
                                            <th>대표자</th>
                                            <th>연락처</th>
                                            <th>우편번호</th>
                                            <th>주소</th>
                                            <th>이메일</th>
                                            <th>담당자</th>

                                        </tr>
                                    </thead>
                                    <tfoot>
                                    <!-- "테이블 바닥글"을 나타냅니다. 이 부분은 테이블의 하단 요약 정보나 추가 설명 등을 담습니다. -->
                                    <!-- <tfoot> 부분은 없어도 될 것 같은데 기존 템플릿에 있던 태그라 그냥 둔 겁니다! -->
                                        <tr>
                                        	<th>선택</th>
                                            <th>순서</th>
                                            <th>코드</th>
                                            <th>지점명</th>
                                            <th>사업자번호</th>
                                            <th>대표자</th>
                                            <th>연락처</th>
                                            <th>우편번호</th>
                                            <th>주소</th>
                                            <th>이메일</th>
                                            <th>담당자</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                          <c:forEach var="sellDTO" items="">
                                        	<th class="eachCheck">
            					 				<input type="checkbox" name="cbox" class="eachCheckbox"></th>
                                            <th>1</th>
                                            <th>${sellDTO.branch_code}</th> <!-- 대충... -->
                                            <th>1호점</th>
                                            <th>303-51-030303</th>
                                            <th>박소현</th>
                                            <th>051-333-0303</th>
                                            <th>03033</th>
                                            <th>부산광역시 부산진구 동천로 109 삼한골든게이트 7층</th>
                                            <th>itwillbs@naver.com</th>
                                            <th>IM000001</th>
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