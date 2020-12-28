<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>noteDispatchList</title>
		
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
	</head>
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
	
		<!-- 상단 인터페이스 -->
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1>쪽지 발신함</h1>
				<p>쪽지를 보낸 목록입니다.</p>
			</div>
		</div>
		
		<!-- 본문 -->
		<div class="container">
			<h3>쪽지 발신함</h3>
				
			<br>
			
			<div class="btn-group">
				<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/note/noteReceiveList/1'">쪽지 수신함</button>
				<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/note/noteDispatchList/1'">쪽지 발신함</button>
			</div>
			<button type="button" class="btn btn-sm btn-success" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/note/insertNote'">작성</button>
			
			<br><br>
			
			<table class="table">
				<thead>
					<tr>
						<th width="20%">받는사람</th>
						<th width="50%">제목</th>
						<th width="10%">읽음여부</th>
						<th width="20%">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${noteDispatchList[0].noteNo != null}">
						<c:forEach var="n" items="${noteDispatchList}">
							<tr>
								<!-- &#40; : 왼쪽 괄호, &#41; : 오른쪽 괄호 -->
								<td>${n.noteReceiverName}&#40;${n.noteReceiverId}&#41;</td>
								<td><a href="${pageContext.request.contextPath}/auth/teacher/note/noteDispatchOne/${n.noteNo}">${n.noteTitle}</a></td>
								<td>${n.noteIsRead}</td>
								<td>${n.noteSendDate}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${noteDispatchList[0].noteNo == null}">
						<tr>
							<td colspan="4">(보낸 쪽지가 없습니다)</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			
			<br>
						
			<!-- 페이지 네비게이션 -->
			<ul class="pagination justify-content-center">
				<!-- 처음으로 버튼 -->
				<c:choose>
					<c:when test="${currentPage > 1}">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/note/noteDispatchList/1">
								<i class='fas fa-angle-double-left'></i>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="#">
								<i class='fas fa-angle-double-left'></i>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<!-- 이전 버튼 -->
				<c:choose>
					<c:when test="${currentPage > 1}">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/note/noteDispatchList/${prePage}">
								<i class='fas fa-angle-left'></i>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="#">
								<i class='fas fa-angle-left'></i>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<!-- 현재 페이지 표시 -->
				<c:forEach var="i" begin="${navFirstPage}" end="${navLastPage}">
					<c:if test="${i <= lastPage}">
						<c:choose>
							<%-- 현재 페이지 --%>
							<c:when test="${i == currentPage}">
								<li class="page-item active">
									<a class="page-link" href="#">${i}</a>
								</li>
							</c:when>
							<%-- 현재 페이지가 아닌 선택 가능한 페이지 --%>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/note/noteDispatchList/${i}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				
				<!-- 다음 버튼 -->
				<c:choose>
					<c:when test="${currentPage < lastPage}">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/note/noteDispatchList/${nextPage}">
								<i class='fas fa-angle-right'></i>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="#">
								<i class='fas fa-angle-right'></i>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<!-- 마지막으로 버튼 -->
				<c:choose>
					<c:when test="${currentPage < lastPage}">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/auth/teacher/note/noteDispatchList/${lastPage}">
								<i class='fas fa-angle-double-right'></i>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="#">
								<i class='fas fa-angle-double-right'></i>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
			
			<!-- 총 페이지 수 출력 -->
			<table style="margin: auto;">
				<tr>
					<td>
						<button type="button" class="btn btn-outline-dark btn-sm">
							${currentPage} / ${lastPage} 페이지
						</button>
					</td>
				</tr>
			</table>
			
			<!-- 검색 -->
			<form method="get" action="${pageContext.request.contextPath}/auth/teacher/note/noteDispatchList/1" class="form-inline">
				<input class="form-control" type="text" id="searchText" name="searchText">
				<button type="submit" class="btn btn-secondary">검색</button>
			</form>
		</div>
		
		<br><br>
	</body>
</html>