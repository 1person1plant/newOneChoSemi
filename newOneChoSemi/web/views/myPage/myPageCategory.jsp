<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>Cho-당신을 위한 반려식물</title>

<style>
/* 좌측 메뉴 리스트 */
.list-group a :hover {
	background: #6AAED9;
	color: white;
	text-decoration: none;
}

.list-group a {
	text-decoration: none;
}

.list-group :hover {
	background: #6AAED9;
	color: white;
	transition: 0.3s;
	text-decoration: none;
}

.list-group-item :hover {
	color: white;
	text-decoration: none;
}

.list-group-item a:hover {
	color: white;
}

ul .list-group-item :hover {
	color: white;
}
/* 좌측 메뉴 리스트 끝 */
</style>
</head>
<body>

	
			<div class="panel panel-info">
					<div class="panel-heading">
						<!-- 패널 타이틀1 -->
						<h3 class="panel-title">
							<span>마이 페이지</span>
						</h3>
					</div>
					<!-- 사이드바 메뉴목록1 -->
					<ul class="list-group">
						<a href="<%=request.getContextPath()%>/grade.me?memberNo=<%=loginUser.getMemberNo() %>" class="sideCategory" id="gradeA">
							<li class="list-group-item" class="gradeL">회원 등급</li>
						</a>
						<a href="<%=request.getContextPath()%>/infor.me?memberId=<%=loginUser.getMemberId()%>" class="sideCategory" id="infA">
							<li class="list-group-item">개인 정보 수정</li>
						</a>
						<a href="<%=request.getContextPath()%>/ohlist.bo?memberNo=<%=loginUser.getMemberNo()%>" class="sideCategory" id="orderA">
							<li class="list-group-item">주문 내역 조회</li>
						</a>
						<a style="display: none;" href="<%=request.getContextPath()%>/ohcancel.oh?memberNo=<%=loginUser.getMemberNo() %>" class="sideCategory" id="orderA">
							<li class="list-group-item">주문 취소 내역</li>
						</a>
						<a href="<%=request.getContextPath() %>//myWishList.my?memberNo=<%=loginUser.getMemberNo()%>" class="sideCategory" id="wishA">
							<li class="list-group-item">위시리스트</li>
						</a>
						<a href="<%=request.getContextPath()%>/views/myPage/withdrawal.jsp" class="sideCategory" id="withA">
							<li class="list-group-item">회원 탈퇴</li>
						</a>
					</ul>
				</div>
				
				<script>
					function myPageBtn(){
						location.href="<%=request.getContextPath()%>/grade.me?memberNo=<%=loginUser.getMemberNo()%>"
					}
				</script>
		

</body>
</html>