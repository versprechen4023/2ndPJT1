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
        <title>아이스마일</title>
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
                        <h1 class="mt-4">소요량</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="bnt">
						<input type="button" value="추가" onclick="location.href='${pageContext.request.contextPath}/factory/requirementAdd'">
					</div>
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
                                            <th>순서</th>
                                            <th>코드</th>
                                            <th>완제품 코드</th>
                                            <th>원자재 코드</th>
                                            <th>소요량등록일</th>
                                            <th>소요량</th>
                                            <th>소요량수정일</th>
                                            <th>비고</th>
                                            <th>관리</th>

                                        </tr>
                                    </thead>
<!--                                     <tfoot> -->
<!--                                     "테이블 바닥글"을 나타냅니다. 이 부분은 테이블의 하단 요약 정보나 추가 설명 등을 담습니다. -->
<!--                                     <tfoot> 부분은 없어도 될 것 같은데 기존 템플릿에 있던 태그라 그냥 둔 겁니다! -->
<!--                                         <tr> -->
<!--                                             <th>순서</th> -->
<!--                                             <th>코드</th> -->
<!--                                             <th>완제품 코드</th> -->
<!--                                             <th>원자재 코드</th> -->
<!--                                             <th>등록일</th> -->
<!--                                             <th>소요량</th> -->
<!--                                             <th>수정일</th> -->
<!--                                             <th>비고</th> -->
<!--                                         </tr> -->
<!--                                     </tfoot> -->                                   
                                    <tbody>
<!--                                     순서값 1씩 증가 시키기 위한 rowNum -->
                                    <c:set var="rowNum" value="0" />
										<c:forEach var="requirementDTO" items="${requirementList}">
    										<c:set var="rowNum" value="${rowNum + 1}" />
                                       		 <tr>
<!--                                         	<th class="eachCheck"> -->
<!--             					 				<input type="checkbox" name="cbox" class="eachCheckbox"></th> -->
                                            <td>${rowNum}</td> <!-- 순서 -->
                                            <td>${requirementDTO.req_code}</td> <!--소요량 코드 -->
                                            <td>${requirementDTO.prod_code}</td> <!-- 완제품 코드 -->
                                            <td>${requirementDTO.raw_code }</td> <!-- 원자재 코드 -->
                                            <td>${requirementDTO.req_insertDATE}</td><!--  소요량 등록일-->
                                            <td>${requirementDTO.req_amount }</td><!-- 소요량 -->
                                            <td>${requirementDTO.req_upDATEDATE }</td><!-- 수정일 -->
                                            <td>${requirementDTO.req_note }</td><!-- 비고 -->
                                         <td><input type="button" value="수정"
												onclick="location.href='update.req_code=${requirementDTO.req_code}'">
												<input type="button" value="삭제"
												onclick="confirmDelete('${pageContext.request.contextPath}/factory/deleteRequirement?req_code=${requirementDTO.req_code}')">
											</td>
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
        <script src="../resources/js/warehouse_IM.js"></script>
        
     	
        <script>
//         삭제시 확인,취소 버튼 띄운 후
function confirmDelete(deleteUrl) {
    if (confirm("삭제하시겠습니까?")) {
        // 확인 버튼을 눌렀을 때만 삭제 요청을 보냄
        window.location.href = deleteUrl;
    } else {
        // 취소 버튼을 눌렀을 때의 처리 (생략 가능)
    }
}
</script>

    </body>
</html>
