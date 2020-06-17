<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* String memberId = member.getmemberId();
String memberPwd = member.getMemberPwd();
String memberName = member.getMemberName();
String memberPhone1 = member.getMemberPhone1();
String memberPhone2 = member.getMemberPhone1();
String memberPhone3 = member.getMemberPhone1();
String memberEmail1 = member.getMemberEmail1();
String memberEmail2 = member.getMemberEmail2();
String memberPostcode = member.getMemberPostcode();
String memberAddress1 = member.getMemberAddress1();
String memberAddress2 = member.getMemberAddress2();
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>Cho-당신을 위한 반려식물</title>
<!--타이틀 아이콘-->
<link rel="shortcut icon" type="image⁄x-icon"
	href="<%=request.getContextPath()%>/images/logo.png">
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/4b6b63d8f6.js"
	crossorigin="anonymous"></script>
<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<!-- popper 툴팁 -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<!-- 부트스트랩 스크립트(jQuery보다 아래 있어야함) -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

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
	padding-right: 0 !important;
}

/* 테이블 우측 input td */
td {
	text-align: left;
	width: 40%;
}

.table td, .table th {
	vertical-align: middle !important;
}
/* 핸드폰 번호 2,3번 input */
#phone1, #phone2, #phone3 {
	width: 70px !important;
}
/* select박스(핸드폰,이메일) */
select {
	height: 36px;
}

/* input 테두리 */
input:focus {
	outline: 2px solid #6AAED9;
}

input[type=text], input[type=password] {
	padding: 5px 10px;
	margin: 5px 0;
	display: inline-block;
	border: 1px solid #ccc;
}
/* 주소 */
#sample3_address {
	width: 85% !important;
}
/* 상세주소 */
#sample3_detailAddress {
	width: 60% !important;
}

/* 버튼 CSS */
.button1 {
	padding: 8px 18px;
	border-radius: 8px;
	color: black;
	border: 1px solid #115D8C;
	background-color: white;
	width: 105px;
	height: 42px;
}

.button1 :hover {
	border-radius: 8px;
	background: #6AAED9;
	color: white;
	transition: 0.2s;
}

.button1 :active {
	border-radius: 8px;
	background: #012340;
}

#addBtn {
	width: auto;
}

label {
	margin-bottom: none !important;
	margin: 5px 0px;
	padding: 5px 10px;
	text-align: right;
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
					<form id="updateForm"
						action="<%=request.getContextPath()%>/update.inf" method="post">
						<table class="table information1">
							<thead>
								<tr>
									<th colspan="3" scope="col">
										<h1>개인 정보 수정</h1>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td scope="row" class="mt-2"><label>아이디 : </label></td>
									<td colspan="2"><input style="display: none;" type='text' id='memberId' name="memberId" class="inputBtn" value="<%=loginUser.getMemberId()%>" readonly="readonly"><label><%=loginUser.getMemberId() %></label></td>
								</tr>
								<tr>
									<td scope="row" class="mt-2"><label>비밀번호 : </label></td>
									<td colspan="2"><input type='password' id='password1' name='memberPwd' class="inputBtn" value="<%=loginUser.getMemberPwd()%>"></td>
								</tr>
								<tr>
									<td scope="row" class="mt-2"><label>비밀번호 확인 : </label></td>
									<td colspan="1" style="width: 250px !important">
										<input type='password' id='password2' name='memberPwd2' class="inputBtn" value="<%=loginUser.getMemberPwd()%>">
									</td>
									<td colspan='1' style="padding-left: 0 !important">
										<label id='password3' style="padding-left: 0 !important"></label>
									</td>
								</tr>
								<tr>
									<td scope="row" class="mt-2"><label>이름 : </label></td>
									<td colspan="2">
										<input style="display: none;" type='text' id='memberName' name='memberName' class="inputBtn" value="<%=loginUser.getMemberName()%>" readonly="readonly">
										<label><%=loginUser.getMemberName() %></label>
									</td>
								</tr>
								<tr>
									<td scope="row" class="mt-2"><label>휴대폰 번호 : </label></td>

									<td colspan="2">
										<select id='phone1' class="phone" name='memberPhone1'>
											<option value='010'>010</option>
											<option value='011'>011</option>
											<option value='016'>016</option>
											<option value='017'>017</option>
											<option value='018'>018</option>
											<option value='019'>019</option>
										</select> - 
										<input type='text' id='phone2' class="inputBtn" name='memberPhone2' maxlength='4' onKeyPress='return checkNum(event)' value="<%=loginUser.getMemberPhone2()%>"> - 
										<input type='text' id='phone3' name='memberPhone3' class="inputBtn" maxlength='4' onKeyPress='return checkNum(event)' value="<%=loginUser.getMemberPhone3()%>">
									</td>
								</tr>
								<tr>
									<td scope="row" class="mt-2"><label>이메일 : </label></td>
									<td colspan="2"><input type='text' id='email1'
										name='memberEmail1' class="inputBtn"
										value="<%=loginUser.getMemberEmail1()%>"> @ <select
										id='email2' name='memberEmail2'>
											<option value="@naver.com">naver.com</option>
											<option value="@gmail.com">gmail.com</option>
											<option value="@hanmail.net">hanmail.net</option>

									</select></td>
								</tr>

								<tr>
									<td scope="row" class="mt-2"><label>우편번호 : </label></td>
									<td colspan="2"><input type='text' id='sample3_postcode'
										name='memberPostcode' class="inputBtn"
										value="<%=loginUser.getMemberPostcode()%>">
										&nbsp;&nbsp;
										<button type="button" onclick="sample3_execDaumPostcode();"
											value="우편번호 검색" class='button1' id='addBtn'>우편번호 검색</button>
									</td>
								</tr>
								<tr id="apiId" style="display: none;">
									<td colspan="3" text-align="center">
										<div id="wrap" class="mx-auto"
											style="display: none; border: 1px solid; width: 80%; height: 300px; margin: 5px 0; position: relative">
											<img
												src="//t1.daumcdn.net/postcode/resource/images/close.png"
												id="btnFoldWrap"
												style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
												onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>
									</td>
								</tr>
								<tr>
									<td scope="row" class="mt-2"><label>주소 : </label></td>
									<td colspan="2"><input type='text' id='sample3_address'
										name='memberAddress1' class="inputBtn"
										value="<%=loginUser.getMemberAddress1()%>"></td>
								</tr>
								<tr>
									<td scope="row" class="mt-2"><label>상세 주소 : </label></td>
									<td colspan="2"><input type='text'
										id='sample3_detailAddress' name="memberAddress2"
										class="inputBtn" value="<%=loginUser.getMemberAddress2()%>"></td>
								</tr>
								<tr>
									<td scope="row" colspan='3' class="mt-2"><input
										type='button' id='save' class='button1' value="변경저장"
										onclick="saveBtn();">&nbsp;&nbsp;
										<button type='button' class='button1' onclick="cancelBtn();">취소</button></td>
								</tr>

							</tbody>
						</table>
					</form>
				</fieldset>

			</div>
		</div>
	</div>

	<!-- <input type="text" id="sample3_postcode" placeholder="우편번호"> -->
	<!-- <button type="button" onclick="sample3_execDaumPostcode()" value="우편번호 검색" class='button1' id='attBtn'><br> -->
	<!-- <input type="text" id="sample3_address" placeholder="주소"><br> -->
	<!-- <input type="text" id="sample3_detailAddress" placeholder="상세주소"> -->
	<!-- <input type="text" id="sample3_extraAddress" placeholder="참고항목"> -->

	<!-- <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div> -->


	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		// 우편번호 찾기 찾기 화면을 넣을 element
		var element_wrap = document.getElementById('wrap');
		function foldDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_wrap.style.display = 'none';
			var apiId = document.getElementById("apiId");
			apiId.style.display = "none";
		}
		function sample3_execDaumPostcode() {
			// 현재 scroll 위치를 저장해놓는다.
			// var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
			new daum.Postcode({ 
				oncomplete : function(data) {
					// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						// document.getElementById("sample3_extraAddress").value = extraAddr;

					} else {
						// document.getElementById("sample3_extraAddress").value = '';
					}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample3_postcode').value = data.zonecode;
						document.getElementById("sample3_address").value = addr + extraAddr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample3_detailAddress").focus();
	
						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						element_wrap.style.display = 'none';
						apiId.style.display = "none";
						// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
						// document.body.scrollTop = currentScroll;
					},
					// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
					onresize : function(size) {
						element_wrap.style.height = size.height + 'px';
					},
					width : '100%',
					height : '100%'
				}).embed(element_wrap);

			// iframe을 넣은 element를 보이게 한다.
			element_wrap.style.display = 'block';
			var apiId = document.getElementById("apiId");
			apiId.style.display = "table-row";
		}
	</script>
<!-- <script>
			function updateUser(){
				if ($("#password1").val() == "") {
					alert("비밀번호를 입력해 주세요.");
				} else if ($("#password2").val() == "") {
					alert("비밀번호 확인을 입력해 주세요.")
				} else if ($("#phone2").val() == "") {
					alert("핸드폰 번호를 입력해 주세요.")
				} else if ($("#phone3").val() == "") {
					alert("핸드폰 번호를 입력해 주세요.")
				} else if ($("#email1").val() == "") {
					alert("이메일을 입력해 주세요.")
				} else if ($("#sample3_postcode").val() == "") {
					alert("우편 번호를 입력해 주세요.")
				} else if ($("#sample3_address").val() == "") {
					alert("주소를 입력해 주세요.")
				} else if ($("#sample3_detailAddress").val() == "") {
					alert("상세 주소를 입력해 주세요.")
				} else {
					$("#updateForm").submit();
				}
				return true;
			}
		</script> -->

	<script>
		$(function() {
			$("#email2").val("<%=loginUser.getMemberEmail2()%>").prop("selected", true);
			$("#phone1").val("<%=loginUser.getMemberPhone1()%>").prop("selected", true);
			
			$('#password2').change(function() {
				if ($('#password1').val() != $(this).val()) {
					$('#password3').text('비밀번호 불일치').css('color', 'red');
				} else {
					$('#password3').text('비밀번호 일치').css('color', 'green');
				}
			});
		
			$('#password1').change(function() {
				if ($('#password2').val() != $(this).val() && $('#password2').val().length > 0) {
					$('#password3').text('비밀번호 불일치').css('color', 'red');
				} else if ($('#password2').val() == $(this).val()) {
					$('#password3').text('비밀번호 일치').css('color', 'green');
				}
			});
		});
		
		
		function checkNum(e) {
			var keyVal = event.keyCode;
			if (((keyVal >= 48) && (keyVal <= 57))) {
				return true;
			} else {
				alert("숫자만 입력");
				return false;
			}
		}
	</script>
	<script>
		$(function() {
			$(".button1").mouseenter(function() {
				$(this).css({
					"background" : "#6AAED9",
					"color" : "white",
					"transition" : "0.2s",
					"border-radius" : "8px"
				});
			}).mouseout(function() {
				$(this).css({
					"padding" : "8px 18px",
					"border-radius" : "8px",
					"color" : "black",
					"border" : "1px solid #11538C",
					"background-color" : "white",
					"width" : "105px",
					"height" : "42px"
				});
			});
			$("#addBtn").mouseenter(function() {
				$(this).css({
					"background" : "#6AAED9",
					"color" : "white",
					"transition" : "0.2s",
					"border-radius" : "8px"
				});
			}).mouseout(function() {
				$(this).css({
					"padding" : "8px 18px",
					"border-radius" : "8px",
					"color" : "black",
					"border" : "1px solid #11538C",
					"background-color" : "white",
					"width" : "auto",
					"height" : "42px"
				});
			});
		});
	</script>

	<script>
				function saveBtn() {
					var passReg = /(?=.*\d)(?=.*[a-z]).{6,12}/;
					var pwd1 = document.getElementById("password1");
					var pwd2 = document.getElementById("password2");
					
					if (pwd1.value == "") {
						alert("비밀번호를 입력해 주세요.");
					}else if(!passReg.test(pwd1.value)){
						alert("숫자와 문자 포함 형태의 6~12자리 이내로 입력해주세요");	
					}else if (pwd2.value == "") {
						alert("비밀번호 확인을 입력해 주세요.");
					}else if(!passReg.test(pwd2.value)){
						alert("숫자와 문자 포함 형태의 6~12자리 이내로 입력해주세요");	
					} else if ($("#phone2").val() == "") {
						alert("핸드폰 번호를 입력해 주세요.");
					} else if ($("#phone3").val() == "") {
						alert("핸드폰 번호를 입력해 주세요.");
					} else if ($("#email1").val() == "") {
						alert("이메일을 입력해 주세요.");
					} else if ($("#sample3_postcode").val() == "") {
						alert("우편 번호를 입력해 주세요.");
					} else if ($("#sample3_address").val() == "") {
						alert("주소를 입력해 주세요.");
					} else if ($("#sample3_detailAddress").val() == "") {
						alert("상세 주소를 입력해 주세요.");
					}
					else {
						$("#updateForm").submit();
					}
				} 
			</script>

	<script>
		function cancelBtn() {
			if ($(".inputBtn").val() == "") {
				location.href = "grade.jsp";
			} else if ($(".inputBtn").val() != "") {
				var result = confirm("취소하시겠습니까?");
				if (result == true) {
					location.href = "<%=request.getContextPath()%>/grade.me?memberNo=<%=loginUser.getMemberNo()%>";
				} else {
					
				}
			}
		}
	</script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>