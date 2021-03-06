<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>lectureList</title>
		<!-- Favicon -->
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		<!-- Fonts -->
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
			rel="stylesheet">
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
			rel="stylesheet" />
		<!-- CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<style>
			.table {
				text-align: center;
			}
			
			.table td {
				vertical-align: middle;
			}
			
			th {
				text-align: center;
			}
		</style>
		
		<script>
			$(document).ready(function(){
				$('.classRegistrationBtn').on('click', function(){
					let paramSplit = $(this).val().split('-');
					let paramLectureNo = paramSplit[0];	// 강좌 no
					let paramStudentTotal = paramSplit[1];	// 강좌 신청 인원
					let paramLectureTotal = paramSplit[2];	// 강좌 최대 인원
					// 이미 수강 신청한 강좌인지, 정원초과된 강좌인지
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/student/lecture/checkClassRegistration',
						type: 'post',
						data: {lectureNo:paramLectureNo},
						success: function(data){
							if(data == false){
								$('#parentModal').html(`
									<div>
										<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="infoModalLabel">정보</h5>
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">이미 수강신청한 강좌입니다.</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								`);
								$("#infoModal").modal("show");
								return;
							} else if(paramStudentTotal == paramLectureTotal){
								$('#parentModal').html(`
									<div>
										<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="infoModalLabel">정보</h5>
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">정원이 초과된 강좌입니다.</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								`);
								$("#infoModal").modal("show");
								return;
							} else{
								$('#classRegistrationForm' + paramLectureNo).submit();
								return;
							}
						}
					})
					
				});
			})
		</script>
	</head>
	<body class="">
		<!-- 메인 Navbar -->
		
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
	    	
			
	    	<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/student/include/connector.jsp" />
   			<div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="mb-0">전체 강좌 목록</h3>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-12">
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th>강사</th>
										<th>과목 이름</th>
										<th>강좌 이름</th>
										<th>강좌 총일수</th>
										<th>강좌 시작일</th>
										<th>강좌 종료일</th>
										<th>강좌 정원</th>
										<th>수강 신청</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${!empty lectureList}">
										<c:forEach items="${lectureList}" var="l">
											<tr>
												<td>${l.teacherName}</td>
												<td>${l.subject.subjectName}</td>
												<td>${l.lectureName}</td>
												<td>${l.subject.subjectTotalday}일</td>
												<td>${l.lectureStartdate}</td>
												<td>${l.lectureEnddate}</td>
												<td>${l.studentTotal}/${l.lectureTotal}명</td>
												<td>
													<form id="classRegistrationForm${l.lectureNo}" action="${pageContext.request.contextPath}/auth/student/lecture/registrationClass" method="post">
														<input type="hidden" name="lectureNo" value="${l.lectureNo}">
														<button type="button" class="classRegistrationBtn btn btn-sm btn-primary" value="${l.lectureNo}-${l.studentTotal}-${l.lectureTotal}">수강 신청</button>
														<div id="parentModal"></div>
													</form>
												</td>
											</tr>	
										</c:forEach>
									</c:if>
									<c:if test="${empty lectureList}">
										<tr>
											<td colspan="8">(수강중인 강좌가 없습니다)</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>

					<div class="card-footer py-4">						
						<!-- 페이지 네비게이션 -->
						<ul class="pagination justify-content-center">
							<!-- 처음으로 버튼 -->
							<c:choose>
								<c:when test="${currentPage > 1}">
									<li class="page-item">
										<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/lectureList/1">
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
										<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/lectureList/${prePage}">
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
												<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/lectureList/${i}">${i}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
							
							<!-- 다음 버튼 -->
							<c:choose>
								<c:when test="${currentPage < lastPage}">
									<li class="page-item">
										<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/lectureList/${nextPage}">
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
										<a class="page-link" href="${pageContext.request.contextPath}/auth/student/lecture/lectureList/${lastPage}">
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
									<button type="button" class="btn btn-outline-primary btn-sm">
										${currentPage} / ${lastPage} 페이지
									</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				<!-- Footer -->
				<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
			</div>		
		</div>
		<!--   Core   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<!--   Optional JS   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
		<!--   Argon JS   -->
		<script src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
		<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
		<script>
		    window.TrackJS &&
		      TrackJS.install({
		        token: "ee6fab19c5a04ac1a32a645abde4613a",
		        application: "argon-dashboard-free"
		    });
  		</script>
  	</body>
</html>