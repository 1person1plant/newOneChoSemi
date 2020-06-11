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
		<!-- 사이드바 메뉴목록1 --> <!-- ${ sessionScope.loginUser.memberId} -->
		<ul class="list-group">
			<li class="list-group-item"><a href="<%=request.getContextPath()%>/views/myPage/grade.jsp">회원 등급</a></li>
			<li class="list-group-item"><a href="<%=request.getContextPath()%>/infor.me?memberId=<%=loginUser.getMemberNo()%>">개인 정보 수정</a></li>
			<li class="list-group-item"><a href="<%=request.getContextPath()%>/views/myPage/orderHistory.jsp">주문 내역 조회</a></li>
			<li class="list-group-item"><a href="<%=request.getContextPath()%>/myWishList.my?memberNo=<%=loginUser.getMemberNo()%>">위시리스트</a> </li>
			<li class="list-group-item"><a href="<%=request.getContextPath()%>/views/myPage/withdrawal.jsp">회원 탈퇴</a></li>
		</ul>
	</div>
</body>
</html>