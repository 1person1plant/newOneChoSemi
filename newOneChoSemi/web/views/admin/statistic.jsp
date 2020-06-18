<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>

  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!--title icon-->
    <link rel="shortcut icon" type="image⁄x-icon" href="img_main/logo.png">
    <title>Cho-당신을 위한 반려식물</title>
    
    <!--icon-->
    <script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

    
    <!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   
   <style>
   
   /* font 추가*/
    @font-face {
      font-family: 'basicFont';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }

    /* font 적용할 때는 아래와 같이*/
    * {
      font-family: "basicFont";
    }


  </style>


</head>

<body>

	<%@include file="../common/header.jsp" %>
 
 
 
  <section>
    
    <!--내용 시작-->
	
	<div class="container-fluid">
      <div class="row">


        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
  
              <h3 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                  <span>ADMIN</span>
                  <a class="d-flex align-items-center text-muted" href="#">
                    <span data-feather="plus-circle"></span>
                  </a>
                </h3>
  
                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                  <span><i class="fas fa-gifts"></i>상품관리</span>
                  <a class="d-flex align-items-center text-muted" href="#">
                    <span data-feather="plus-circle"></span>
                  </a>
                </h6>
  
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="#" onclick="location.href='<%=request.getContextPath()%>/views/admin/itemInsertForm.jsp'">
                  <span data-feather="home"></span>
                  	상품등록 <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#" onclick="location.href='<%=request.getContextPath()%>/list.it'">
                  <span data-feather="file"></span>
                  	상품조회/수정
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#" onclick="location.href='<%=request.getContextPath()%>/stock.it'">
                  <span data-feather="shopping-cart"></span>
                  	재고관리
                </a>
              </li>
              
            </ul>
    
            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span><i class="fas fa-money-check-alt"></i>판매관리</span>
              <a class="d-flex align-items-center text-muted" href="#">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
  
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="#" onclick="location.href='<%=request.getContextPath()%>/adminList.or'">
                  <span data-feather="file-text"></span>
                 	 주문내역 조회
                </a>
              </li>
            </ul>
  
            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span><i class="fas fa-users"></i>고객관리</span>
              <a class="d-flex align-items-center text-muted" href="#">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
  
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="#" onclick="location.href='<%=request.getContextPath()%>/adminList.me'">
                  <span data-feather="file-text"></span>
                 	 고객계정 관리
                </a>
              </li>
            </ul>
  
            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span><i class="far fa-question-circle"></i>고객센터</span>
              <a class="d-flex align-items-center text-muted" href="#">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
  
           <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="#" onclick="location.href='<%=request.getContextPath()%>/adminList.re'">
              <span data-feather="home"></span>
              	리뷰관리 <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" onclick="location.href='<%=request.getContextPath()%>/adminList.qna'">
              <span data-feather="file"></span>
              Q&A
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" onclick="location.href='<%=request.getContextPath()%>/adminList.no'">
              <span data-feather="shopping-cart"></span>
             	 공지사항
            </a>
          </li>
          
        </ul>
          </div>
        </nav>

          <!--vertical nav 끝-->
 


          

			
				

        	


    </div>
   	</div>
   
   
 	<!--내용 끝  -->
    <div class="container-fluid">
      <div class="jumbotron text-center" style="background-image:url('<%=request.getContextPath() %>/images/admin/head.jpg'); height: 300px;">
        
      </div>
    </div>



  </section>
  
    
  
     
    
     <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.1.1.min.js">
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>

 

  <%@ include file="../common/footer.jsp" %>
  
 

    
 
    
   

</body>
</html>