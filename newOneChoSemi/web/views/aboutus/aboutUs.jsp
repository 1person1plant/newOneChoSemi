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
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
				format('woff');
		font-weight: normal;
		font-style: normal;
	}
	
	* { font-family: "basicFont"; }
	/* font end */
</style>
<style>
	.contentAni {
		font-size: x-large;
		color: cornsilk;
		margin-top: 20%;
		text-shadow: 0px 1px 1px rgba(255, 255, 255, 0.6);
	}

    .backImgAni {
		z-index: 1;
		position: relative;
		overflow: hidden;
		display: flex;
		align-items: center;
		justify-content: center;
 		background-image: url("../../images/aboutus/birds.jpg");
		background-blend-mode: soft-light;
		background-size: cover;
		background-position: center center;
		padding: 2rem;
    }

    .bird {
    	/* svg가 인식이 안되서 png로 교체 */
		background-image: url("../../images/aboutus/bcn.png");
		background-size: auto 100%;
		width: 88px;
		height: 125px;
		background-blend-mode: soft-light;
		animation-name: fly-cycle;
		animation-timing-function: steps(10);
		animation-iteration-count: infinite;
    }

    .bird--one {
		animation-duration: 1s;
		animation-delay: -0.5s;
    }

    .bird--two {
		animation-duration: 0.9s;
		animation-delay: -0.75s;
    }

    .bird--three {
		animation-duration: 1.25s;
		animation-delay: -0.25s;
    }

    .bird--four {
		animation-duration: 1.1s;
		animation-delay: -0.5s;
    }

    .bird-container {
		position: absolute;
		top: 20%;
		left: -10%;
		transform: scale(0) translateX(-10vw);
		animation-timing-function: linear;
		animation-iteration-count: infinite;
    }

    .bird-container--one {
		animation-name: fly-right-one;
    	color: black;
		animation-duration: 15s;
		z-index: 2;
    }

    .bird-container--two {
		animation-name: fly-right-two;
		animation-duration: 16s;
		animation-delay: 1s;
		z-index: 2;
    }

    .bird-container--three {
		animation-name: fly-right-three;
		animation-duration: 14.6s;
		animation-delay: 9.5s;
    }

    .bird-container--four {
		animation-name: fly-right-four;
		animation-duration: 16s;
		animation-delay: 10.25s;
    }

    @keyframes fly-cycle {
      100% { background-position: -900px 0; }
    }

    @keyframes fly-right-one {
		0% { transform: scale(0.3) translateX(-10vw); }
		10% { transform: translateY(2vh) translateX(10vw) scale(0.4); }
		20% { transform: translateY(0vh) translateX(30vw) scale(0.5); }
		30% { transform: translateY(4vh) translateX(50vw) scale(0.6); }
		40% { transform: translateY(2vh) translateX(70vw) scale(0.6); }
		50% { transform: translateY(0vh) translateX(90vw) scale(0.6); }
		60% { transform: translateY(0vh) translateX(110vw) scale(0.6); }
		100% { transform: translateY(0vh) translateX(110vw) scale(0.6); }
    }

    @keyframes fly-right-two {
		0% { transform: translateY(-2vh) translateX(-10vw) scale(0.5); }
		10% { transform: translateY(0vh) translateX(10vw) scale(0.4); }
		20% { transform: translateY(-4vh) translateX(30vw) scale(0.6); }
		30% { transform: translateY(1vh) translateX(50vw) scale(0.45); }
		40% { transform: translateY(-2.5vh) translateX(70vw) scale(0.5); }
		50% { transform: translateY(0vh) translateX(90vw) scale(0.45); }
		60% { transform: translateY(0vh) translateX(110vw) scale(0.45); }
		100% { transform: translateY(0vh) translateX(110vw) scale(0.45); }
    }
	@keyframes fly-right-three {
		0% { transform: scale(0.3) translateX(-10vw) scale(0.7); }
		10% { transform: translateY(2vh) translateX(10vw) scale(0.4); }
		20% { transform: translateY(0vh) translateX(30vw) scale(0.5); }
		30% { transform: translateY(4vh) translateX(50vw) scale(0.6); }
		40% { transform: translateY(2vh) translateX(70vw) scale(0.6); }
		50% { transform: translateY(0vh) translateX(90vw) scale(0.6); }
		60% { transform: translateY(0vh) translateX(110vw) scale(0.6); }
		100% { transform: translateY(0vh) translateX(110vw) scale(0.6); }
    }

	@keyframes fly-right-four {
		0% { transform: translateY(-2vh) translateX(-10vw) scale(0.3); }
		10% { transform: translateY(0vh) translateX(10vw) scale(0.4); }
		20% { transform: translateY(-4vh) translateX(30vw) scale(0.6); }
		30% { transform: translateY(1vh) translateX(50vw) scale(0.45); }
		40% { transform: translateY(-2.5vh) translateX(70vw) scale(0.5); }
		50% { transform: translateY(0vh) translateX(90vw) scale(0.45); }
		60% { transform: translateY(0vh) translateX(110vw) scale(0.45); }
		100% { transform: translateY(0vh) translateX(110vw) scale(0.45); }
    }
</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">
	<%@ include file="../common/header.jsp"%>
	<!-- About Us Animation -->
	<div class="backImgAni">
		<div class="contentAni">
			<h1>
				일분 일초<br>
			</h1>
			<h3>하나의 화분이 당신의 삶에 변화를 가져옵니다.</h3>
			<div class="bird-container bird-container--one">
				<div class="bird bird--one"></div>
			</div>
			<div class="bird-container bird-container--two">
				<div class="bird bird--two"></div>
			</div>
			<div class="bird-container bird-container--three">
				<div class="bird bird--three"></div>
			</div>
			<div class="bird-container bird-container--four">
				<div class="bird bird--four"></div>
			</div>
		</div>
	</div>

	<!-- team member list -->
	<div id="section1"></div>
	<h2 class="text-center display-4 my-5">Member</h2>
	<div class="mb-5"></div>

	<div class="container">
		<div class="row memberLi">
			<nav class="col-md-3 d-none d-xl-block d-lg-block" id="myScrollspy">
				<ul class="nav nav-pills flex-column sticky-top" style="top: 63px;">
					<li class="nav-item"><a class="nav-link active" href="#section1">정 유 진 &lt; 팀 장 ></a></li>
					<li class="nav-item"><a class="nav-link" href="#section2">강 광 산 &lt; 부팀장 ></a></li>
					<li class="nav-item"><a class="nav-link" href="#section3">이 아 라 &lt; 팀 원 ></a></li>
					<li class="nav-item"><a class="nav-link" href="#section4">김 경 남 &lt; 팀 원 ></a></li>
					<li class="nav-item"><a class="nav-link" href="#section5">이 수 한 &lt; 팀 원 ></a></li>
				</ul>
			</nav>
			<div class="col-lg-9">
				<div>
					<div class="card mb-5">
						<img class="card-img-top" src="<%=request.getContextPath() %>/images/aboutus/jyj.png" alt="Card image cap">
						<div class="card-body">
							<h1 class="card-title">정 유 진 &lt; 팀장 ></h1>
							<div id="section2"></div>
							<div class="card-text"><h3>담당 : 관리자 페이지</h3></div>
							<p class="card-text">
								<small class="text-muted">마지막 접속: 2020/06/22</small>
							</p>
						</div>
					</div>
				</div>
				<div>
					<div class="card mb-5">
						<img class="card-img-top" src="<%=request.getContextPath() %>/images/aboutus/kks.jpg"
							alt="Card image cap">
						<div class="card-body">
							<h1 class="card-title">강 광 산 &lt; 부팀장 ></h1>
							<div id="section3"></div>
							<div class="card-text">
								<h3>담당 : 장바구니, 결제, About Us</h3>
							</div>
							<p class="card-text">
								<small class="text-muted">마지막 접속: 2020/06/22</small>
							</p>
						</div>
					</div>
				</div>     
				<div>
					<div class="card mb-5">
						<img class="card-img-top" src="<%=request.getContextPath() %>/images/aboutus/ara.jpg"
							alt="Card image cap">
						<div class="card-body">
							<h1 class="card-title">이 아 라 &lt; 팀원 ></h1>
							<div id="section4"></div>
							<div>
							<h3 class="card-text">담당 : 회원 가입, 일반/카카오 로그인</h3>
							</div>
							<p class="card-text">
								<small class="text-muted">마지막 접속: 2020/06/22</small>
							</p>
						</div>
					</div>
				</div>
				<div>
					<div class="card mb-5">
						<img class="card-img-top" src="<%=request.getContextPath() %>/images/aboutus/kkn.png" alt="Card image cap">
						<div class="card-body">
							<h1 class="card-title">김 경 남 &lt; 팀원 ></h1>
							<div id="section5"></div>
							<div class="card-text">
							<h3>담당 : 상품 페이지, 상품 상세 페이지, 리뷰</h3>
							</div>
							<p class="card-text">
								<small class="text-muted">마지막 접속: 2020/06/22</small>
							</p>
						</div>
					</div>
				</div>
				<div>
					<div class="card mb-5">
						<img class="card-img-top" src="<%=request.getContextPath() %>/images/aboutus/sh.jpg" alt="Card image cap">
						<div class="card-body">
							<h1 class="card-title">이 수 한 &lt; 팀원 ></h1>
							<div class="card-text">
							<h3>담당 : 마이 페이지</h3>
							</div>
							<p class="card-text">
								<small class="text-muted">마지막 접속: 2020/06/22</small>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <!--team member list end -->

	<%@ include file="../common/footer.jsp"%>
</body>
</html>