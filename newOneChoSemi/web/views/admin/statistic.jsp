<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,statistic.model.vo.* "%>
    
    
 <%
 ArrayList<Statistic> sales=(ArrayList<Statistic>)request.getAttribute("sales"); 
 Statistic stat=(Statistic)request.getAttribute("stat");
 	%>
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
    
   
   <!-- Custom fonts for this template-->
 
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  
   
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
        </nav>

          <!--vertical nav 끝-->
 
		 <div class="col-10">
		<div class="container" style="margin-top:100px">
		
		 <div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
		
		
		</div>
          
          <script>
        window.onload = function () {



            var options = {
                title: {
                    text: "MONTHLY"
                },
                axisX: {
            		valueFormatString: "DD MMM,YY"
            	},
            	axisY: {
            		title: "매출 (in 원)",
            		includeZero: false,
            		suffix: " 원"
            	},
                animationEnabled: true,
                exportEnabled: true,
                data: [
                {
                    type: "spline", //change it to line, area, column, pie, etc
                    dataPoints: [
                    	
                    	<%for(int i=0;i<sales.size();i++){
                    		
                    		String day=sales.get(i).getOrderDate();
                    		String year=day.substring(0, 4);
                    		String month=day.substring(5, 7);
                    		String date=day.substring(8,10);
                    	%>
                    	
                    	<%if(i!=sales.size()-1){%>
                    	
                    		
                    	
                    		{x:new Date(<%=year%>,<%=month%>,<%=date%>),y:<%=sales.get(i).getSales()%>},
                    		
                 
                    	
                    	<%}else{%>
                    	
                    		{x:new Date(<%=year%>,<%=month%>,<%=date%>),y:<%=sales.get(i).getSales()%>}
                    	
                    	<%}%>
                    	 
                        <%}%>
                    ]
                }
                ]
            };
            $("#chartContainer").CanvasJSChart(options);
             

           
        }
        </script>

			
		<div class="container">
			 <div class="row justify-content-center align-self-center " style="margin-top:100px;">

            

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">DAILY SALE</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=stat.getNewSale() %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

           

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">WEEKLY SALE</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=stat.getWeekSale() %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">MONTHLY SALE</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=stat.getAmonthSale() %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="row justify-content-center align-self-center" >


            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">오늘 방문자 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=stat.getNewVisit() %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa fa-user fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
              <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">신규 가입 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=stat.getNewMember() %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa fa-user fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
             
          <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">전체 멤버 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=stat.getAllMember() %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa fa-user fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
            
            
            
      
         
            
            
            
         
          
        
          
          
          <div class="row justify-content-center align-self-center" >

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">배송전 상품</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=stat.getdBefore() %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa fa-shopping-cart fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">주문 취소 요청</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=stat.getCancel() %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa fa-shopping-cart fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
           	<!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">신규 주문 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=stat.getNewOrder() %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa fa-shopping-cart fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
               
          </div>
          
          
          <div class="row justify-content-center align-self-center" >

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">신규 질문 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=stat.getNewQna() %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa fa-question fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">미답변 질문</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=stat.getUnAnsw() %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa fa-question fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">준비중</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa fa-exclamation-triangle fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

           
			
		</div>
			
			
		</div>	
			
			
			
				
		</div>
        	


    </div>
   	</div>
   
   
 	<!--내용 끝  -->
    <div class="container-fluid" style="margin-top:100px;">
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
    
    
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
       


        <script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
        <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

 

  <%@ include file="../common/footer.jsp" %>
  
 

    
 
    
   

</body>
</html>