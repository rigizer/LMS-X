<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 상단 Navbar -->
<nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
	<div class="container-fluid">
		<ul class="navbar-nav mr-auto">
		    <!-- 강의 관리 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/manager/lecture/lectureList/1">강의 관리</a>
		    </li>
		    
		    <!-- 강의실 관리 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/manager/classroom/classroomList/1">강의실 관리</a>
		    </li>
		    
		    <!-- 교재 관리 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/manager/textbook/textbookList/1">교재 관리</a>
		    </li>
		    
		    <!-- 과목 관리 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/manager/subject/subjectList/1">과목 관리</a>
		    </li>
		    
		    <!-- 학생 정보 관리 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/manager/student/studentList/1">강사 정보 관리</a>
		    </li>
		    
		    <!-- 강사 정보  관리-->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/manager/teacher/teacherList/1">강사 정보 관리</a>
		    </li>
		    
		    <!-- 통계 페이지 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/manager/chart/chartList">통계</a>
		    </li>
		    
		    <!-- 질문 목록 페이지 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/manager/question/questionList/1">질문 게시판</a>
		    </li>
		    
		</ul>
		<!-- User -->
		<ul class="navbar-nav align-items-center d-none d-md-flex">
			<li class="nav-item dropdown">
				<a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<div class="media align-items-center">
						<span class="avatar avatar-sm rounded-circle"> 
							<c:if test="${!empty loginImage}">
								<img src="${pageContext.request.contextPath}/resource/mypageImage/${loginImage}">
							</c:if>
							<c:if test="${empty loginImage}">
								<img src="${pageContext.request.contextPath}/resource/mypageImage/default.png">
							</c:if>
						</span>
						<div class="media-body ml-2 d-none d-lg-block">
							<span class="mb-0 text-sm  font-weight-bold">
								${sessionScope.loginName}
							</span>
						</div>
					</div>
				</a>
				<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
					<div class=" dropdown-header noti-title">
						<h6 class="text-overflow m-0">환영합니다!</h6>
					</div>
					<a href="${pageContext.request.contextPath}/auth/manager/mypage/mypageOne" class="dropdown-item"> <i
						class="ni ni-single-02"></i> <span>마이페이지</span>
					</a>
					<div class="dropdown-divider"></div>
					<a href="${pageContext.request.contextPath}/auth/logout" class="dropdown-item"> <i class="ni ni-user-run"></i>
						<span>로그아웃</span>
					</a>
				</div>
			</li>
		</ul>
	</div>
</nav>