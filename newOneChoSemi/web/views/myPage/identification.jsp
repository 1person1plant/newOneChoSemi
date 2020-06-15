<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<title>Cho-당신을 위한 반려식물</title>
	<!--타이틀 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/images/logo.png">
	<!-- 아이콘 -->
	<script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>
	<!-- 제이쿼리 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<!-- popper 툴팁 -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<!-- 부트스트랩 스크립트(jQuery보다 아래 있어야함) -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
	<style>
		/* font start */
		@font-face {
			font-family: 'basicFont';
			src:
				url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
				format('woff');
			font-weight: normal;
			font-style: normal;
		}
		
		* {
			font-family: "basicFont";
		}
		/* font end */
	</style>
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
				<%@include file="myPageCategory.jsp"%>
				
			</div>
			<!-- 9단길이의 첫번째 열 -->
			<div class='col-md-9'>
				<fieldset>
					<form id="identification" action="<%=request.getContextPath()%>/identy.me" method="post">
						<input style="display:none;" type="text" value="<%=loginUser.getMemberId()%>" id="memberId" name="memberId">
						<input style="display:none;" type="text" value="<%=loginUser.getMemberNo()%>" id="memberNo" name="memberNo">
						<table class="table">
							<thead>
								<tr>
									<br>
									<th colspan="3" scope="col" style='border-bottom: 2px solid black'><h1>본인 확인</h1></th>
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
									<td scope="row" colspan='3' class="mt-2"><input type='button' id='idenBtn' class='button1' name="idenBtn" value="확인">&nbsp;&nbsp; 
										<button type='button' id="cancelBtn" class='button1'>취소</button>
									</td>
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
					location.href="<%=request.getContextPath()%>/grade.me?memberNo=<%=loginUser.getMemberNo()%>";
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
				$(this).css({"padding":"8px 18px","border-radius":"8px","color":"black","border":"1px solid #11538C","background-color":"white", "width":"105px", "height":"42px"});
			});
		});
	</script>


	<%@ include file="../common/footer.jsp"%>
</body>
</html>