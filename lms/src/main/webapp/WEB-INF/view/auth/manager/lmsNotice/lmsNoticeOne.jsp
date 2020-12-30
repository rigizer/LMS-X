<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lmsNoticeOne</title>
<!-- Favicon -->
<link
	href="${pageContext.request.contextPath}/assets/img/brand/favicon.png"
	rel="icon" type="image/png">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">

<!-- Icons -->
<link
	href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />

<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2"
	rel="stylesheet" />

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap 4 Icons -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- textArea자동조절 라이브러리 -->
<script
	src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
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
}
</style>
<script>
	$(document).ready(function() {
		//textarea 크기 자동 조정
		autosize($("textArea"));
	});
</script>
</head>
<body>
	<!-- 내비게이션 메인 메뉴 -->
	<jsp:include page="/WEB-INF/view/auth/manager/include/menu.jsp" />
	<div class="main-content">
		<!-- 내비게이션 상단 메뉴 -->
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/manager/include/topMenu.jsp" />
		</div>

		<!-- 접속자 -->
		<jsp:include page="/WEB-INF/view/auth/manager/include/connector.jsp" />

		<!-- Page content -->
		<div class="container-fluid mt--7">
			<!-- Table -->
			<div class="row">
				<div class="col">
					<div class="card shadow">
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<br>
								<div class="col-8">
									<h3 class="mb-0">공지사항 상세보기</h3>
								</div>
								<div class="col-4 text-right">
									<button type="button" class="btn btn-sm btn-dark"
										onclick="location.href='${pageContext.request.contextPath}/auth/manager/lmsNotice/lmsNoticeList/1'">목록</button>
									<c:if test="${lmsNotice.accountId == sessionScope.loginId}">
										<button type="button" class="btn btn-sm btn-primary"
											onclick="location.href='${pageContext.request.contextPath}/auth/manager/lmsNotice/updateLmsNoticeOne/${lmsNotice.lmsNoticeNo}'">수정</button>
									</c:if>
									<button type="button" class="btn btn-sm btn-danger"
										onclick="location.href='${pageContext.request.contextPath}/auth/manager/lmsNotice/deleteLmsNoticeOne/${lmsNotice.lmsNoticeNo}'">삭제</button>
								</div>
								<br>
							</div>
						</div>

						<div class="table-responsive">
							<table class="table align-items-center table-flush">
								<tr>
									<td>제목</td>
									<td>${lmsNotice.lmsNoticeTitle}</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td>${lmsNotice.lmsNoticeWriter}</td>
								</tr>
								<tr>
									<td>조회수</td>
									<td>${lmsNotice.lmsNoticeCount}</td>
								</tr>
								<tr>
									<td>작성일</td>
									<td>${lmsNotice.lmsNoticeCreatedate}</td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea rows="20px" cols="100px" readonly="readonly"
											disabled>${lmsNotice.lmsNoticeContent}</textarea></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
		</div>
	</div>
	<!--   Core   -->
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
	<!--   Argon JS   -->
	<script
		src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
</body>
</html>