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
    
    <!-- 스크롤 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.3.3/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.3.3/ScrollTrigger.min.js"></script>
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
    <style>
    	/* carousel start */
        .carousel-control-prev-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
        }
    
        .carousel-control-next-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") !important;
        }
    
        .maincarousel-inner {
            width: 100%;
            max-height: 700px !important;
        }
    
        .maincarousel-caption {
            position: absolute;
            top: 300px;
            color: black;
        }
        /* carousel end */
        .onechoitem1,
        .onechoitem2 {
        	margin-top: 300px;
        	margin-bottom: 600px;
        	position: relative;
        }
        .onechoitem2{
        	text-align: right;
        }
        .onechoitem1_img {
        	position: absolute;
        	transform: translateY(-50%);
        	right: -250px;
        }
        .onechoitem2_img {
        	position: absolute;
        	transform: translateY(-50%);
        	left: 0;
        }
    </style>
    
    <!-- video css -->
	<style>
		.vbox_container{
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    min-height: 100vh;
		    background: url("images/TS/f0f732136a677.jpg") no-repeat center;
		    background-size : cover;
		}
		.vbox_card{
		    position: relative;
		    display: flex;
		    justify-content: space-evenly ;
		    align-items: center;
		    width: 1000px;
		}
		.vbox_card .vbox{
		    position: relative;
		    width: 600px;
		    height: 430px;
		    background: #000;
		}
		.vbox_card .vbox .videoBx{
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		}
		.vbox_card .vbox .videoBx video{
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		}
		.vbox_card .vbox .contentBx{
		    position: absolute;
		    top: 40px;
		    bottom: 40px;
		    right: 40px;
		    width: 100%;
		    justify-content: center;
		    align-items: center;
		    background: rgba(0,0,0,0.95);
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    transition: transform 0.5s;
		    transform-origin: right;
		    transform: scaleX(0);
		}
		.vbox_card .vbox:hover .contentBx{
		    transition: transform 0.5s;
		    transform-origin: left;
		    transform: scaleX(1);
		}
		.vbox_card .vbox .contentBx .vbox_content {
		    position: relative;
		    padding: 20px 60px;
		    opacity: 0;
		}
		.vbox_card .vbox:hover .contentBx .vbox_content {
		    opacity: 1;
		    transition: 0.5s;
		    transition-delay: 0.5s;
		}
		.vbox_card .vbox .contentBx .vbox_content h2{
		    color: #fff;
		    font-weight: 500;
		    margin-bottom: 10px;
		}
		.vbox_card .vbox .contentBx .vbox_content p{
		    color: #fff;
		    font-weight: 500;
		}
    </style>
</head>
<body>
<%@ include file="views/common/header.jsp" %>

	<section>
	    <!--carousel-->
	    <div class="container-fluid" style="padding: 0px">
	        <div id="carouselECS" class="carousel slide" data-ride="carousel">
	            <ol class="carousel-indicators">
	                <li data-target="#carouselECS" data-slide-to="0" class="active"></li>
	                <li data-target="#carouselECS" data-slide-to="1"></li>
	                <li data-target="#carouselECS" data-slide-to="2"></li>
	            </ol>
	            <div class="maincarousel-inner carousel-inner">
	                <div class="carousel-item active">
	                    <img src="<%=request.getContextPath() %>/images/test3.jpg" class="d-block w-100" alt="...">
	                    <div class="maincarousel-caption carousel-caption">
	                        <h5>조용한 위로</h5>
	                        <p>삭막한 회색 도시에서 초록을 찾는 당신에게,</p>
	                    </div>
	                </div>
	                <div class="carousel-item">
	                    <img src="<%=request.getContextPath() %>/images/test1.jpg" class="d-block w-100" alt="...">
	                    <div class="maincarousel-caption carousel-caption">
	                        <h5 style="color: white; text-align: right;">곁에서 함께 햇빛을 쬐며</h5>
	                        <p style="color: white; text-align: right;"> 반려식물과 함께 시간을 보내는 주말</p>
	                    </div>
	                </div>
	                <div class="carousel-item">
	                    <img src="<%=request.getContextPath() %>/images/test2.jpg" class="d-block w-100" alt="...">
	                    <div class="maincarousel-caption carousel-caption">
	                        <h5>묵묵히 당신을 기다리는 좋은 친구</h5>
	                        <p>나의 생애 동안 함께 해주세요.</p>
	                    </div>
	                </div>
	            </div>
	            <a class="carousel-control-prev" href="#carouselECS" role="button" data-slide="prev">
	                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                <span class="sr-only">Previous</span>
	            </a>
	            <a class="carousel-control-next" href="#carouselECS" role="button" data-slide="next">
	                <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                <span class="sr-only">Next</span>
	            </a>
	        </div>
	    </div>
        <!--토스트-->
        <div class="toast" style="position: absolute; top: 300px; right: 0;" data-delay='4000'>
            <div class="toast-header">
                <strong class="mr-auto"><i class="fas fa-seedling"></i>일분일초</strong>
                <small>11 mins ago</small>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body">
                	광고처럼 보이지만...토스트입니다.<br>
                	지금 가입하면 배송비 무료!<br>
                	곧 사라집니다..걱정마시오
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('.toast').toast('show');
            });
        </script>
    </section>
    
	<div class="vbox_container">
		<div class="vbox_card vbox_card1">
			<div class="vbox">
			<div class="videoBx">
			    <video src="images/TS/Coffee.mp4" muted autoplay loop></video>
			</div>
			<div class="contentBx">
			    <div class="vbox_content">
			        <h2>바쁜 현대인들에게</h2>
			        <p>
			            하루의 시간을 가장 많이 보내고 있는 <br> 여러분의 사무실 모습은 어떠신가요?
			        </p>
			    </div>
			</div>
			</div>
		</div>
		
		<div class="vbox_card vbox_card2">
		    <div class="vbox">
		        <div class="videoBx">
		            <video src="images/TS/Flower.mp4" muted autoplay loop></video>
		        </div>
		        <div class="contentBx">
		            <div class="vbox_content">
		                <h2>나만의 작은 정원을</h2>
		                <p>
		                    무언가를 기르며 얻을 수 있는 유대감 신체와 건강<br>
		                    나만의 반려식물로 작은 정원을 가꿔 보는게 어떨 까요?
		                </p>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
    <script>
        gsap.timeline({
            scrollTrigger: {
                trigger: ".vbox_container",
                start: "center center", // 에니메이션 시작
                end: "bottom top", // 에니메이션 끝
                markers: false,
                scrub : true,
                pin : true
            }
        })
        .from(".vbox_container", { opacity : 0 })
        .from(".vbox_card1", { x : innerWidth * -1 })
        .from(".vbox_card2", { x : innerWidth * 1 })
	</script>
    
	<div class="container-fluid onecho1" style="margin-top: 100px;">
		<div class="jumbotron text-center" style="background: transparent;">
			<h1 class="display-4 onecho1_text1">일분일초</h1>
			<p class="lead onecho1_text2">하나의 화분이 당신의 시간을 바꾸어 나갈 것을 믿는 우리, CHO</p>
			<hr class="my-4 onecho1_hr">
			<p class="onecho1_text3">반려식물에 대해 궁금하신 것이 있으신가요?</p>
			<a class="btn btn-outline-info btn-lg onecho1_btn" href="<%=request.getContextPath() %>/list.qna" role="button" style="margin-top: 40px;">Learn more</a>
		</div>
	</div>
	
    <script>
        gsap.timeline({
            scrollTrigger: {
                trigger: ".onecho1",
                start: "center center", // 에니메이션 시작
                end: "bottom top", // 에니메이션 끝
                markers: false,
                scrub : true,
                pin : true
            }
        })
        .from(".onecho1_text1", { x : innerWidth * -1 })
        .from(".onecho1_text2", { x : innerWidth * 1 })
        .from(".onecho1_hr", { y : innerHeight * 1 })
        .from(".onecho1_text3", { x : innerWidth * -1 })
        .from(".onecho1_btn", { x : innerWidth * 1 })
	</script>
	
	<div class="container onechoitem1">
        <div class="scroll_box">
            <h2 class="onechoitem1_text1">기분이 좋을땐 물 위를 둥둥</h2>
            <h2 class="onechoitem1_text2">보기만 해도 행복해지는</h2>
            <h2 class="onechoitem1_text3">귀여운 마리모를 소개해드립니다.</h2>
            <img src="images/TS/mossball.png" class="onechoitem1_img">
        </div>
	</div>
	
	<script>
        gsap.timeline({
            scrollTrigger: {
                trigger: ".onechoitem1",
                start: "center center", // 에니메이션 시작
                end: "bottom top", // 에니메이션 끝
                markers: false,
                scrub : true,
                pin : true
            }
        })
        .from(".onechoitem1_text1, .onechoitem1_text2, .onechoitem1_text3", { x : innerWidth * -1 , opacity : 0  })
        .from(".onechoitem1_img", { opacity : 0 })
	</script>
	
	<div class="container onechoitem2">
        <div class="scroll_box">
            <h2 class="onechoitem2_text1">코뿔소의 뿔을 닮은</h2>
            <h2 class="onechoitem2_text2">NASA에서 인정한 공기정화와</h2>
            <h2 class="onechoitem2_text3">미세먼지에 탁월한 효과를 보여줘요</h2>
            <img src="images/TS/1279252424_L.jpg" class="onechoitem2_img">
        </div>
	</div>
	
	<script>
        gsap.timeline({
            scrollTrigger: {
                trigger: ".onechoitem2",
                start: "center center", // 에니메이션 시작
                end: "bottom top", // 에니메이션 끝
                markers: false,
                scrub : true,
                pin : true
            }
        })
        .from(".onechoitem2_text1, .onechoitem2_text2, .onechoitem2_text3", { x : innerWidth * 1 , opacity : 0  })
        .from(".onechoitem2_img", { opacity : 0 })
	</script>
	
	<!--about us로 이동하는 광고-->
	<div class="container-fluid onecho2" style="margin-top: 100px; margin-bottom: 230px; padding: 0;">
	    <div class="jumbotron text-center">
	        <h1 class="display-4 onecho2_text1">일분일초</h1>
	        <p class="lead onecho2_text2">반려 식물 입양 프로젝트</p>
	        <hr class="my-4 onecho2_hr">
	        <p class="onecho2_text3">반려식물에 대해 궁금하신 것이 있으신가요?</p>
	        <a class="btn btn-outline-info btn-lg onecho2_btn" href="<%=request.getContextPath() %>/views/aboutus/aboutUs.jsp" role="button" style="margin-top: 40px;">Learn more</a>
	    </div>
	</div>
	
	    <script>
        gsap.timeline({
            scrollTrigger: {
                trigger: ".onecho2",
                start: "center center", // 에니메이션 시작
                end: "bottom top", // 에니메이션 끝
                markers: false,
                scrub : true,
                pin : true
            }
        })
        .from(".onecho2_text1", { opacity : 0 })
        .from(".onecho2_text2", { opacity : 0 })
        .from(".onecho2_hr", { opacity : 0 })
        .from(".onecho2_text3", { opacity : 0 })
        .from(".onecho2_btn", { x : innerWidth * 1, rotate : 360 })
	</script>

<%@ include file="views/common/footer.jsp" %>
</body>
</html>