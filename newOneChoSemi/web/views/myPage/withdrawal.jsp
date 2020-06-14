<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String memberPwd = (String)session.getAttribute("loginUser.getMemberPwd()");
	%>
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
td.deleteId{
	text-align:center;
	vertical-align:middle;
	font-size:30px !important;
	padding:0 !important;
}
label.deleteId{
	margin:0 !important;
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

/* The Modal (background) */
.modal {
	display: none;
	/* Hidden by default */
	position: fixed;
	/* Stay in place */
	z-index: 1030;
	/* Sit on top */
	padding-top: 2%;
	/* Location of the box */
	left: 0;
	top: 0;
	width: 100%;
	/* Full width */
	height: 100%;
	/* Full height */
	overflow: auto;
	/* Enable scroll if needed */
	background-color: rgb(0, 0, 0);
	/* Fallback color */
	background-color: rgba(0, 0, 0, 0.4);
	/* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 35% !important;
}

.wdchk {
	text-decoration: none;
	list-style: none;
}

ul ul {
	list-style-type: none !important;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

/* input 테두리 */
input:focus {
	outline: 2px solid #6AAED9;
}

label {
	margin: 0 !important;
	margin: 5px 0px;
	padding: 5px 10px;
	text-align: right;
}
/* input 테두리 */
        input:focus {
            outline: 2px solid #6AAED9;
        }
        input[type=password]{
        	padding: 5px 10px;
        	margin:5px 0;
        	display:inline-block;
        	border:1px solid #ccc;
        }
        /* 테이블 우측 input td */
        td {
            text-align: left;
            width: 35%;
        }
        .table td, .table th{
        	vertical-align:middle !important;
        }
        #password3{
        	min-width:140px !important;
        }
        label #password3{
        	padding-left:0px !important;
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
					<form id="withdrawalform" action="<%=request.getContextPath()%>/withdrawal.me">
						<table class="table">
							<thead>
								<tr>
									<br>
									<th colspan="3" scope="col"
										style='border-bottom: 2px solid black'>
										<input type="text" style="display:none;" name="memberNo" value="<%=loginUser.getMemberNo() %>">
										<h1><label name="withdrawalMemberName"><%=loginUser.getMemberName() %>님 회원탈퇴</label></h1>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr style="display:none;" >
									<td colspan="3" class="deleteId"><input type="text" class="deleteId" name="withdrawalMemberId" value="<%=loginUser.getMemberId() %>"></td>
								</tr>
								<tr style='border-bottom: 2px solid black'>
									<td scope="row" class="mt-2"><label>비밀번호 : </label></td>
									<td colspan="2"><input type='password' id='password1'
										name='password1'></td>
								</tr>
								<tr style='border-bottom: 2px solid black'>
									<td scope="row" class="mt-2" width="210px !important"><label>비밀번호 확인 : </label></td>
									<td colspan="1" style="padding-right:0px !important;"><input type='password' id='password2'
										name='password2'></td>
									<td colspan='1' style="padding-left:0px !important;"><label id='password3' style="text-align:left"></label></td>
								</tr>
								<tr>
									<td scope="row" colspan='3' class="mt-2">
										<input id='myBtn' data-toggle='modal' data-target='#intro'
											type='button' class='button1' value="탈퇴하기">&nbsp;&nbsp;
											<button type='button' class='button1' id="pageCancel">취소</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</fieldset>
			</div>

			 <!-- The Modal -->
			<div id="myModal" class="modal">

				<div class="modal-content">
					<div class='modal-header'>
						<h3>회원탈퇴</h3>
						<button type='button' class="close" data-dismiss='modal'
							aria-hidden="='true'">&times;</button>
					</div>
					<div class='modal-body'>
						<form action="<%=request.getContextPath()%>/reason.me" method="post" id="reasonForm">
							<ul>
								<li class='wdchk'>탈퇴사유(중복 체크 가능)
									<ul>
										<li style="display:none;"><input type="text" value="<%=loginUser.getMemberId()%>" name="memberId"></li>
										<li style="display:none;"><input type="text" value="<%=loginUser.getMemberName()%>" name="memberName"></li>
										<li class='wdchk'><input type='checkbox' id='chk1' name="reason" value="chk1"><label
											for='chk1'>&nbsp;상품 다양성/품질 불만</label></li>
										<li class='wdchk'><input type='checkbox' id='chk2' name="reason" value="chk2"><label
											for='chk2'>&nbsp;상품 정보 부족</label></li>
										<li class='wdchk'><input type='checkbox' id='chk3' name="reason" value="chk3"><label
											for='chk3'>&nbsp;이용빈도 낮음</label></li>
										<li class='wdchk'><input type='checkbox' id='chk4' name="reason" value="chk4"><label
											for='chk4'>&nbsp;개인정보 유출 우려</label></li>
										<li class='wdchk'><input type='checkbox' id='chk5' name="reason" value="chk5"><label
											for='chk5'>&nbsp;시스템 오류 빈번</label></li>
										<li class='wdchk'><input type='checkbox' id='chk6' name="reason" value="chk6"><label
											for='chk6'>&nbsp;아이디 변경</label></li>
										<li class='wdchk'><input type='checkbox' id='chk7' name="reason" value="chk7"><label
											for='chk7'>&nbsp;초식 동물 입양</label></li>
										<li class='wdchk'><input type='checkbox' id='chk8' name="reason" value="chk8"><label
											for='chk8'>&nbsp;배송지연</label></li>
									</ul>
								</li>
							</ul>
							<div class='modal-footer'>
								<input type='button' class='btn btn-default' data-dismiss='modal'
									value="탈퇴하기" onclick="altFunction(realt);">
								<div id='area2' class='area'></div>
		
								<a href='grade.html'><button type='button'
										class='btn btn-primary' id="modalCancel">취소</button></a>
							</div>
						</form>
					</div>
				</div>
				</div>
				</div>
			</div>
			<script>
				$(function(){
					$("#myBtn").click(function(){
						var inputPwd1 = document.getElementById("password1").value;
						var inputPwd2 = document.getElementById("password2").value;
						<%String chkPwd = loginUser.getMemberPwd();%>
						var Pwd = "<%=chkPwd%>";
						
						if(((inputPwd1=="")||(inputPwd1==null))||((inputPwd2=="")||(inputPwd2==null))){
							alert("비밀번호를 입력해 주세요.");
						}else if((inputPwd1 != Pwd)||(inputPwd2 !=Pwd)){
							alert("비밀번호가 일치하지 않습니다.");
						}else if((inputPwd2 == Pwd)&&(inputPwd1==inputPwd2)){
							var modal = document.getElementById("myModal");
							var btn = document.getElementById("myBtn");
							var span = document.getElementsByClassName("close")[0];

							btn.onclick = function() {
								modal.style.display = "block";
							}
							span.onclick = function() {
								modal.style.display = "none";
							}
							window.onclick = function(event) {
								if (event.target == modal) {
									modal.style.display = "none";
								}
							}
						}
					})
					$("#pageCancel").click(function(){
						location.href="<%=request.getContextPath()%>/grade.me?memberNo=<%=loginUser.getMemberNo()%>";
					})
				})
				
				
			</script>
			<script>
				function altFunction(otherFunction) {
					for (var i = 5; i > 0; i--) {
						var result = true;
						result = otherFunction(i);
						if (result == false) {
							break;
						}
					}
					if (result == true) {
						alert("ㅂㅂ");
						$("#withdrawalform").submit();
						$("#reasonForm").submit();
					} else {
						alert('남아 주셔서 감사합니다.');
						location.href="<%=request.getContextPath()%>/grade.jsp";
					}
				}
				function realt(i) {
					var result = true;
					if (i > 4) {
						result = confirm('탈퇴하지 마세요.');
					} else if (i > 3) {
						result = confirm('하지 마세요.');
					} else if (i > 1) {
						result = confirm('하지 말라고 했다.');
					} else {
						result = confirm('마지막 기회입니다.');
					}
					return result;
				}
			</script>

			<!-- <script>
				// Get the modal
				var modal = document.getElementById("myModal");

				// Get the button that opens the modal
				var btn = document.getElementById("myBtn");

				// Get the <span> element that closes the modal
				var span = document.getElementsByClassName("close")[0];

				// When the user clicks the button, open the modal 
				btn.onclick = function() {
					modal.style.display = "block";
				}

				// When the user clicks on <span> (x), close the modal
				span.onclick = function() {
					modal.style.display = "none";
				}

				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
					if (event.target == modal) {
						modal.style.display = "none";
					}
				}
			</script> -->

			<script>
				$(function() {
					$('#password2').change(
							function() {
								if ($('#password1').val() != $(this).val()) {
									$('#password3').text('비밀번호 불일치').css(
											'color', 'red');
								} else {
									$('#password3').text('비밀번호 일치').css(
											'color', 'green');
								}
							});
					$('#password1').change(
							function() {
								if ($('#password2').val() != $(this).val()
										&& $('#password2').val().length > 0) {
									$('#password3').text('비밀번호 불일치').css(
											'color', 'red');
								} else if ($('#password2').val() == $(this)
										.val()) {
									$('#password3').text('비밀번호 일치').css(
											'color', 'green');
								}
							});
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