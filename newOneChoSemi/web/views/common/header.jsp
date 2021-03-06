<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = null;
	Member kakaoUser = null;
	boolean result = true;
	String adminChk = "";
	String kakaoChk = "";
	String userNo = "";
	String userRank = "";
	String kakaoNo = "";
   
	if(session!=null || !request.isRequestedSessionIdValid()){
		loginUser = (Member)session.getAttribute("loginUser");
		kakaoUser = (Member)session.getAttribute("kakaoUser");
		
		System.out.println("해더에서 출력 : " + loginUser);
		
		if(kakaoUser != null && loginUser == null){
			kakaoChk = loginUser.getMemberStatus();
			kakaoNo = loginUser.getMemberNo();
			result = false;
		} else if(kakaoUser == null && loginUser != null){
			userNo = loginUser.getMemberNo();
			adminChk = loginUser.getMemberAdmin();
			userRank = loginUser.getMemberRank();
			result = false;
		}
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-169937382-1"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'UA-169937382-1');
	</script>
	
	
    <meta charset="UTF-8">
    <title>Cho-당신을 위한 반려식물</title>
    
	<!-- 제이쿼리 -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <!-- header css -->
    <style>
        /* 로고 이미지 start */
        #mainlogo {
            width: 100%;
            height: 200px;
            background-color: #F2F1DF;
            text-align: center;
            display: block;
            float: left;
            position: relative;
            margin: 0;
            cursor:pointer
        }
        /* 로고 이미지 end */
    
        /* scrollspy(하단 nav) start */
        .navbotspy {
            position: absolute;
            top: 55px;
            z-index: 1;
            width: 100%;
            background-color: #f1f1f1;
            margin: 0;
        }
        .navbotspy-progress-container { /* scrollspy 배경 */
            width: 100%;
            height: 8px;
            background: #ccc;
        }
        .navbotspy-progress-bar { /* scrollspy 진행상태 바 */
            height: 8px;
            background: #5B89A6;
            width: 0%;
        }
        /* scrollspy end */
        /* navbar 공통 start */
        #navbar-top,
        #navbar-bot {
            margin: 0;
            padding-left: 0;
        }
        #navbar-top a,
        #navbar-bot a {
        	cursor:pointer
        }
        #navbar-top .nav-item,
        #navbar-bot .nav-item{
            padding-left: 10px;
        }
        /* navbar 공통 end */
        /* 상단 navbar start */
        #navbar-top {
            z-index: 10;
            right: 0;
            position: absolute;
            border-width: 0px;
            -webkit-box-shadow: 0px 0px;
            box-shadow: 0px 0px;
            background-color: rgba(0, 0, 0, 0.0);
        }
        /* 상단 navbar end */
    
        /* 탑버튼 start */
        #top-btn {
            display: none;
            position: fixed;
            bottom: 20px;
            right: 30px;
            z-index: 99;
            font-size: 18px;
            border: none;
            outline: none;
            background-color: #1f598c;
            color: white;
            cursor: pointer;
            padding: 15px;
            border-radius: 4px;
        }
        #top-btn:hover {
            background-color: #5b89a6;
        }
        /* 탑 버튼 end */
    </style>

<!-- 로그인 테스트 셈플 폼 -->
	<style>
		/* Full-width input fields */
		#loginSample input[type=text],
		#loginSample input[type=password] {
			width: 100%;
			padding: 12px 20px;
			margin: 8px 0;
			display: inline-block;
			border: 1px solid #ccc;
			box-sizing: border-box;
		}
		
		/* Set a style for all buttons */
		#loginSample button {
			background-color: #4CAF50;
			color: white;
			padding: 14px 20px;
			margin: 8px 0;
			border: none;
			cursor: pointer;
			width: 100%;
		}
		
		#loginSample button:hover {
			opacity: 0.8;
		}
		
		/* Extra styles for the cancel button */
		#loginSample .loginSample_cancelbtn {
			width: auto;
			padding: 10px 18px;
			background-color: #f44336;
		}
		
		/* Center the image and position the close button */
		#loginSample .imgcontainer {
			text-align: center;
			margin: 24px 0 12px 0;
			position: relative;
		}
		
		#loginSample img.avatar {
			width: 40%;
			border-radius: 50%;
		}
		
		#loginSample .container {
			padding: 16px;
		}
		
		#loginSample span.psw {
			float: right;
			padding-top: 16px;
		}
		
		/* The Modal (background) */
		#loginSample .modal {
			display: none; /* Hidden by default */
			position: fixed; /* Stay in place */
			z-index: 1220; /* Sit on top */
			left: 0;
			top: 0;
			width: 100%; /* Full width */
			height: 100%; /* Full height */
			overflow: auto; /* Enable scroll if needed */
			background-color: rgb(0,0,0); /* Fallback color */
			background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
			padding-top: 60px;
		}
		
		/* Modal Content/Box */
		#loginSample .modal-content {
			background-color: #fefefe;
			margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
			border: 1px solid #888;
			width: 80%; /* Could be more or less, depending on screen size */
		}
		
		/* The Close Button (x) */
		#loginSample .loginSample_close {
			position: absolute;
			right: 25px;
			top: 0;
			color: #000;
			font-size: 35px;
			font-weight: bold;
		}
		
		#loginSample .loginSample_close:hover,
		#loginSample .loginSample_close:focus {
			color: red;
			cursor: pointer;
		}
		
		/* Add Zoom Animation */
		#loginSample .animate {
			-webkit-animation: animatezoom 0.6s;
			animation: animatezoom 0.6s
		}
		
		@-webkit-keyframes animatezoom {
			from {-webkit-transform: scale(0)} 
			to {-webkit-transform: scale(1)}
		}
		  
		@keyframes animatezoom {
			from {transform: scale(0)} 
			to {transform: scale(1)}
		}
		
		/* Change styles for span and cancel button on extra small screens */
		@media screen and (max-width: 300px) {
			#loginSample span.psw {
			   display: block;
			   float: none;
			}
			#loginSample .loginSample_cancelbtn {
			   width: 100%;
			}
		}
	</style>
</head>
<body>
    <header>
        <!--탑 버튼-->
        <button onclick="topFunction()" id="top-btn" title="Go to top">Top</button>

        <!--로고 이미지-->
        <div id="mainlogo" onclick="goMainPage()">
            <img src="<%=request.getContextPath() %>/images/logo.png" class="img-fluid" alt="Responsive image" style="width: 150px; height: 100px; margin-top: 40px;">
        </div>
    <!--상단 navbar -->
    <div style="position: relative;">
	<%if(result){ %>
	<!-- 로그인 실패 -->
		<nav class="navbar navbar-expand navbar-light" id="navbar-top">
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		        <ul class="navbar-nav ml-auto">
		            <li class="nav-item">
		                <a id="Header_loginBtn" class="nav-link" style="cursor: pointer" data-toggle="modal" data-target="#exampleModal">로그인</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" style="cursor: pointer" onclick="myPageBtn()">마이페이지</a>
		            </li>
		        </ul>
		    </div>
		</nav>
		
    
    <!-- 로그인 모달 붙이기 -->
    <%@ include file="../member/login.jsp" %>

	<%} else { %>
	<!-- 로그인 성공 -->
		   <nav class="navbar navbar-expand navbar-light" id="navbar-top">
		        <div class="collapse navbar-collapse" id="navbarSupportedContent">
		            <ul class="navbar-nav ml-auto">
		            	
		            	<li class="nav-item" style="margin-top:8px">
		            	<%if(kakaoChk.equals("K")){ %>
							<a><%=kakaoUser.getMemberName() %>님의 방문을 환영합니다.</a>
						<%}else{ %>
							<a><%=loginUser.getMemberName() %>님의 방문을 환영합니다.</a>
						<%} %>
						</li>
						
		            	<%if(adminChk.equals("Y")){ %>
						<li class="nav-item">
		                    <a class="nav-link" style="cursor: pointer" href="<%=request.getContextPath() %>/list.st">관리자 페이지</a>
		                </li>
		                <%} %>
		                <li class="nav-item">
		                	<input type="hidden" id="userNo" value="<%=userNo %>"> <!-- 로그인유저 번호 저장 -->
		                    <a class="nav-link" style="cursor: pointer" onclick="logout()">로그 아웃</a>
		                </li>
		                <li class="nav-item">
		                    <a class="nav-link" style="cursor: pointer" onclick="myPageBtn()">마이페이지</a>
		                </li>
		                
		            </ul>
		        </div>
		    </nav>
	<%} %>
		</div>
    </header>
    <!-- sticky-top은 header안에서 작동안함 -->
    <!--하단 nav-->
    <nav class="navbar navbar-expand-md navbar-light bg-light sticky-top" id="navbar-bot">
        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="<%=request.getContextPath()%>/index.jsp"><i class="fas fa-home"></i> HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" onclick="goAll()">ALL</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" onclick="goSoil()">SOIL</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" onclick="goWater()">WATER</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" onclick="goHanging()">HANGING</a>
                </li>
            </ul>
        </div>
        <button class="navbar-toggler order-first ml-2" type="button" data-toggle="collapse"
            data-target=".dual-collapse2">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item px-3">
                    <a class="nav-link" style="cursor: pointer" onclick="goCart()"><i class="fas fa-cart-plus"></i></a>
                </li>
            </ul>

			<form class="form-inline my-2 my-lg-0" method="get" action="<%=request.getContextPath()%>/itemSearch.it">
                <input class="form-control mr-sm-2 searchWhat" type="search" placeholder="Search" aria-label="Search" name="searchWhat">
                <input type="hidden" name="searchPriceMin" value=0>
                <input type="hidden" name="searchPriceMax" value=9999999>
                <button class="btn btn-outline-info my-2 my-sm-0" type="button" onclick="headerSearch()">Search</button>
            </form>
        </div>
        <div class="navbotspy spy d-none d-xl-block d-lg-block d-md-block">
            <div class="navbotspy-progress-container progress-container bg-light">
                <div class="navbotspy-progress-bar progress-bar" id="myBar"></div>
            </div>
        </div>
    </nav>

    <!--user가 scroll 내릴 때 발생하는 function 모음-->
    <script>
        // When the user scrolls the page, execute myFunction
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () { myFunction() };
        function myFunction() {
            //progress bar
            var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
            var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            var scrolled = (winScroll / height) * 100;
            document.getElementById("myBar").style.width = scrolled + "%";
            var goToTopBtn = document.getElementById("top-btn");
            //gototop button visible
            if (winScroll > 10) {
                goToTopBtn.style.display = "block";
            } else {
                goToTopBtn.style.display = "none";
            }
            //navbar-bottom transparent&opaque
            if (winScroll > 10) {
                $('#navbar-bot').css('opacity', '0.6');
                $('#navbar-bot').bind('mouseenter', function () {
                    $('#navbar-bot').css('opacity', '1');
                }).bind('mouseleave', function () {
                    $('#navbar-bot').css('opacity', '0.6');
                })
            } else {
                $('#navbar-bot').unbind('mouseenter').unbind('mouseleave');
                $('#navbar-bot').css('opacity', '1');
            }
        }
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
        </script>
        <script>
        function myPageBtn(){
        	<%if(result){%>
        		alert("로그인이 필요한 기능 입니다.");
        		$("#Header_loginBtn").click();
			<%} else {%>
				var chkKao = "<%=loginUser.getMemberStatus() %>";
				if(chkKao == "K"){
					location.href="<%=request.getContextPath()%>/grade.me?memberNo=<%=loginUser.getMemberNo()%>";
				} else {
	        		location.href="<%=request.getContextPath()%>/views/myPage/identification.jsp?memberId=<%=loginUser.getMemberId()%>";
				}
	   		<%} %>
		}
        function goCart(){
        	var userNo = $("#userNo").val();
        	<%if(result){%>
    			alert("로그인이 필요한 기능 입니다.");
        		$("#Header_loginBtn").click();
			<%} else {%>
				location.href="<%=request.getContextPath()%>/cart.ca?userNo=" + userNo;
       		<%} %>
		}
        
		function validate(){ // 로그인
			if($.trim($("#userId").val()) == ""){ // 아이디는 공백 제거 후 입력 확인
 				alert("아이디를 입력하세요");
				$("#userId").focus();
				return false;
 			} else if($("#userPwd").val() == "") { // 비밀번호는 입력만 확인
 				alert("비밀번호를 입력하세요");
				$("#userPwd").focus();
 				return false;
 			} else {
				return true;
 			}
		}
		function logout() {
			location.href="<%=request.getContextPath()%>/logout.me";
		}
		
		
		// 메인 페이지로 가는 펑션
		function goMainPage() {
			location.href="<%=request.getContextPath()%>/index.jsp";
		}
		function goAll() {
			location.href="<%=request.getContextPath()%>/itemMain.it";
		}
		
		
		// SOIL 페이지로 가는 펑션
		function goSoil() {
			location.href="<%=request.getContextPath()%>/category.it?category=SOIL";
		}
		// WATER 페이지로 가는 펑션
		function goWater() {
			location.href="<%=request.getContextPath()%>/category.it?category=WATER";
		}
		// HANGING 페이지로 가는 펑션
		function goHanging() {
			location.href="<%=request.getContextPath()%>/category.it?category=HANGING";
		}
    	function headerSearch() {
			var searchWhat = $(".searchWhat").val();
			console.log(searchWhat);
			
			location.href="<%=request.getContextPath()%>/itemSearch.it?searchWhat=" + searchWhat + "&searchPriceMin=0&searchPriceMax=999999";
		}
    </script>
    
    <!-- 방문자 수 체크용 -->
 	<script>
	    $(document).click(function(){
			
			var ipAddr='<%=request.getRemoteAddr()%>';
			var sessionId='<%=session.getId()%>';
		
			$.ajax({
			
				url:"<%=request.getContextPath()%>/count.vi",
				type:"post",
				data:{ip:ipAddr,id:sessionId},
				success:function(data){
					
					if(data=="success"){
						console.log("방문자 기록");
					}
				},
				error:function(data){
					console.log("방문자 기록 실패");
				}
				
			});
		});
    </script>
</body>
</html>