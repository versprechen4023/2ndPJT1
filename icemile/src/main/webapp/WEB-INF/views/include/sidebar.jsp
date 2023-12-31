<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

            <div id="layoutSidenav_nav">
                   <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
<!--                             <div class="sb-sidenav-menu-heading"> -->
<!--                             <img src="../resources/assets/img/icemilep.png" width="190" height="175" style="margin-bottom: 5px;"> -->
<!--                             </div> -->
                            <a class="nav-link" href="${pageContext.request.contextPath}/main/index">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-house"></i></div>
                                메인
                            </a>                  
                            <!-- 사원정보 -->
                              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTest0" aria-expanded="false" aria-controls="#collapseTest">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-address-card"></i></div>
                                사원정보
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                             <div class="collapse" id="collapseTest0" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="${pageContext.request.contextPath}/pageTest/emp">사원정보조회</a>
                                        </nav>
                                </nav>                          
                            </div>
                            <!-- 추가 -->                            
                            <!-- 기준정보 -->
                              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTest1" aria-expanded="false" aria-controls="#collapseTest">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-diagram-project"></i></div>
                                기준정보
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseTest1" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="${pageContext.request.contextPath}/pageTest/stock">품목관리</a>
                                            <a class="nav-link" href="${pageContext.request.contextPath}/factory/requirement">소요랑관리</a>
                                            <a class="nav-link" href="${pageContext.request.contextPath}/warehouse/warehouse">창고관리</a>
                                        </nav>
                                </nav>                          
                            </div>
                            <!-- 추가 -->
                            <!-- 원자재 -->
                              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTest2" aria-expanded="false" aria-controls="#collapseTest">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-prescription-bottle" style="margin-left: 3px; margin-right: 2px;"></i></div>
                                원자재
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseTest2" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="${pageContext.request.contextPath}/warehouse/rawStock">원자재 재고</a>
                                            <a class="nav-link" href="${pageContext.request.contextPath}/buyOrder/rawOrderList">발주</a>
                                            <a class="nav-link" href="${pageContext.request.contextPath}/shipping/inMaterial">입고</a>
                                            <a class="nav-link" href="${pageContext.request.contextPath}/pageTest/buy">거래처관리</a>
                                        </nav>
                                </nav>                          
                            </div>
                            <!-- 원자재 -->
                            <!-- 생산 -->
                              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTest3" aria-expanded="false" aria-controls="#collapseTest">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-city"></i></div>
                                생산
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseTest3" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                    		<a class="nav-link" href="${pageContext.request.contextPath}/warehouse/productStock">완제품 재고</a>
                                            <a class="nav-link" href="${pageContext.request.contextPath}/factory/workOrderList">작업지시</a>
                                            <a class="nav-link" href="${pageContext.request.contextPath}/head/resultList">생산실적</a>
                                            <a class="nav-link" href="${pageContext.request.contextPath}/factory/facility">설비관리</a>
                                        </nav>
                                </nav>                          
                            </div>
                            <!-- 생산 -->      
                            <!-- 영업 -->
                              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTest4" aria-expanded="false" aria-controls="#collapseTest">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-business-time"></i></div>
                                영업
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseTest4" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="${pageContext.request.contextPath}/sell/proOrderList">수주</a>
                                            <a class="nav-link" href="${pageContext.request.contextPath}/shipping/outMaterial">출고</a>
                                            <a class="nav-link" href="${pageContext.request.contextPath}/sell/branchList">지점관리</a>
                                        </nav>
                                </nav>                          
                            </div>
                            <!-- 영업 -->    
                                                                                                    
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                         ${sessionScope.emp_num}
                    </div>
                </nav>
            </div>
 