<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
    	<meta name="viewport" content="width=device-width" initial-scale="1">
    	<title>Cho-당신을 위한 반려식물</title>
    	<!--타이틀 아이콘-->
    	<link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath() %>/images/logo.png">

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
            	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
            	font-weight: normal;
            	font-style: normal;
        	}
        	* { font-family: "basicFont"; }
        /* font end */
    	</style>
    
    	<!-- 아라 스타일 적용 -->
		<style>
	  	.ara-label-text{
	    	padding-top: 6px;
	   	 	text-align: right;
	  	}
	  	
	  	.loading{
			width:1550px;
    		height:100px;
    		position:fixed; /* 스크롤 내려도 그 위치에 */
    		left:0%;
    		top:30%;
   			background:#F2F1DF;
   			text-align: center;
   			z-index:1000; /* 이 값으로 레이어의 위치를 조정합니다. */
    		display: none;
    		border: 1px solid gray;
		}
		</style>
		<!-- 아라 스타일 적용 -->
    
	</head>
	
	<body>

	<%@ include file="../common/header.jsp"%>
  
    	<!-- 아라 _ 계정찾기-->
    	
    
			<div class="container-fluid" style="margin-top: 80px;">
    	
     			<!-- 공백 : 내용 : 공백 -->
				<div class="row">
      	
        			<!-- 왼쪽공백 -->
        			<div class="test col-md-3"></div>
  
        			<div class="test col-md-6" style="padding: 0px;">
						<div class="test col-md-12" style="margin-bottom: 50px;">
            				<div class="test col-md-12">
              					<h1 style="text-align-last: left;">아이디 찾기</h1>
            				</div>
            				<hr>
            				<div class="test col-md-12">
              					<p style="text-align-last: left;">회원가입 시, 입력하신 휴대폰 번호 *이메일로 아이디를 일부 확인하실 수 있습니다</p>
            				</div>
            				<br>
            				<div class="test col-md-12">
              					<tbody>
                					<tr class="user-phone">
                  						<th>
                    						<div class="row">
                      							<div class="test col-md-2 ara-label-text">휴대폰 번호</div>
                      							<div class="test col-md-8">
                        							<div class="row">
                          								<select id="memberPhone1" name="memberPhone1" class="form-control" aria-describedby="basic-addon1" style="width: 20%;">
                            								<option value="010">010</option>
                            								<option value="011">011</option>
                           									<option value="016">016</option>
                            								<option value="017">017</option>
                            								<option value="018">018</option>
                            								<option value="019">019</option>
                          								</select>
                          								<p class="ara-label-text">&nbsp;-&nbsp;</p>
                          								<input id="memberPhone2" name="memberPhone2" type="text" maxlength="4" required class="form-control" aria-describedby="basic-addon1"
                            								style="width: 20%;"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                          								<p class="ara-label-text">&nbsp;-&nbsp;</p>
                          								<input id="memberPhone3" name="memberPhone3" type="text" maxlength="4" required class="form-control" aria-describedby="basic-addon1"
                            								style="width: 20%;"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        							</div>
                      							</div>
                      							<div class="test col-md-2"></div>
                    						</div>
                  						</th>
               	 					</tr>
                					<br>
                					<tr class="user-email">
                  						<th>
                   	 						<div class="row">
                      							<div class="test col-md-2 ara-label-text">이메일</div>
                      							<div class="test col-md-8">
                        							<div class="row">
                          								<input id="memberEmail1" name="memberEmail1" type="text" required maxlength="16" class="form-control" aria-describedby="basic-addon1" style="width: 150px;">
                          								<p class="ara-label-text">&nbsp;@&nbsp;</p>
                         	 							<select id="memberEmail2" name="memberEmail2" class="form-control" aria-describedby="basic-addon1" style="width: 150px;">
                            								<option value="@naver.com">naver.com</option>
                      	      								<option value="@daum.net">daum.net</option>
                     								       	<option value="@gmail.com">gmail.com</option>
                           								 	<option value="@nate.com">nate.com</option>
                            								<option value="@hanmail.net">hanmail.net</option>
                          								</select>
                        							</div>
                      							</div>
                      							<div class="test col-md-2"></div>
                    						</div>
                  						</th>
                					</tr>
              					</tbody>
            				</div>
            				<div class="row">
              					<div class="test col-md-8"></div>
              					<div class="test col-md-4">
                					<button id="searchid_btn" class="btn btn-default" style="background: #1f598c; color:white;" onclick="searchId();">아이디 찾기</button>
              					</div>
            				</div>
          				</div>

          				<div class="test col-md-12">
            				<div class="test col-md-12">
              					<h1 style="text-align-last: left;">비밀번호 찾기</h1>
            				</div>
            				<hr>
            				<div class="test col-md-12">
              					<p style="text-align-last: left;">가입하신 아이디 *이메일 입력, 본인 인증을 통해 이메일로 임시 비밀번호를 보내드립니다.<br>확인 후 로그인 하셔서 반드시 비밀번호를 변경하시기 바랍니다.</p>
            				</div>
            				<br>
            				<div class="test col-md-12">
              					<tbody>
                					<tr class="user-id">
                  						<th>
                    						<div class="row">
                      							<div class="test col-md-2 ara-label-text">아이디</div>
                      							<div class="test col-md-4">
                        							<div class="row">
                          								<input id="memberId_A" name="memberId_A" type="text" class="form-control" required placeholder="아이디를 입력하세요" aria-describedby="basic-addon1">
                        							</div>
                      							</div>
                      							<div class="test col-md-6"></div>
                    						</div>
                  						</th>
                					</tr>
                					<br>
									<tr class="user-email">
                  						<th>
                   	 						<div class="row">
                      							<div class="test col-md-2 ara-label-text">이메일</div>
                      							<div class="test col-md-8">
                        							<div class="row">
                          								<input id="memberEmail1_P" name="memberEmail1_P" type="text" required maxlength="16" class="form-control" aria-describedby="basic-addon1" style="width: 150px;">
                          								<p class="ara-label-text">&nbsp;@&nbsp;</p>
                         	 							<select id="memberEmail2_P" name="memberEmail2_P" class="form-control" aria-describedby="basic-addon1" style="width: 150px;">
                            								<option value="@naver.com">naver.com</option>
                      	      								<option value="@daum.net">daum.net</option>
                     								       	<option value="@gmail.com">gmail.com</option>
                           								 	<option value="@nate.com">nate.com</option>
                            								<option value="@hanmail.net">hanmail.net</option>
                          								</select>
                        							</div>
                      							</div>
                      							<div class="test col-md-2"></div>
                    						</div>
                  						</th>
                					</tr>
              					</tbody>
            				</div>
            				<div class="row">
              					<div class="test col-md-8"></div>
              					<div class="test col-md-4">
                					<button id="searchPwd_btn" class="btn btn-default" style="background: #1f598c; color:white;" onclick="searchPwd();">비밀번호 찾기</button>
              					</div>
            				</div>
          				</div>
        			</div>

        			<!-- 오른쪽 공백 -->
        			<div class="test col-md-3"></div>
				</div>
			</div>
    		<div class="container-fluid"></div>
    		
    		<!-- 로딩 팝업창  -->
    		<div class="loading">
      			<br>&nbsp;로딩중입니다. <br>&nbsp;잠시만 기다려 주세요 ^-^*
      			<div class="spinner-border text-primary" role="status">
        		<span class="sr-only">Loading...</span>
      			</div>
   			</div>  
    		
    		<!-- 아라 _ 계정찾기-->
    	
    <!-- ----------------------- 스 크 립 트 ---------- -->
    
    <script>
    	function searchId() {
			if($("#memberPhone2").val() == null || $("#memberPhone2").val() == "" ){
				alert('핸드폰 번호를 입력해주세요');
				$("#memberPhone2").focus();
			} else if($("#memberPhone3").val() == null || $("#memberPhone3").val() == "" ){
				alert('핸드폰 번호를 입력해주세요');
				$("#memberPhone3").focus();
			} else if( $("#memberEmail1").val() == null || $("#memberEmail1").val() == "" ){
				alert('이메일을 입력해주세요');
				$("#memberEmail1").focus();
			} else{    		
				
				var jsonData = {
					phone1 : $("#memberPhone1").val(),
					phone2 : $("#memberPhone2").val(),	
					phone3 : $("#memberPhone3").val(),	
					email1 : $("#memberEmail1").val(),
					email2 : $("#memberEmail2").val()
				}
				
				$.ajax({
					url: "<%=request.getContextPath()%>/searchId.me",
					type: "POST",
					data: jsonData,
					dataType: 'json',
					
					success: function(data){
						
						if(data != null){
							alert("회원님의 아이디는 [" + data.memberId + "] 입니다.");
						}else{
							alert("내용과 일치하는 회원정보가 없습니다");
						}
					},
					error: function(request,status,error){
						alert("예기치 못한 에러가 발생했습니다. 관리자에게 문의하여 주십시오");
					}
				})
			}
    	} 
    </script>	
    
    <script>
    	function searchPwd() {

			if($("#memberId_A").val() == null || $("#memberId_A").val() == "" ){
				alert('아이디를 입력해주세요');
				$("#memberId_A").focus();
			} else if( $("#memberEmail1_P").val() == null || $("#memberEmail1_P").val() == "" ){
				alert('이메일을 입력해주세요');
				$("#memberEmail1_P").focus();
			} else{    		
	    		$(".loading").show();
	    		
				var jsonData = {
						memberId_A : $("#memberId_A").val(),
						memberEmail1_P : $("#memberEmail1_P").val(),
						memberEmail2_P : $("#memberEmail2_P").val()
				}
					
				$.ajax({
					url: "<%=request.getContextPath()%>/searchPwd.me",
					type: "POST",
					data: jsonData,
					dataType: 'json',
					
					success: function(data){
						debugger;
						$(".loading").fadeOut(); // 로딩창 사라지게 
						
						if(data != null){
							alert("임시 비밀번호가 메일로 전송되었습니다.");
						}else{
							alert("내용과 일치하는 회원정보가 없습니다");
						}
					},
					error: function(request,status,error){
						$(".loading").fadeOut();
						alert("예기치 못한 에러가 발생했습니다. 관리자에게 문의하여 주십시오");
					}
				})
			}
		}
    </script>	
    

	<%@ include file="../common/footer.jsp"%>

	</body>
</html>