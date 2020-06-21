<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,Board.model.vo.* "%>
    
 <%
 ArrayList<Notice> notices=(ArrayList<Notice>)request.getAttribute("notices");
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
        <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath() %>/images/logo.png">
        <title>Cho-당신을 위한 반려식물</title>
       
         <!--icon-->
        <script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

        <!--datatable-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
  	
        
        <!--jQuery-->
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>

        <!-- include summernote css/js -->
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
       
  


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
    
    
    <!--form 시작-->
    
    <div class="col-10">
        <h1 style="margin-top: 30px;margin-bottom: 80px;">공지사항 관리</h1>
        
       
                

        <div class="row">
       
                 <div class="container" id="noticeBoard" style="text-align: center;">
                   
                    <div class="container mx-auto"  style="text-align: center;">
                        
                        <%if(!notices.isEmpty()){ %>
                        <table id="noticelist" class="display nowrap mx-auto" style="width:100%;text-align: center;">
                            <thead>
                                <tr>
                                    <th>글번호</th>
                                    <th>제목</th>
                                    <th>게시자ID</th>
                                    <th>작성일</th>
                                    
                                    
                                </tr>
                                
                            </thead>
                            <tbody>
                            
                            <%if(!notices.isEmpty()){ %>
                            	<%for(int i=0;i<notices.size();i++){
                            		
                            		
                            		
                            		%>
                            	
                            	
                            	
                                <tr>

                                    <td><%=notices.get(i).getNoticeNo() %></td>
                                    <td><%=notices.get(i).getNoticeTitle() %></td>
                                    <td><%=notices.get(i).getMemberId() %></td>
                                    <td><%=notices.get(i).getNoticeCDate() %></td>
                                   
                                    
                                </tr>
                                <%} %>
                             <%} %> 
                            </tbody>
                            
                            
                        </table>
						<%}else{ %>
							<div class="container">
                       		<div class="mx-auto" style="text-align:center;width:60rem;height:20rem; background:lightgray;">
         
                       		<p style="padding-top:8rem;">공지사항이 존재하지 않아요.<br><br>
                       		<button type="button" class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/adminList.no'">새로고침</button></p>
                       		
                      
                       		</div>
                       		</div>
						
						<%} %>
                        
                    </div>  
                    
                    
       
        </div>
        
        <div class="container">
        
        	<div class="container mx-auto" id="composeN" style="margin-top: 50px;">
                     <form method="post" action="<%=request.getContextPath()%>/insert.no">

                        <ul style="list-style-type: none;padding: 0;width: 100%;">
                        	<li><input type="hidden" name="noticeWriter" id="noticeWriter" value="<%=loginUser.getMemberNo()%>"></li>
                            <li style="margin-top:20px;"><label>제목</label><br><input name="newNoticeTitle" type="text" style="width: 100%;"></li>
                         </ul>
                        
                          <textarea id="Nsummernote" name="Neditordata"></textarea>
                         	

                         <button type="submit" class="btn btn-outline-info btn-lg btn-block" style="margin-top: 50px;" id="ask">작성하기</button>
                       </form>
                     </div>
        
        </div>
               
                   <!--Notice 상세 내용 Modal-->
                    
                    <!-- The Modal -->
                    <div class="modal" id="noticeModal">
                        <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                    
                   <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">공지사항</h4>
                            
                            <button type="button" class="close" data-dismiss="modal" id="modalClose">&times;</button>
                            </div>
                    
                            <!-- Modal body -->
                            <div class="modal-body">
                            <form method="post" action="<%=request.getContextPath()%>/adminUpdate.no">

                                
                                <ul style="padding: 0;">
                                	
                                	<input type="hidden" name="writer" id="writer">
                                	<li><label>글번호</label><br><input class="form-control" readonly type="text" id="noticeNum" name="noticeNum" style="width: 100%;"></li>
                                    <li><label>작성일</label><br><input class="form-control" type="date" readonly id="Ndate" style="width: 100%;"></li>
                                    <li><label>제목</label><br><input class="form-control" type="text"  id="Ntitle" name="Ntitle" style="width: 100%;"></li>
                                    <li><label>내용</label><br>
                                    <div id="notice" readonly style="width: 100%;border:1px solid lightgrey;"></div>
                                    <textarea id="summernote" name="editordata"></textarea>
                                    </li>
                                   
                                    
                                </ul>    
                           
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            
                            <%if(adminChk.equals("Y")){ %>
                            <button type="button" class="btn btn-outline-success" onclick="resetNotice();">리셋하기</button>
                            <button type="submit" class="btn btn-outline-success">수정하기</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deleteNotice();">삭제하기</button>
                            <%} %>
                            
                            </div>
                     </form>
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


<!--summerNote-->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             
            maxHeight: null,             
            focus: true   

        });
        
        
        $('#Nsummernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             
            maxHeight: null,             
            focus: true   

        });
    });
</script>

 
 <!-- dataTable -->
 <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/r-2.2.5/sc-2.0.2/datatables.min.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.3.1/js/dataTables.fixedColumns.min.js"></script>
 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
 
	
 
 <script>
     $(document).ready(function(){
    	 
    	<%if(loginUser != null){%>
    		var loginAdmin='<%=loginUser.getMemberNo()%>'
    		
    		$("#writer").val(loginAdmin);
    		
    	 <%}%>
    	 
    	$('#noticelist thead tr').clone(true).appendTo('#noticelist thead');
       	$('#noticelist thead tr:eq(1) th').each(function(i){
       		
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
     	 
     	 
     	$('#noticelist').DataTable({
     	       
      	   
     	  	orderCellsTop:true,
  	   		fixedHeader:true,
  	   		
  	   		
          	
           });
     	
     	
     	
     	 //공지사항에 모달 토글 달기
		var nrows=$("#noticelist").children().children()
          
         
         for(var i=0;i<nrows.length;i++){
             
             if(i>0&&i<=(nrows.length-1)){
                 
                 console.log(i);
                 nrows.eq(i).attr({"data-toggle":"modal","data-target":"#noticeModal"});
                 
                }
            }
         
         
         	nrows.click(function(){
         		
         		var noticeNum=$(this).children().eq(0).text();
         		
         		<%for(int i=0;i<notices.size();i++){%>
         		
         		if(noticeNum=='<%=notices.get(i).getNoticeNo()%>'){
         			
         			$("#noticeNum").val('<%=notices.get(i).getNoticeNo()%>');
         			$("#Ndate").val('<%=notices.get(i).getNoticeCDate()%>');
         			$("#Ntitle").val('<%=notices.get(i).getNoticeTitle()%>');
         			
         			var usedContent='<%=notices.get(i).getNoticeContent()%>';
         			$("#summernote").summernote('code',usedContent);
         			
         			
         			
         		}
         		
         		
         		<%}%>
         		
         		
         	});
     	
     	
     	
     	
     	
    	
                    
                
  
                
            });


            
            
    
        
        
        </script>
       
        <!--모달에서 수정/삭제 시 서버로 값 넘기기-->
        <script>
        
        	function resetNotice(){
        		
        		var reNoNum=$("#noticeNum").val();
        		
        		<%for(int i=0;i<notices.size();i++){%>
        		
        		if(reNoNum=='<%=notices.get(i).getNoticeNo()%>'){
        			
					$("#Ntitle").val('<%=notices.get(i).getNoticeTitle()%>');
         			
         			var usedContent='<%=notices.get(i).getNoticeContent()%>';
         			$("#summernote").summernote('code',usedContent);
        			
        			
        		}
        		
        		<%}%>
        		
        		
        	}
        
        
        </script>
        <script>
        
        	function deleteNotice(){
        		
        		var delAgree=confirm("정말 삭제하시겠어요?");
        		
        		var delNoNum=$("#noticeNum").val();
        		
        		if(delAgree){
        			
        			location.href="<%=request.getContextPath()%>/adminDelete.no?noticeNum="+delNoNum;
        			
        		}
        	}
        
        </script>
       


        
        <%@ include file="../common/footer.jsp" %>

</body>
</html>