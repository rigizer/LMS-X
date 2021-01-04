<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Question Comment</title>
	<!-- Favicon -->
	<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
	<!-- Fonts -->
	<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<!-- Icons -->
	<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
	<link
	href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />
	<!-- CSS Files -->
	<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				// 댓글 수정 버튼
				$('#updateBtn').click(function(){
					if($('#qnaCommentContent').val().length < 1){
						alert('내용을 입력해 주세요.');
						return;
					}
					$('#updateCommentForm').submit();
				});
			});
		</script>
</head>
<body>

	<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>	
	</nav>   		
	<div class="main-content">
		<!-- 상단 Navbar -->
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/student/include/topMenu.jsp" />
    	</div>
		<!-- 강좌 Navbar -->
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
    	</div>
	    
    	<!-- 접속자 -->
		<jsp:include page="/WEB-INF/view/auth/student/include/connector.jsp" />
		<h1>댓글 수정</h1>
		<form method="post" id="updateCommentForm" action="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaOne/${questionNo}/updateStduentQuestionComment/${questionPassword}">
		<input type="hidden" name="questionNo" value="${questionComment.questionNo}"> 
			<table class="table">
				<tr>
					<td width="10%">번호</td>
					<td width="40%"><input type="text" name="questionCommentNo" value="${questionComment.questionCommentNo}" readonly="readonly"  class="form-control"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="questionCommentWriter" value="${questionComment.questionCommentWriter}" readonly="readonly" class="form-control"></td>
				</tr>
				<tr>
					<td>댓글 내용</td>
					<td><textarea rows="22px" style="width:100%;" name="questionCommentContent" id="qnaCommentContent">${questionComment.questionCommentContent}</textarea></td>
				</tr>
			</table>
			 <div style="text-align: right;"><button type="button" id="updateBtn" class="btn btn-outline-primary">댓글입력</button></div>
		</form>
		<!-- Footer -->
		<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>