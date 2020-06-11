<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	padding-top: 2%;
}

fieldset {
	height: auto;
	margin: 5px;
	margin-bottom: 50px;
	background: white;
	padding-left: 50px;
	padding-right: 50px;
	text-align: center;
}

/* 테이블 좌측 라벨 td */
td.mt-2 {
	padding: 12px;
	text-align: right;
	min-width: 33%;
}

/* 테이블 우측 input td */
td {
	text-align: left;
	width: 33%;
}

/* 버튼 CSS */
.button1 {
	padding: 8px 18px;
	margin: 5px;
	border-radius: 8px;
	color: black;
	border: 1px solid #115D8C;
	background-color: white;
	width: 105px;
	height: 42px;
}

.button1 :hover {
	border-radius: 8px !important;
	background: #6AAED9 !important;
	color: white !important;
	transition: 0.2s !important;
}

.button1 :active {
	border-radius: 8px !important;
	background: #012340 !important;
}

/* input 테두리 */
input:focus {
	outline: 2px solid #6AAED9;
}

label {
	margin-bottom: 0 !important;
	margin: 2% !important;
	padding: 5px 10px;
	text-align: right;
}
/* input 테두리 */
input:focus {
	outline: 2px solid #6AAED9;
}

input[type=password] {
	padding: 5px 10px;
	margin: 5px 0;
	display: inline-block;
	border: 1px solid #ccc;
}
/* 테이블 우측 input td */
td {
	text-align: left;
	width: 45%;
	padding-left: 0 !important;
}

.table td, .table th {
	vertical-align: middle !important;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<!-- 패널 타이틀1 -->
						<h3 class="panel-title">
							<span>마이 페이지</span>
						</h3>
					</div>
					<!-- 사이드바 메뉴목록1 -->
					<ul class="list-group">
						<a href="<%=request.getContextPath()%>/views/myPage/grade.jsp">
							<li class="list-group-item">회원 등급</li>
						</a>
						<a href="<%=request.getContextPath()%>/infor.me?memberId=<%=loginUser.getMemberId()%>">
							<li class="list-group-item">개인 정보 수정</li>
						</a>
						<%-- <a href="<%=request.getContextPath();%>/list.bo"> --%>
						<a href="<%=request.getContextPath()%>/views/myPage/orderHistory.jsp">
							<li class="list-group-item">주문 내역 조회</li>
						</a>
						<a href="<%=request.getContextPath() %>/wish.me?memberNo=<%=loginUser.getMemberNo()%>">
							<li class="list-group-item">위시리스트</li>
						</a>
						<a href="<%=request.getContextPath()%>/views/myPage/withdrawal.jsp">
							<li class="list-group-item">회원 탈퇴</li>
						</a>
					</ul>
				</div>
			</div>
			<%@include file="myPageCategory.jsp"%>
			<!-- 9단길이의 첫번째 열 -->
			<div class='col-md-9'>
				<fieldset>
					<form id="identification" action="<%=request.getContextPath()%>/identy.me" method="post">
						<input style="display:none;" type="text" value="<%=loginUser.getMemberId()%>" id="memberId" name="memberId">
						<table class="table">
							<thead>
								<tr>
									<br>
									<th colspan="3" scope="col"
										style='border-bottom: 2px solid black'><h1>본인 확인</h1></th>
								</tr>
							</thead>
							<tbody>
								<tr style='border-bottom: 2px solid black'>
									<td scope="row" class="mt-2"><label>아이디 : </label></td>
									<td colspan="2" id='orid'><%=loginUser.getMemberId()%></td>
								</tr>
								<tr style='border-bottom: 2px solid black'>
									<td scope="row" class="mt-2"><label>비밀번호 : </label></td>
									<td colspan="2"><input type='password' id='password1'
										name='password1'></td>
								</tr>
								<tr>
									<td scope="row" colspan='3' class="mt-2"><input type='submit' id='idenBtn'
												class='button1' name="idenBtn" value="확인">&nbsp;&nbsp; 
												<button type='button' id="cancelBtn" class='button1'>취소</button></td>
								</tr>

							</tbody>
						</table>
					</form>
				</fieldset>

			</div>
			</div>
			</div>
			<script>
				$(function(){
					$("#idenBtn").click(function(){
						var inputPwd1 = document.getElementById("password1").value;
						<%String chkPwd = loginUser.getMemberPwd();%>
						var Pwd = "<%=chkPwd%>";
						
						if((inputPwd1==Pwd)){
							location.href="<%=request.getContextPath()%>/views/myPage/grade.jsp";
						}else if((inputPwd1=="")||(inputPwd1==null)){
							alert("비밀번호를 입력해 주세요.");
						}else if(inputPwd1 != Pwd){
							alert("비밀번호가 일치하지 않습니다.");
						}
					});
					$("#cancelBtn").click(function(){
						location.href="<%=request.getContextPath()%>/index.jsp";
					})
				});
				
			</script>
				
			<script>
            	$(function(){
            		$(".button1").mouseenter(function(){
            			$(this).css({"background":"#6AAED9","color":"white","transition":"0.2s","border-radius":"8px"});
            		}).mouseout(function(){
            			$(this).css({"padding":"8px 18px","border-radius":"8px","color":"black","border":"1px solid #11538C","background-color":"white",
            			"width":"105px", "height":"42px"});
            		});
            	});
            </script>


			<%@ include file="../common/footer.jsp"%>
</body>
</html>