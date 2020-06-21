<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<html>
	<head>
    	<!-- Required meta tags -->
    	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	
		<!-- 카카오 로그인 연결 (리소스) -->
    	<script	src="<%=request.getContextPath() %>/resource/kakaoLogin.js"></script>	
    	<script>
    		Kakao.init('3e25c4cd9076807d8c95d864db76f0c4');
    		Kakao.isInitialized();
    	
    		console.log('카카오');
    		console.log('카카오' + Kakao.isInitialized());
   	 	</script>
   	 	<style>
   	 		/* 카카오 버튼 이미지 */
   	 		.kakaoBtn{
   	 		 	background: url("<%=request.getContextPath() %>/images/kakao_login_medium_narrow.png") no-repeat center;
   	 		 	width: 183px;
		        height: 45px;
		        object-fit: cover;
		        border: none;
		        padding: auto;
		        cursor: pointer;
		        vertical-align: center;
   	 		}
   	 		.findAccBtn{
   	 			width: 183px;
		        height: 45px;
   	 		}
   	 	</style>
	</head>
	<body onload='javascript:getValue();'> 
	<!-- memberId 객체가 생성된 후 실행하기 위해서(저장할 변수명과 가져올 변수명은 memberId를 저장할때 쿠키에 저장할 이름을 정해 놓아야 가져올때도 가져올수 있기 때문이다 (이름을 이용하여 불러오기때문에 불러올때와 집어넣을때의 이름은 똑같이 해준다) --> 
    	<!-- Modal -->
    	<form id = "loginForm" name="form" action = "<%=request.getContextPath() %>/login.me" method = "post">
		
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        	<div class="modal-dialog">
            	<div class="modal-content">
                	<div class="col md-12" style="padding-top: 10px;">
                    	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<svg class="bi bi-x-circle-fill" width="1em" height="1em" style="color: #6c757d;" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            	<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.146-3.146a.5.5 0 0 0-.708-.708L8 7.293 4.854 4.146a.5.5 0 1 0-.708.708L7.293 8l-3.147 3.146a.5.5 0 0 0 .708.708L8 8.707l3.146 3.147a.5.5 0 0 0 .708-.708L8.707 8l3.147-3.146z" />
                            </svg>
                    	</button>
                	</div>

                	<div class="modal-header">
                    	<h5 class="modal-title" id="exampleModalLabel">
                        	<div class="col-md-12" align="center" style="position: relative">
								<img src="<%=request.getContextPath() %>/images/logo.png" style="width: 40%">
                        	</div>
                    	</h5>
					</div>
                	<br>
                	<div class="modal-body">
                    	<div class="col-md-12">
                        	<h3><strong>아이디</strong></h3>
                    	</div>
                    	<div class="col-md-12">
                        	<input type="text" class="form-control" placeholder="아이디를 입력해주세요" maxlength="16" required name="memberId" id="memberId">
                        	<input type="checkbox" id="cb_saveId" name='btn' value='setCookie' onclick='javascript:setValue();' style="margin-top: 10px; margin-bottom: 10px;"> 아이디 저장 <br>
                    	</div>
                    	<br>
                    	<div class="col-md-12">
                        	<h3><strong>비밀번호</strong></h3>
                    	</div>
                    	<div class="col-md-12">
                        	<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" maxlength="12" required name="memberPwd" id="memberPwd">
                    	</div>

                    	<br>

                    	<div class="col-md-12" align="center">
                        	<input type="submit" value="로그인" class="btn btn-primary" id="loginBtn"
                            	style="width: 80%; margin-bottom: 5px; background: #1F598C;" onclick="loginGo();"><br>
                        	<input class="btn btn-secondary" style="width: 80%;" onclick="joinGo();"value="회원가입">
                    	</div>
                	</div>

                	<div class="modal-footer" style="background: #F2F1DF;">
                    	<div class="row  col-md-12">
                        	<div class="col-md-6" align="left">
                            	<button type="button" class="btn btn-secondary kakaoBtn" onclick="kakaoLogin();"></button>
                        	</div>
                        	<div class="col-md-6" align="right">
                            	<button type="button" class="btn btn-primary findAccBtn" style="background: #1F598C;" onclick="findAcctGo();">계정찾기</button>
                        	</div>
                    	</div>
                	</div>
            	</div>
        	</div>
    	</div>
    	</form>

		<form id="kakaoForm" action="<%=request.getContextPath()%>/KakaoLoginServlet" hidden=true>
			<input type="hidden" name="kakaoId" id="kakaoId">
			<input type="hidden" name="kakaoNm" id="kakaoNm">
		</form>
		
		<!-- 아이디 저장 시작 -->
		<script>
		
			// 쿠키값 저장하기 => 저장할 변수명(name)으로 저장할변수(value) 일자(expiredays) 저장하는지
			function setCookie (name, value, expiredays){
	 			var todayDate = new Date();
	 			todayDate.setDate( todayDate.getDate() + expiredays );
	 			document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
			}
			
			function getCookie(name){
	 			var Found = false;
	 			var start, end;
	 			var i = 0;

	 			while (i <= document.cookie.length){
	  				start = i;
	  				end = start + name.length;
	  				
	  				if (document.cookie.substring(start, end) == name){
						Found = true;
						break;
					}
						i++;
				}
	 			
	 			if (Found == true){
	  				start = end + 1;
	  				end = document.cookie.indexOf(';', start);
	  				
	  				if (end < start) end = document.cookie.length;
	  					return document.cookie.substring(start, end);
	 			}
	 			return '';
			}

			function setValue(){
	 			var fm = document.form;
	 			var isRemember;
	 			
				if(cb_saveId.checked){
					isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");

					if(!isRemember){
						cb_saveId.checked = false;
					}
				}
				
	 			setCookie ('memberId', fm.memberId.value, 1);

			}

			function getValue(){
	 			var fm = document.form;
	 			fm.memberId.value = getCookie('memberId');
			}
			
		</script>
		<!-- 아이디 저장 끝 -->

		<script>
			function joinGo() {
				location.href="<%=request.getContextPath()%>/views/member/join.jsp";
			}
		
			function findAcctGo() {
				location.href="<%=request.getContextPath()%>/views/member/find_Account.jsp";
			}
		
			function loginGo(){
				if($.trim($("#memberId").val()) == ""){ // 아이디는 공백 제거 후 입력 확인
					alert("아이디를 입력하세요");
					$("#memberId").focus();
					return false;
				} else if($("#memberPwd").val() == "") { // 비밀번호는 입력만 확인
					alert("비밀번호를 입력하세요");
					$("#memberPwd").focus();
					return false;
				}
					return true;				
			}
			
			// 카카오 로그인 스크립트 => 자동 회원가입 기능 (ajax)
			function kakaoLogin() {
				Kakao.Auth.loginForm({
					success : function(response) {
						console.log("성공" + response);

						Kakao.API.request({
							url : '/v2/user/me',
							success : function(response) {
								console.log(response);
								// debugger;
								$('#kakaoId').val(response.id);
								$('#kakaoNm').val(response.properties.nickname);
								$('#kakaoForm').submit();
							},
							fail : function(error) {
								console.log(error);
							}
						});
					},
					fail : function(error) {
						console.log("실패" + error);
					},
				});
			}
		</script>
	</body>
</html>