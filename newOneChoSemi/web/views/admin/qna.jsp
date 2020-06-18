<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,Board.model.vo.* "%>
    
    
 <%
 ArrayList<Qna> qnas=(ArrayList<Qna>)request.getAttribute("qnas");
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
        <link rel="shortcut icon" type="image⁄x-icon" href="img_main/logo.png">
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

<section>

<div class="container-fluid">

	
    
    <h1 style="margin-top: 50px; margin-left: 100px;">Q&A</h1>
    <div class="row">
      
       
    

    
    <div class="col-12">
        <h3 style="margin-top: 30px;margin-bottom: 80px;margin-left: 100px;"">소중한 고객님의 목소리를 듣습니다.</h3>
        
        <div class="container">
        
        
        <div class="btn-group btn-group-toggle btn-lg btn-block" data-toggle="buttons" style="margin:100px 0;">
  		<label class="btn btn-outline-info active">
    	<input type="radio" id="showFrequentQ" onclick="showBoard(1);" autocomplete="off" checked> 자주 하는 질문 
  		</label>
  		<label class="btn btn-outline-info">
    	<input type="radio" id="showAskBoard" onclick="showBoard(2);" autocomplete="off"> 질문 게시판
  		</label>
  		<label class="btn btn-outline-info">
    	<input type="radio" id="showComposeQ" onclick="showBoard(3);" autocomplete="off"> 질문 작성하기
  		</label>
  		<label class="btn btn-outline-info">
    	<input type="radio" id="showNotice" onclick="showBoard(4);" autocomplete="off"> 공지사항
  		</label>
		</div>
        
        </div>
        
        
		
		
        
        <div class="row">
       
        <div class="container"  id="frequentQ">
        
		  <div class="accordion" id="qnaAccordion">
		  <div class="card">
		    <div class="card-header" id="heading1" data-toggle="collapse" data-target="#collapse1">
		      <h2 class="mb-0">
		        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse1" aria-expanded="false" aria-controls="collapseOne">
		          	배송받는 데에 얼마나 걸릴까요?
		        </button>
		      </h2>
		    </div>
		
		    <div id="collapse1" class="collapse" aria-labelledby="heading1" data-parent="#qnaAccordion">
		      <div class="card-body">
		          	배송 지역에 따라서 조금씩 차이는 있을 수 있지만 보통 2-3일 정도 소요됩니다.
		          	반려식물의 건강에 문제가 있는 경우, 건강한 아이를 수급하는 데에 시간이 조금 걸릴 수 있습니다.
		          	그런 경우에는 고객님께 개인적으로 연락을 드리고 있답니다. 기다려 주셔서 감사합니다.
		      </div>
		    </div>
		  </div>
		  <div class="card">
		    <div class="card-header" id="heading2" data-toggle="collapse" data-target="#collapse2">
		      <h2 class="mb-0">
		        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapseTwo">
		          	교환이나 환불이 가능한가요?
		        </button>
		      </h2>
		    </div>
		    <div id="collapse2" class="collapse" aria-labelledby="heading2" data-parent="#qnaAccordion">
		      <div class="card-body">
		       		죄송합니다 고객님, 저희 일분일초는 원칙적으로 교환/환불을 해드리지 않습니다.
		       		반려식물을 들인다는 것은 친구, 가족을 만나는 것과 다르지 않다고 저희는 믿고 있습니다.
		       		고객님께서 만족하실 수 있는 최상의 품질을 보장하기 위하여 더욱 꼼꼼하게 검수하겠습니다.
		      </div>
		    </div>
		  </div>
		  <div class="card">
		    <div class="card-header" id="heading3" data-toggle="collapse" data-target="#collapse3">
		      <h2 class="mb-0">
		        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapseThree">
		          	가격대가 비싼 것 같아요.
		        </button>
		      </h2>
		    </div>
		    <div id="collapse3" class="collapse" aria-labelledby="heading3" data-parent="#qnaAccordion">
		      <div class="card-body">
		         	심려를 끼쳐 죄송합니다 고객님, 저희 일분일초는 일관된 품질을 유지하기 위해 소품종 소량생산 체제를 유지하고 있습니다. 
		         	때문에 다소 높은 가격대의 상품들이 많은 것은 사실입니다. 그러나 지불하시는 비용이 아깝지 않은 품질로 보답하는 일분일초가 되겠습니다.
		      </div>
		    </div>
		  </div>
		  <div class="card">
		    <div class="card-header" id="heading4" data-toggle="collapse" data-target="#collapse4">
		      <h2 class="mb-0">
		        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse4" aria-expanded="false" aria-controls="collapseOne">
		         	식물을 키워본 적이 없는데 잘 키울 수 있을까요?
		        </button>
		      </h2>
		    </div>
		
		    <div id="collapse4" class="collapse" aria-labelledby="heading4" data-parent="#qnaAccordion">
		      <div class="card-body">
		      	걱정하지마세요 고객님, 반려 식물은 관리하기 어렵다는 인식이 있지만 비교적 까다롭지 않은 아이들도 많습니다.
		      	반려 식물에 익숙하지 않아 걱정이 되신다면 상대적으로 손이 덜 가는 아이들인 다육이나 스투키를 키워보실 것을 추천드립니다^_^
		    </div>
		  </div>
		  <div class="card">
		    <div class="card-header" id="heading5" data-toggle="collapse" data-target="#collapse5">
		      <h2 class="mb-0">
		        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse5" aria-expanded="false" aria-controls="collapseOne">
		          	반려 식물이 아픈 것 같을 때에는 어떻게 해야하나요?
		        </button>
		      </h2>
		    </div>
		
		    <div id="collapse5" class="collapse" aria-labelledby="heading5" data-parent="#qnaAccordion">
		      <div class="card-body">
		       	아픈 아이 때문에 걱정이 많으셨죠. 대표전화 혹은 온라인으로 아이의 건강에 대해 문의 주시면 아이가 건강해질 수 있는 방법을 찾기 위해 저희 일분 일초가 최선을 다하겠습니다. 
		      </div>
		    </div>
		  </div>
		</div>
        </div>
        <!-- 아코디언 끝 -->
        
       </div>
       
       
       <div class="container" id="noticeBoard" style="display:none;text-align: center;">
                   
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
                        
                        	<div class="mx-auto" style="text-align:center;width:60rem;height:20rem; background:lightgray;">
         
                       		<p style="padding-top:8rem;">공지사항 준비중!<br><br>
                       		<button class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">메인으로</button></p>
                       		
                      
                       		</div>
                        <%} %>
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
                            <form>

                                
                                <ul style="padding: 0;">
                                	
                                	<input type="hidden" id="noticeNum">
                                    
                                    <li><label>작성일</label><br><input class="form-control" type="date" readonly id="Ndate" style="width: 100%;"></li>
                                    <li><label>제목</label><br><input class="form-control" type="text" readonly id="Ntitle" style="width: 100%;"></li>
                                    <li><label>내용</label><br><div id="notice" readonly style="width: 100%;border:1px solid lightgrey;"></div></li>
                                   
                                    
                                </ul>    
                            </form>
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            
                            <%if(adminChk.equals("Y")){ %>
                            <button type="button" class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/adminList.no'">수정하기</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deleteNotice();">삭제하기</button>
                            <%} %>
                            
                            </div>
                    
                        </div>
                        </div>
                    </div>
                   
       
       
       
        
        
               
        		
                <div class="container" id="askBoard" style="display:none;text-align: center;">
                   
                    <div class="container mx-auto"  style="text-align: center;">
                         <%if(!qnas.isEmpty()){ %>
                        <table id="qnalist" class="display nowrap mx-auto" style="width:100%;text-align: center;">
                            <thead>
                                <tr>
                                    <th>글번호</th>
                                    <th>분류</th>
                                    <th>제목</th>
                                    <th>게시자ID</th>
                                    <th>작성일</th>
                                    <th>답변상태</th>
                                    
                                </tr>
                                
                            </thead>
                            <tbody>
                            
                            <%if(!qnas.isEmpty()){ %>
                            	<%for(int i=0;i<qnas.size();i++){
                            		
                            		String answer=qnas.get(i).getQnaYN();
                            		switch(answer){
                            		case "Y":answer="답변완료";break;
                            		case "N":answer="미답변";break;
                            		}
                            		
                            		
                            		%>
                            	
                            	
                            	
                                <tr>

                                    <td><%=qnas.get(i).getQnaNo() %></td>
                                    <td><%=qnas.get(i).getQnaCategory() %></td>
                                    <td><%=qnas.get(i).getQnaTitle() %></td>
                                    <td><%=qnas.get(i).getMemberId() %></td>
                                    <td><%=qnas.get(i).getQnaCDate() %></td>
                                    <td><%=answer%></td>
                                    
                                </tr>
                                <%} %>
                             <%} %> 
                            </tbody>
                            
                            
                        </table>

                        <%}else{ %>
                        
                       		 <div class="mx-auto" style="text-align:center;width:60rem;height:20rem; background:lightgray;">
         
                       		<p style="padding-top:8rem;">질문 게시판 준비중!<br><br>
                       		<button class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">메인으로</button></p>
                       		
                      
                       		</div>
                        
                        <%} %>
                    </div>  
                        
                        
                
            	 </div>
               
                    <!--QNA 상세 내용 Modal-->
                    
                    <!-- The Modal -->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">Q&A</h4>
                            
                            <button type="button" class="close" data-dismiss="modal" id="modalClose">&times;</button>
                            </div>
                    
                            <!-- Modal body -->
                            <div class="modal-body">
                            <form>

                                
                                <ul style="padding: 0;">
                                	<input type="hidden" id="writer" name="writer">
                                	<input type="hidden" id="questionNum">
                                    <li><label>분류</label><br><input class="form-control" type="text" readonly id="Qcategory" style="width: 100%;"></li>
                                    <li><label>작성일</label><br><input class="form-control" type="date" readonly id="Qdate" style="width: 100%;"></li>
                                    <li><label>제목</label><br><input class="form-control" type="text" readonly id="Qtitle" style="width: 100%;"></li>
                                    <li><label>문의내용</label><br><div id="question" readonly style="width: 100%;border:1px solid lightgrey;"></div></li>
                                    <li><label>답변내용</label><br><div id="answer" readonly style="width: 100%;border:1px solid lightgrey;"></div></li>
                                    
                                </ul>    
                            </form>
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            
                            <%if(adminChk.equals("Y")){ %>
                            <button type="button" class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath()%>/adminList.qna'">답변하기</button>
                            <%} %>
                            
                            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deleteConfirm();">삭제하기</button>
                            </div>
                    
                        </div>
                        </div>
                    </div>
                   
               
        
        
        
                 
                 
              
             
                     <div class="container mx-auto" id="composeQ" style=" display:none;margin-top: 50px;">
                     <form method="post" action="<%=request.getContextPath()%>/insert.qna" onsubmit="return qnaValidate();">

                        <ul style="list-style-type: none;padding: 0;width: 100%;">
                        	<input type="hidden" id="qnaMemberNo" name="qnaMemberNo">
                            <li><label>분류</label><br>
                            <select style="height: 30px;" name="category"> 
                                <option value="상품문의">상품문의</option>
                                <option value="배송문의">배송문의</option>
                                <option value="취소문의">취소문의</option>
                            </select>
                            </li>
                            <li style="margin-top:20px;"><label>비밀번호</label></li>
                            <li>
                            <input type="password" id="qnaPwd" name="password" maxlength="4" pattern="[0-9]*" placeholder="4자리의 숫자를 입력하세요" style="width: 20%;">
                            <div id="pwdChk" style="font-size: 10px;display: none;">숫자인가요?</div>
                            </li>
                            <li style="margin-top:20px;"><label>제목</label><br><input name="title" type="text" style="width: 100%;"></li>
                         </ul>
                        
                          <textarea id="summernote" name="editordata"></textarea>
                         	

                         <button type="submit" class="btn btn-outline-info btn-lg btn-block" style="margin-top: 50px;" id="ask">문의하기</button>
                       </form>
                     </div>
        
                  
                    <script>

                        $(function(){

                            $("#qnaPwd").change(function(){

                                var regExp=/^[0-9]{4}$/;

                                if(regExp.test($("#qnaPwd").val())){
                                    $("#pwdChk").css("display","none");
                                    
                                    
                                }else{
                                    $("#pwdChk").css("display","block");
                                    $("#qnaPwd").val("");

                                }



                            })

                        })

                    </script>

   
        
    </div>
    </div>

</div>



<div class="container-fluid" style="margin-top: 100px;">
<div class="jumbotron text-center" style="background-image:url('<%=request.getContextPath()%>/images/review-banner.jfif'); height: 300px;">
        
</div>
</div>



</section>


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
    });
</script>

 
 <!-- dataTable -->
 <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/r-2.2.5/sc-2.0.2/datatables.min.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.3.1/js/dataTables.fixedColumns.min.js"></script>
 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
 
	
 
 <script>
     $(document).ready(function(){
    	 
    	 
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
    	 
    	 
    	 
    	$('#qnalist thead tr').clone(true).appendTo('#qnalist thead');
      	$('#qnalist thead tr:eq(1) th').each(function(i){
      		
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
    	 
    	 
    	 
    	 
         $('#qnalist').DataTable({
        	 orderCellsTop:true,
 	   		fixedHeader:true,
 	   		scrollX:true
         });
         
         
         
         
        //질문게시판에 모달 토글 달기 
         var rows=$("#qnalist").children().children()
          
         
         for(var i=0;i<rows.length;i++){
             
             if(i>0&&i<=(rows.length-1)){
                 
                 console.log(i);
                 rows.eq(i).attr({"data-toggle":"modal","data-target":"#myModal"});
                 
                }
            }
         
         
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
         			
         			$("#noticeNum").val(noticeNum);
         			$("#Ndate").val('<%=notices.get(i).getNoticeCDate()%>');
         			$("#Ntitle").val('<%=notices.get(i).getNoticeTitle()%>');
         			$("#notice").html('<%=notices.get(i).getNoticeContent()%>');
         			
         		}
         		
         		
         		<%}%>
         		
         		
         	});
         	
         	
         	
         
         
            
            
         
         //질문게시판 행 클릭시, 모달 내용 채우기
            rows.click(function(){
            	
            	var qNum=$(this).children().eq(0).text();

                $(this).removeAttr("data-toggle");
                var pwd="";
                
                <%for(int i=0;i<qnas.size();i++){%>
	
                if(qNum=='<%=qnas.get(i).getQnaNo()%>'){
                	
                	pwd='<%=qnas.get(i).getQnaPassword()%>';
                }
                
                
                <%}%>
                var check=prompt("비밀번호를 입력하세요")

                if(check!=pwd){
                	
                	console.log(check);
                    alert("비밀번호가 일치하지 않아요.");
                    location.reload();
                }else{

                    $(this).attr({"data-toggle":"modal","data-target":"#myModal"});  
                    
                    
					<%for(int i=0;i<qnas.size();i++){%>
                    
                    if(qNum=='<%=qnas.get(i).getQnaNo()%>'){
                    
                    $("#questionNum").val(qNum);
                    
                    $("#writer").val('<%=qnas.get(i).getMemberId()%>');

                    $("#Qtitle").val('<%=qnas.get(i).getQnaTitle()%>');
                    $("#Qcategory").val('<%=qnas.get(i).getQnaCategory()%>');
                    $("#Qdate").val('<%=qnas.get(i).getQnaCDate()%>');

                    $("#question").html('<%=qnas.get(i).getQnaContent()%>');
                    
                    <%if(qnas.get(i).getQnaAnswer()!=null){%>
                    $("#answer").html('<%=qnas.get(i).getQnaAnswer()%>');
                    
                    <%}else{%>
                    $("#answer").text('');
                    <%}%>
                   
                    
                    $("#qpreview").attr("src","<%=request.getContextPath()%>/qnas_uploadFiles/<%=qnas.get(i).getQnaImgName()%>");

                    }
                    
                   
                    <%}%>

                    
                }
  
                
            });


            
            
        });
        
        
        </script>
        



        <!--제출-->
        <script>
            
           $(document).ready(function(){
        	   
        	   <%if(loginUser==null){
                   %>
                   	$("#qnaMemberNo").val("none");
                   <%}else{%>
                   
                   	$("#qnaMemberNo").val("<%=loginUser.getMemberNo()%>");
                   <%}%>
                   
                   


               $("#ask").click(function(){

                console.log("클릭")

                var answer=""

                if($("#qnaPwd").val()==""){
                    alert("비밀번호를 입력하셔야 해요.")
                }else{

                    answer=confirm("문의를 제출하시겠습니까?");

                }

              

                
               })
           });
        
       
        
        </script>
        
        <script>
		
			function showBoard(num){
				
				console.log("함수 실행!"+num);
				
				
				if(num==1){
					
					console.log("자주 묻는 질문");
					
					$("#frequentQ").css("display","block");
					$("#askBoard").css("display","none");
					$("#composeQ").css("display","none");
					$("#noticeBoard").css("display","none");
				}else if(num==2){
					
					console.log("질문 게시판");
					$("#askBoard").css("display","block");
					$("#frequentQ").css("display","none");
					$("#composeQ").css("display","none");
					$("#noticeBoard").css("display","none");
					
				}else if(num==3){
					
					console.log("문의하기");
					$("#composeQ").css("display","block");
					$("#frequentQ").css("display","none");
					$("#askBoard").css("display","none");
					$("#noticeBoard").css("display","none");
					
					
				}else{
					
					console.log("공지사항");
					$("#composeQ").css("display","none");
					$("#frequentQ").css("display","none");
					$("#askBoard").css("display","none");
					$("#noticeBoard").css("display","block");
					
					
				};
				
				
				
				
				
			}
		
		</script>
		<script>
		
			function qnaValidate(){
				
				var who=$("#qnaMemberNo").val();
				
				console.log(who);
				
				if(who=='none'){
					
					alert("제출을 위해서는 로그인을 하셔야 해요~");
					
					return false;
				}else{
					return true;
				}
				
			}
		
		</script>
        <script>
        	
        	function deleteConfirm(){
        		
        		 <%if(loginUser==null){
                     %>
                     	alert("로그인 해주세요~!")
                     <%}else{%>
                     
                     	
                    
        		
        		var delwho=$("#writer").val();
        		console.log("작성자:"+delwho);
        		console.log("로그인 아이디:"+'<%=loginUser.getMemberId()%>');
        		
        		if(delwho=='<%=loginUser.getMemberId()%>'){
        			
        			var delQNum= $("#questionNum").val();
        			var delAnsw=confirm("작성한 질문을 삭제하시겠습니까?");
        			if(delAnsw){
        				
        				location.href="<%=request.getContextPath()%>/delete.qna?questionNum="+delQNum;
        			}
        			
        		}else{
        			
        			alert("질문 작성 당사자만 삭제할 수 있습니다.");
        		}
        		
        		<%}%>
        		
        	};
        
        
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