<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,review.model.vo.admin.* "%>
    
 <%
 ArrayList<AdReview> reviews=(ArrayList<AdReview>)request.getAttribute("reviews");
 %>
<!DOCTYPE html>
<html>
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

        <!--datatable-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
  	
        
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
    

.modal-body ul{
        list-style-type: none;
    }

    .modal-body ul li{
        margin-bottom: 2rem;
    }

     /*datatable css*/
     div.dataTables_wrapper {
        width: 70rem;
        margin: 0 auto;
      
    }
    
    
   


</style>

</head>
<body>

<%@include file="../common/header.jsp" %>

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
              <a class="nav-link active" href="#">
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
    
    
    <!--form 시작-->
    
    <div class="col-10">
        <h1 style="margin-top: 30px;margin-bottom: 80px;">리뷰관리</h1>
        
        <div class="row">    
            
            <form class="mx-auto" style="margin-bottom: 10rem; width: 60rem;" method="post" action="<%=request.getContextPath()%>/adminSearch.re">
                
                <table class="mx-auto" style="border: double black; width: 100%;" id="searchTable">
                        <tr>
                        <th colspan="5" style="text-align: center;height: 7rem;">검색</th>
                        
                        </tr>
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">기간</th>
                        <td>
                            <select style="position: relative;margin-left: 6px; width: 7rem;right: 9px;height: 2rem;" id="searchDate" name="searchDate">
                            	<option value="">전체</option>
                                <option value="REVIEW_CDATE">작성일</option>
                                <option value="REVIEW_UDATE">수정일</option>
                                
                            </select>
                        </td>
                        <td>
                            <button type="button" id="today" class="btn btn-outline-dark btn-sm">오늘</button>
                            <button type="button" id="aweek" class="btn btn-outline-dark btn-sm">1주일</button>
                            <button type="button" id="amonth" class="btn btn-outline-dark btn-sm">1개월</button>
                        </td>
                        <td colspan="2" style="position: relative;top:2px;"><input type="date" id="date1" name="date1"><label>~</label><input type="date" id="date2" name="date2"></td>
                        
                        </tr>
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">별점</th>
                        <td colspan="4" style="text-align: left;">
                            <input type="radio" name="rate" value="1" id="r1"><label for="r1">★</label>
                            <input type="radio" name="rate" value="2" id="r2"><label for="r2">★★</label>
                            <input type="radio" name="rate" value="3" id="r3"><label for="r3">★★★</label>
                            <input type="radio" name="rate" value="4" id="r4"><label for="r4">★★★★</label>
                            <input type="radio" name="rate" value="5" id="r5"><label for="r5">★★★★★</label> 
                        </td>
                            
                            
                        </tr>
                        <tr>
                            
                            <td colspan="5" style="text-align: right; height: 5rem;">
                                <button type="submit" style="background-color: #1f598c;color: white;width: 7rem;" class="btn btn-dark" style="width: 7rem;margin-right: 2rem;">조회</button>
                                <button type="reset" class="btn btn-outline-dark" style="width: 7rem;margin-right: 2rem;">초기화</button>
                                
                            </td>
                                
                            </tr>
                        </table>
                    </form>
                </div>
                


        <div class="row">
       
                <div class="container" id="askBoard" style="text-align: center;">
                   
                    <div class="container mx-auto"  style="text-align: center;">
                        
                       <%if(!reviews.isEmpty()){ %> 
                        
                        <table id="reviewlist" class="display nowrap mx-auto" style="width:100%;text-align: center;">
                            <thead>
                                <tr>
                                    <th>글번호</th>                                  
                                    <th>상품명</th>
                                    <th>게시자ID</th>
                                    <th>별점</th>
                                    <th>작성일</th>
                                    <th>수정일</th>
                                    
                                </tr>
                                
                            </thead>
                            <tbody>
                            
                            <%if(!reviews.isEmpty()){ %>
                            	<%for(int i=0;i<reviews.size();i++){
                            		
                            		
                            		%>
                            	
                            	
                            	
                                <tr>

                                    <td><%=reviews.get(i).getReviewNo()%></td>
                                    <td><%=reviews.get(i).getItemName() %></td>
                                    <td><%=reviews.get(i).getMemberId() %></td>
                                    <td><%=reviews.get(i).getReviewRate() %></td>
                                    <td><%=reviews.get(i).getReviewCDate()%></td>
                                    <td><%=reviews.get(i).getReviewUDate()%></td>
                                    
                                </tr>
                                <%} %>
                             <%} %> 
                            </tbody>
                            
                            
                        </table>
						<%}else{ %>
						
							<div class="mx-auto" style="text-align:center;width:60rem;height:20rem; background:lightgray;">
         
                       		<p style="padding-top:8rem;">검색 결과가 존재하지 않아요.<br><br>
                       		<button type="button" class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/adminList.re'">새로고침</button></p>
                       		
                      
                       		</div>
						
						<%} %>
                        
                    </div>  
                        
                        
                
            	 </div>
               
                    <!--제품 상세 내용 Modal-->
                    
                    <!-- The Modal -->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">REVIEW</h4>
                            
                            <button type="button" class="close" data-dismiss="modal" id="modalClose">&times;</button>
                            </div>
                    
                            <!-- Modal body -->
                            <div class="modal-body">
                            
                                
                                <ul style="padding: 0;">
                                	<li><label>리뷰번호</label><br><input class="form-control" type="text" readonly id="Rnum" name="RNum" style="width:100%;"></li>
                                	<li><label>작성자</label><br><input class="form-control" type="text" readonly id="Rwriter" name="RWriter" style="width:100%;"></li>
                                    <li><label>작성일</label><br><input class="form-control" type="date" readonly id="RDdate" style="width: 100%;"></li>
                                    <li><label>수정일</label><br><input class="form-control" type="date" readonly id="RUdate" style="width: 100%;"></li>
                                    <li><label>내용</label><br><input class="form-control" type="text" readonly id="review" name="review" style="width: 100%;"></li>
                                    <li><label>이미지</label><br><img id="RImg" name="RImg" width=100% height=500px></li>
                                   
                                    
                                </ul>    
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            
                            <%if(adminChk.equals("Y")){ %>
                            <button type="button" class="btn btn-outline-danger" onclick="deleteReview();">리뷰삭제</button>
                            
                            <%} %>
                            
                            </div>
                    
                           
                        </div>
                        </div>
                    </div>
                   
               
    </div>

 
       
</div>
</div>




</div>


<div class="container-fluid" >
    <div class="jumbotron text-center" style="background-image:url('<%=request.getContextPath()%>/images/admin/head.jpg'); margin-top:100px;height: 300px;">
        
    </div>
</div>


<!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>




 
 <!-- dataTable -->
 <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/r-2.2.5/sc-2.0.2/datatables.min.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.3.1/js/dataTables.fixedColumns.min.js"></script>
 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
 
	
 
 <script>
     $(document).ready(function(){
    	 
    	 
    	$('#reviewlist thead tr').clone(true).appendTo('#reviewlist thead');
      	$('#reviewlist thead tr:eq(1) th').each(function(i){
      		
 			var title=$(this).text();
      		
      		if(title!=""){
      		
      		$(this).html('<input type="text" placeholder="search '+title+'"/>');
      		
      		$('input',this).on('keyup change',function(){
      			
      			if(table.column(i).search()!==this.value){
      					table
      					.column(i)
      					.search(this.value)
      					.draw();
      			}
      			
      		});
      		
      		}
      		
      	}); 
    	 
    	 
    	 
    	 
         $('#reviewlist').DataTable({
        	 orderCellsTop:true,
 	   		fixedHeader:true,
 	   		scrollX:true
         });
         
         
         
         
         
         var rows=$("#reviewlist").children().children()
          
         
         for(var i=0;i<rows.length;i++){
             
             if(i>0&&i<=(rows.length-1)){
                 
                 console.log(i);
                 rows.eq(i).attr({"data-toggle":"modal","data-target":"#myModal"});
                 
                }
            }
            
            
            rows.click(function(){
            	   

            		var RNum=$(this).children().eq(0).text();
                    
                    
					<%for(int i=0;i<reviews.size();i++){%>
                    
                    if(RNum=='<%=reviews.get(i).getReviewNo()%>'){
                    	
                    $("#Rnum").val('<%=reviews.get(i).getReviewNo()%>');
                    $("#Rwriter").val('<%=reviews.get(i).getMemberId()%>');
                    $("#review").val('<%=reviews.get(i).getReviewContent()%>');
                    $("#RCdate").val('<%=reviews.get(i).getReviewCDate()%>');
                    $("#RUdate").val('<%=reviews.get(i).getReviewUDate()%>');
                    $("#RImg").attr('src','<%=request.getContextPath()%>/review_uploadFiles/<%=reviews.get(i).getReviewImgName()%>');
                    
                  
                    }
                    
                   
                    <%}%>

                    
                
  
                
            });


            
            
        });
        
        
        </script>
       
        <!--모달에서 수정/삭제 시 서버로 값 넘기기-->
        <script>
            
        
        </script>


        <!--date 관련-->
        <script>

            $(function(){
            	
            	var date= new Date();
                var month=date.getMonth()+1;
                var day=date.getDate();
                var today=date.getFullYear()+"-"+(month<10? '0':'')+month+"-"+(day<10? '0':'')+day;

                $("#today").click(function(){

                    
                    
                    $("#date1").val(today);
                    $("#date2").val(today);

                   
                })


                $("#aweek").click(function(){

                    var date=new Date();
                    date.setDate(date.getDate()-7);
                    var month=date.getMonth()+1;
                    var day=date.getDate();
                    var aweek=date.getFullYear()+"-"+(month<10? '0':'')+month+"-"+(day<10? '0':'')+day;
                    

                    
                    $("#date1").val(aweek);
                    $("#date2").val(today);

                })

                $("#amonth").click(function(){

                    var date=new Date();
                    date.setMonth(date.getMonth()-1);
                    var month=date.getMonth()+1;
                    var day=date.getDate();
                    var amonth=date.getFullYear()+"-"+(month<10? '0':'')+month+"-"+(day<10? '0':'')+day;

                    $("#date1").val(amonth);
                    $("#date2").val(today);

                    
                })


                
            })
       
        </script>
        <script>
        	
        	function deleteReview(){
        		
        		alert("고객이 작성한 소중한 리뷰를 지우기 전에 신중하게 생각해보자.");
        		
        	}
        
        </script>
        
        <%@ include file="../common/footer.jsp" %>

</body>
</html>