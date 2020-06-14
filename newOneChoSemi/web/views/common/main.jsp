<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

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

    <!-- main css -->
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
    
        /* 상품 card start */
        .new-item .card,
        .best-item .card {
            margin: auto;
            margin-bottom: .5rem;
        }
    
        .item-row {
            margin-left: 5rem;
            margin-right: 5rem;
        }
        /* 상품 card end */
    </style>
</head>
<body>
    <header>

    </header>
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
        <!--best item-->
        <div class="container-fluid best-item">
            <h2 class="text-center display-4" style="margin: 100px;">BEST</h2>
            <div class="item-row row">
                <div class="col-sm">
                    <div class="card" style="width: 18rem;">
                        <img src="<%=request.getContextPath() %>/images/고무나무.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-title">고무나무</p>
                            <p class="card-text">48,000원</p>
                            <a href="#" class="btn btn-outline-info float-right">VIEW DETAIL</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card" style="width: 18rem;">
                        <img src="<%=request.getContextPath() %>/images/고무나무.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-title">고무나무</p>
                            <p class="card-text">48,000원</p>
                            <a href="#" class="btn btn-outline-info float-right">VIEW DETAIL</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card" style="width: 18rem;">
                        <img src="<%=request.getContextPath() %>/images/고무나무.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-title">고무나무</p>
                            <p class="card-text">48,000원</p>
                            <a href="#" class="btn btn-outline-info float-right">VIEW DETAIL</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card" style="width: 18rem;">
                        <img src="<%=request.getContextPath() %>/images/고무나무.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-title">고무나무</p>
                            <p class="card-text">48,000원</p>
                            <a href="#" class="btn btn-outline-info float-right">VIEW DETAIL</a>
                        </div>
                    </div>
                </div>
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
    
        <div class="container-fluid" style="margin-top: 100px;">
            <div class="jumbotron text-center" style="background: transparent;">
                <h1 class="display-4">일분일초</h1>
                <p class="lead">하나의 화분이 당신의 시간을 바꾸어 나갈 것을 믿는 우리, CHO</p>
                <hr class="my-4">
                <p>반려식물에 대해 궁금하신 것이 있으신가요?</p>
                <a class="btn btn-outline-info btn-lg" href="<%=request.getContextPath() %>/views/aboutus/aboutUs.jsp" role="button" style="margin-top: 40px;">Learn
                    more</a>
            </div>
        </div>
    
        <!--new item-->
        <div class="container-fluid new-item">
            <h2 class="text-center display-4" style="margin: 100px;">NEW</h2>
            <div class="item-row row">
                <div class="col-sm">
                    <div class="card" style="width: 18rem;">
                        <img src="<%=request.getContextPath() %>/images/고무나무.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-title">고무나무</p>
                            <p class="card-text">48,000원</p>
                            <a href="#" class="btn btn-outline-info float-right">VIEW DETAIL</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card" style="width: 18rem;">
                        <img src="<%=request.getContextPath() %>/images/고무나무.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-title">고무나무</p>
                            <p class="card-text">48,000원</p>
                            <a href="#" class="btn btn-outline-info float-right">VIEW DETAIL</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card" style="width: 18rem;">
                        <img src="<%=request.getContextPath() %>/images/고무나무.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-title">고무나무</p>
                            <p class="card-text">48,000원</p>
                            <a href="#" class="btn btn-outline-info float-right">VIEW DETAIL</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card" style="width: 18rem;">
                        <img src="<%=request.getContextPath() %>/images/고무나무.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-title">고무나무</p>
                            <p class="card-text">48,000원</p>
                            <a href="#" class="btn btn-outline-info float-right">VIEW DETAIL</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <!--about us로 이동하는 광고-->
        <div class="container-fluid" style="margin-top: 100px;">
            <div class="jumbotron text-center" style="background-image:'<%=request.getContextPath() %>/images/test4.jpg';">
                <h1 class="display-4">일분일초</h1>
                <p class="lead">하나의 화분이 당신의 시간을 바꾸어 나갈 것을 믿는 우리, CHO</p>
                <hr class="my-4">
                <p>반려식물에 대해 궁금하신 것이 있으신가요?</p>
                <a class="btn btn-outline-info btn-lg" href="<%=request.getContextPath() %>/views/aboutus/aboutUs.jsp" role="button" style="margin-top: 40px;">Learn more</a>
            </div>
        </div>
    </section>
</body>
</html>