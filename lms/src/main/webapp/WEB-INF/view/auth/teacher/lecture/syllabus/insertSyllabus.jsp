<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>		
		<title>syllabusOne</title>
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<!-- Bootstrap 4 Icons -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	
		<style>
			.table {
				text-align: center;
			}
			
			.table td {
				vertical-align: middle;
			}
			
			.table a {
				color: #000000;
			}
			
			th {
				text-align: center;
				background-color: #F9F9FB;
			}
		</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				$('#submitBtn').click(function(){
					let ck = true;
					$('.syllbusfile').each(function(index, item){
						console.log($(item).val());
						if($(item).val() == '') {
							ck = false;
						}
					})
					if(ck == false) { // if(ck)
						alert('선택하지 않은 파일이 있습니다');
					} else {
						$('#insertSyllabusForm').submit();
					}
				});
			});
		</script>
	</head>
	<body>
	<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
		
		<!-- 내비게이션 서브 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
	
		<!-- 상단 인터페이스 -->
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1>강의 계획서</h1>
				<P>강의 계획서입니다.</P>
			</div>
		</div>
		<!-- 본문 -->
		<div class="container">
			<form id="insertSyllabusForm" method="post" action="${pageContext.request.contextPath}/auth/teacher/lecture/{lectureNo}/syllabus/insertSyllabus" enctype="multipart/form-data" >
				<div><input type="hidden" value="${lectureNo}" name="lectureNo"></div>
				<div>
					<input type="file" name="syllabusFileList" class="syllabusFileList">
				</div>
				<div>
					<button type="button" id="submitBtn" style="float: right;" class ="btn btn-sm btn-primary">입력</button>
				</div>
			</form>
		</div>
	</body>
</html>