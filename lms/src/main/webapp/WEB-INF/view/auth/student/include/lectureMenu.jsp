<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<a href="${pageContext.request.contextPath}/auth/student/lecture/classOne/${lectureNo}">강좌 홈</a>
	
	<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/report/reportList/1">과제</a>
	
	<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/notice/noticeList/1">강의 공지사항</a>
</div>
