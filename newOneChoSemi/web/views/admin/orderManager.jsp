<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, order.model.vo.admin.*"%>
    
 <%
 ArrayList<AdminOrder> orders=(ArrayList<AdminOrder>)request.getAttribute("orders");
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
  	   <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.21/r-2.2.5/sc-2.0.2/datatables.min.css"/>
       <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css"/>
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
        <h1 style="margin-top: 30px;margin-bottom: 80px;">주문관리</h1>
        
        <div class="row">    
            
            <form class="mx-auto" style="margin-bottom: 10rem; width: 60rem;" method="post" action="<%=request.getContextPath()%>/search.or">
                
                <table class="mx-auto" style="border: double black; width: 100%;" id="searchTable">
                        <tr>
                        <th colspan="5" style="text-align: center;height: 7rem;">검색</th>
                        
                        </tr>
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">기간</th>
                        <td>
                            <select style="position: relative;margin-left: 6px; width: 7rem;right: 9px;height: 2rem;" id="searchDate" name="searchDate">
                            	<option value="">전체</option>
                                <option value="ORDER_DATE">결제일</option>
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
                        <th style="text-align: center; width: 10rem;">배송상태</th>
                        <td colspan="4" style="text-align: left;">
                            <input type="radio" name="searchDelivery" value="배송 전" id="sd1"><label for="sd1">배송전</label>
                            <input type="radio" name="searchDelivery" value="배송 중" id="sd2"><label for="sd2">배송중</label>
                            <input type="radio" name="searchDelivery" value="배송 완료" id="sd3"><label for="sd3">배송완료</label></td>
                            
                        </tr>
                        
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">입금상태</th>
                        <td colspan="4" style="text-align: left;">
                            <input type="radio" name="searchPayment" value="입금 전" id="sp1"><label for="sp1">입금전</label>
                            <input type="radio" name="searchPayment" value="입금 후" id="sp2"><label for="sp2">입금완료</label></td>
                            
                            
                        </tr>
                        
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">취소요청</th>
                        <td colspan="4" style="text-align: left;">
                            <input type="radio" name="searchCancel" value="Y" id="sc1"><label for="sc1">신청</label>
                            <input type="radio" name="searchCancel" value="N" id="sc2"><label for="sc2">미신청</label></td>
                            
                            
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
                
                <form class="mx-auto">
                   
                   <%if(!orders.isEmpty()){ %>
                        
                        <table id="orderlist" class="display" style="text-align: center;">
                            <thead>
                                <tr>
                                	<th></th>
                                    <th>주문번호</th>
                                    <th>주문일시</th>
                                    <th>상품번호</th>
                                    <th>상품명</th>
                                    <th>입금상태</th>
                                    <th>취소요청</th>
                                    <th>배송상태</th>
                                    <th>구매수량</th>
                                    <th>회원아이디</th>
                                    <th>주문취소</th>
                                </tr>
                     
                            </thead>
                            <tbody>
                               <%if(!orders.isEmpty()){ %>
                               		<%for(int i=0;i<orders.size();i++){ %>
                               		
                               			<tr id="row<%=i%>">
                               				<td></td>
                               				<td><%=orders.get(i).getOrderNo() %></td>
                               				<td><%=orders.get(i).getOrderDate() %></td>
                               				<td><%=orders.get(i).getItemNo() %></td>
                               				<td><%=orders.get(i).getItemName() %></td>
                               				<td><select id="paymentStatus<%=orders.get(i).getOrderNo()%><%=orders.get(i).getItemNo()%>" name="paymentStatus" style="height:30px;">
                               					<option value="P1">입금 전</option>
                               					<option value="P2">입금 후</option>
                               					</select></td>
                               				<script>
                               				
                               					var pOptions=$("#paymentStatus<%=orders.get(i).getOrderNo()%><%=orders.get(i).getItemNo()%>").children();
                               					for(var j=0;j<pOptions.length;j++){
                               						
                               						if(pOptions.eq(j).text()=='<%=orders.get(i).getPaymentStatus()%>'){
                               							pOptions.eq(j).prop("selected","true");
                               						}
                               					}
                               				</script>
                               				<td><%=orders.get(i).getCancelRequest() %></td>
                               				<td><select id="deliveryStatus<%=orders.get(i).getOrderNo()%><%=orders.get(i).getItemNo()%>" name="deliveryStatus" style="height:30px;">
                               					<option value="D1">배송 전</option>
                               					<option value="D2">배송 중</option>
                               					<option value="D3">배송 완료</option>
                               				</select></td>
                               				<script>
                               					var dOptions=$("#deliveryStatus<%=orders.get(i).getOrderNo()%><%=orders.get(i).getItemNo()%>").children();
                               					
													for(var j=0;j<dOptions.length;j++){
                               						
                               						if(dOptions.eq(j).text()=='<%=orders.get(i).getDeliveryStatus()%>'){
                               							dOptions.eq(j).prop("selected","true");
                               						}
                               					}
                               				</script>
                               				<td><%=orders.get(i).getOrderCount() %></td>
                               				<td><%=orders.get(i).getMemberId() %></td>
                               				<td><button>주문취소</button></td>
                               			</tr>
                               		
                               		<%} %>
                               <%} %>
                               		
                               
                            </tbody>
                            <tfoot>
                                <tr>
                                	<th></th>
                                    <th>주문번호</th>
                                    <th>주문일시</th>
                                    <th>상품번호</th>
                                    <th>상품명</th>
                                    <th>입금상태</th>
                                    <th>취소요청</th>
                                    <th>배송상태</th>
                                    <th>구매수량</th>
                                    <th>회원아이디</th>
                                    <th>주문취소</th>
                                </tr>
                            </tfoot>
                        </table>
                        <button type="button" id="modifyBtn" style="width:100%;background-color: #1f598c;color: white;" class="btn btn-secondary btn-lg btn-block">주문 수정하기</button>
						</form>
                       <%}else{ %> 
                       		<div class="container">
                       		<div class="mx-auto" style="text-align:center;width:60rem;height:20rem; background:lightgray;">
         
                       		<p style="padding-top:8rem;">검색 결과가 존재하지 않아요.<br><br>
                       		<button type="button" class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/adminList.or'">새로고침</button></p>
                       		
                      
                       		</div>
                       		</div>
                       <%} %>
                        
                       <form id="hiddenForm" method="post" action="<%=request.getContextPath()%>/orderUpdate.or" onsubmit="return orderValidate();">
                       </form> 
                
            
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


<!--datatable 관련 script-->
 
 <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/r-2.2.5/sc-2.0.2/datatables.min.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.3.1/js/dataTables.fixedColumns.min.js"></script>
 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
 <script>
     $(document).ready(function(){
    	 
    	 
    	$('#orderlist thead tr').clone(true).appendTo('#orderlist thead');
     	$('#orderlist thead tr:eq(1) th').each(function(i){
     		
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
    	 
       var table=$('#orderlist').DataTable({
       
    	    responsive:true,
   	  		orderCellsTop:true,
	   		fixedHeader:true,
	   		scrollX:true,
	   		columnDefs:[{
	   			orderable:false,
	   			className:'select-checkbox',
	   			targets:0
	   		}],
	   		select:{
	   			style:'multi',
	   			selector:'td:first-child'
	   		},
	   		order:[[1,'asc']]
        	
         });
       

       //체크박스로 선택된 행의 데이터 뽑아오고 submit하기
       $("#modifyBtn").on('click',function(){
    	   
    	   var selectedRows=table.rows('.selected').data();
    	   var length=table.rows('.selected').data().length;
    	   
    	   //선택된 행들의 아이템 넘버를 배열에 담는다
    	   var ids=[];
    	   
    	   for(var i=0;i<length;i++){
    		   
    		   var id=selectedRows[i][1];
    		   ids.push(id);
    		
    	   }
    	   
    	   var items=[];
    	   
    	   for(var i=0;i<length;i++){
    		   
    		   var item=selectedRows[i][3];
    		   items.push(item);
    	   }
    	   
    	   
    	  
    	   
    	   
    	   console.log(table.rows('.selected').data());
    	   console.log(length);
    	   console.log(ids);
    	   
    	   var payment=[];
    	   var delivery=[];
    	   
 		   for(var i=0;i<length;i++){
    		 
 			  payment.push(document.getElementById("paymentStatus"+ids[i]+items[i]).value);
 			  delivery.push(document.getElementById("deliveryStatus"+ids[i]+items[i]).value);

    	   };
    	   
    	   console.log(payment);
    	   console.log(delivery);
    	   
    	 
    	  
    	  
    	   
    	   $hiddenForm=$("#hiddenForm");
    	   $hiddenForm.html(""); //기존의 tag 지우기
    	   
    	   for(var i=0;i<length;i++){
    		   
    		   var $div=$("<div>");
    		   var $id=$("<input>").attr("type","hidden").attr("name","id").val(ids[i]);
    		   var $item=$("<input>").attr("type","hidden").attr("name","item").val(items[i]);
    		   var $payment=$("<input>").attr("type","hidden").attr("name","payment").val(payment[i]);
    		   var $delivery=$("<input>").attr("type","hidden").attr("name","delivery").val(delivery[i]);
    		   
    		   
    		   $div.append($id);
    		   $div.append($item);
    		   $div.append($payment);
    		   $div.append($delivery);
    		  
    		   
    		   $hiddenForm.append($div);
    		   
    	   }
    	   
    	   
    	   $("#hiddenForm").submit();
    	  
    	   
       }); 
         
         
       
       $("#orderlist tbody").on('click','button',function(){
    		
    		if($(this).text()=="주문취소"){
    			
    			console.log("취소버튼 클릭");
    			
    			var agree=confirm("정말 취소하시겠어요?"+$(this).parent().parent().children().eq(1).text());
    			var orderNum=$(this).parent().parent().children().eq(1).text();
    			var itemNum=$(this).parent().parent().children().eq(3).text();
    			
				if(agree){
     				
     				location.href="<%=request.getContextPath()%>/orderDelete.or?orderNum="+orderNum+"&itemNum="+itemNum;
     			}
    			
    			
    		}
    		
    	});  	
       	
       	
         
		
         
           
            
            
          
            
           
               
        });
        
        
        </script>
        <script>
        
        
        function orderValidate(){
        	
        	var testPayment=$("input[name='payment']");
        	var testLength=testPayment.length;
        	
        	if(testLength==0){
        		alert("수정할 행을 체크해주세요.");
        		return false;
        	}else{
        		
        		var agree=confirm(testLength+"개의 주문을 수정하시겠습니까?")
       		 	if(agree){
       			 return true;
       			 }else{
       				 return false;
       			 }
        		
        	}
        	
        }
        
        
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
        
        <%@ include file="../common/footer.jsp" %>

</body>
</html>