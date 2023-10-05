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
    
<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
*{
    font-family: 'Pretendard-Regular';
}
</style>

     <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">아이스마일</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
<!--                 <div class="input-group"> -->
<!--                     <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" /> -->
<!--                     <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button> -->
<!--                 </div> -->
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4"><!-- 우상단 회원 로그인정보 -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">나의 정보수정</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="${pageContext.request.contextPath}/main/index">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                메인
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
<!--                           
                            <!-- 사원정보 -->
                              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTest0" aria-expanded="false" aria-controls="#collapseTest">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                사원정보
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                             <div class="collapse" id="collapseTest0" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="${pageContext.request.contextPath}/main/tables">사원정보조회</a>
                                        </nav>
                                </nav>                          
                            </div>
                            <!-- 추가 -->                            
                            <!-- 기준정보 -->
                              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTest1" aria-expanded="false" aria-controls="#collapseTest">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                기준정보
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseTest1" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">물품관리</a>
                                            <a class="nav-link" href="register.html">소요랑관리</a>
                                            <a class="nav-link" href="password.html">창고관리</a>
                                        </nav>
                                </nav>                          
                            </div>
                            <!-- 추가 -->
                            <!-- 원자재 -->
                              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTest2" aria-expanded="false" aria-controls="#collapseTest">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                원자재
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseTest2" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">원자재재고</a>
                                            <a class="nav-link" href="register.html">발주</a>
                                            <a class="nav-link" href="password.html">입고</a>
                                            <a class="nav-link" href="password.html">거래처관리</a>
                                        </nav>
                                </nav>                          
                            </div>
                            <!-- 원자재 -->
                            <!-- 생산 -->
                              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTest3" aria-expanded="false" aria-controls="#collapseTest">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                생산
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseTest3" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">작업지시</a>
                                            <a class="nav-link" href="register.html">생산실적</a>
                                            <a class="nav-link" href="password.html">설비관리</a>
                                        </nav>
                                </nav>                          
                            </div>
                            <!-- 생산 -->      
                            <!-- 영업 -->
                              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTest4" aria-expanded="false" aria-controls="#collapseTest">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                영업
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseTest4" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">완제품재고</a>
                                            <a class="nav-link" href="register.html">수주</a>
                                            <a class="nav-link" href="password.html">출하</a>
                                            <a class="nav-link" href="password.html">지점관리</a>
                                        </nav>
                                </nav>                          
                            </div>
                            <!-- 영업 -->    
                                                                                                    
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        로그인정보
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
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
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
