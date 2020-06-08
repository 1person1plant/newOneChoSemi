<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- 아라 스타일 적용 -->
    <style>
        #ara_btn_color {
            background: #1F598C;
            color: white;
            text-align: center bold;
        }
    </style>
    <!-- 아라 스타일 적용 -->
    <!-- 카카오 로그인 연결 (리소스) -->
    <script	src="<%=request.getContextPath() %>/resource/kakaoLogin.js"></script>	
    <script>
    	Kakao.init('3e25c4cd9076807d8c95d864db76f0c4');
    	Kakao.isInitialized();
    	
    	console.log('카카오');
    	console.log('카카오' + Kakao.isInitialized());
    </script>
</head>
<body>
    <!-- Modal -->
    <form id = "loginForm" action = "<%=request.getContextPath() %>/login.me" 
	method = "post">
	
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="col md-12" style="padding-top: 10px;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <svg class="bi bi-x-circle-fill" width="1em" height="1em" style="color: #6c757d;" viewBox="0 0 16 16" fill="currentColor"
                                xmlns="http://www.w3.org/2000/svg">
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
                        <input type="submit" value="로그인" class="btn btn-primary" id="ara_btn_color"
                            style="width: 80%; margin-bottom: 5px;" onclick="loginGo();"><br>
                        <input class="btn btn-secondary" style="width: 80%;" onclick="joinGo();"value="회원가입">
                    </div>
                </div>

                <div class="modal-footer" style="background: #F2F1DF;">
                    <div class="row  col-md-12">
                        <div class="col-md-6" align="left">
                            <button type="button" class="btn btn-secondary" onclick="kakaoLogin();">카카오</button>
                        </div>
                        <div class="col-md-6" align="right">
                            <button type="button" class="btn btn-primary" id="ara_btn_color" onclick="findAcctGo();">계정찾기</button>
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
		
		// 카카오 로그인 스크립트
		function kakaoLogin() {
			Kakao.Auth.loginForm({
				success : function(response) {
					console.log("성공" + response);

					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							console.log(response);
								debugger;
								
							$('#kakaoId').val(response.id);
							$('#kakaoNm').val(response.properties.nickname);
							$('#kakaoForm').submit();
							// 자동 회원가입 기능 (ajax)
							//1. response.id(카카오 사용자 고유  id)가 테이블에 존재할 경우  로그인 시키기

							//2. response.id가 테이블에 존재하지 않을 경우 자동으로  insert한 후에 로그인 시키기

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