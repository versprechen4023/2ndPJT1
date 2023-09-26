<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="${pageContext.request.contextPath }/main/index">아이스마일</a>
            <!--Sidebar Toggle -->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!--Navbar Search -->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
<!--                 <div class="input-group"> -->
<!--                     <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" /> -->
<!--                     <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button> -->
<!--                 </div> -->
            </form>
            <!--Navbar -->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4"><!-- 나의정보수정  -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    	<c:if test="${emp_role.charAt(0).toString() eq '1' }">
                    		<li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/insert">사용자 추가관리</a></li>
                        	<li><hr class="dropdown-divider" /></li>
                    	</c:if>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/info">나의 정보수정</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/logout">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
     