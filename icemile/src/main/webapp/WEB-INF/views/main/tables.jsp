<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <h1 class="mt-4">사원정보조회</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
<!--                                 DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the -->
<!--                                 <a target="_blank" href="https://datatables.net/">official DataTables documentation</a> -->
<!--                                 . -->
								<div class="input-group">
                                   <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                                   <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                                </div>
                                <button>사원 등록 </button>
                            </div>
                        </div>
                        <div class="card mb-4">
<!--                             <div class="card-header"> -->
<!--                                 <i class="fas fa-table me-1"></i> -->
<!--                                 DataTable Example -->
<!--                             </div> -->
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>직급</th>
                                            <th>내선번호</th>
                                            <th>부서</th>
                                            <th>이메일</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>이름</th>
                                            <th>직급</th>
                                            <th>내선번호</th>
                                            <th>부서</th>
                                            <th>이메일</th>
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>사원</td>
                                            <td>405</td>
                                            <td>생산</td>
                                            <td>hong@icemile.com</td>
                                            <td><button>수정</button>
                                            	<button>퇴사ㄴ</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
				<!-- 내용들어가는곳 -->	                    
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
