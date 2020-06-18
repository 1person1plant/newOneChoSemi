<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, item.model.vo.*"%>
    
    
<%
 ArrayList<Item> items=(ArrayList<Item>)request.getAttribute("items");
 ArrayList<ItemImage> images=(ArrayList<ItemImage>)request.getAttribute("images");
 	
 	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
        <h1 style="margin-top: 30px;margin-bottom: 80px;">재고관리</h1>
        
        <div class="row">
            
            <form class="mx-auto" style="margin-bottom: 10rem; width: 60rem;" method="post" action="<%=request.getContextPath()%>/stockSearch.it">
                
                <table class="mx-auto" style="border: double black; width: 100%;" id="searchTable">
                        <tr>
                        <th colspan="5" style="text-align: center;height: 7rem;">검색</th>
                        
                        </tr>
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">재고수량</th>
                        <td colspan="4" style="position: relative;top:2px;">
                        <button type="button" id="zero" class="btn btn-outline-dark btn-sm">품절</button>
                        <button type="button" id="almost" class="btn btn-outline-dark btn-sm">품절임박</button>
                        <input type="number" id="min" name="minStock" placeholder="이상">
                        <label>~</label><input type="number" id="max" name="maxStock" placeholder="이하"><label>  개</label></td>
                        </tr>
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">전시상태</th>
                        <td colspan="4" style="text-align: left;">
                            <input type="radio" name="display" value="Y" id="available"><label for="available">전시중</label>
                            <input type="radio" name="display" value="N" id="inavailable"><label for="inavailable">전시중지</label></td>
                            
                        </tr>
                        <tr style="height: 3rem;">
                            <th style="text-align: center; width: 10rem;">상품명</th>
                            <td colspan="4">
                                <input type="text" placeholder="상품명을 입력하세요." id="pName" name="pName" style="width: 30rem; position: relative;right: 5px;" >
                                
                            </td>
                            
                        </tr>
                        <tr style="height: 3rem;">
                            <th style="text-align: center; width: 10rem;">카테고리</th>
                            <td colspan="1">
                                <select style="width: 7rem;position: relative;right: 5px;height: 2rem;" name="category">
                                    <option value="">전체</option>
                                    <option value="HANGING">HANGING</option>
                                    <option value="WATER">WATER</option>
                                    <option value="SOIL">SOIL</option>
                                </select>
                            </td>
                            <td colspan="3"></td>
                            
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
                   
                  <%if(!items.isEmpty()){ %>
                    
                        <table id="productlist" class="display" style="text-align: center;">
                            <thead>
                                <tr>
                                	<th></th>
                                    <th>번호</th>
                                    <th>상품</th>
                                    <th>재고수량</th>
                                    <th>품절여부</th>
                                    <th>누적구매수량</th>
                                    <th>전시상태</th>
                                    <th>카테고리</th>
                                   
                                </tr>
                     
                            </thead>
                            <tbody>
                            
                            <%if(!items.isEmpty()){ %>
                               		<%for(int i=0;i<items.size();i++){
                               			
                               			String display=items.get(i).getItemDisplay();
                               			switch(display){
                               			case "Y": display="전시중";break;
                               			case "N": display="전시중지";break;
                               			}
                               			
                               			int stock=items.get(i).getItemStock();
                               			
                               			String stockStatus="";
                               			if(stock==0){
                               				stockStatus="품절";
                               			}else if(stock>0&&stock<=5){
                               				stockStatus="품절임박";
                               			}
                               			
                               			%>
                               			
                               			
                               			<tr>
                               			<td></td>
                               			<td><%=items.get(i).getItemNo() %></td>
                                		<td><%=items.get(i).getItemName()%></td>
                                		<td><input id="<%=items.get(i).getItemNo()%>" type="number" value="<%=items.get(i).getItemStock()%>"></td>
                                		<td id="status"><%=stockStatus %></td>
                                		<td><%=items.get(i).getItemSCount() %></td>
                                		<td><%=display %></td>
                                		<td><%=items.get(i).getItemCategory()%></td>
                                		
                               			</tr>
                               		
                               		<%} %>
                               <%} %>
                               		
                               
                            </tbody>
                            <tfoot>
                                <tr>
                                	<th></th>
                                    <th>번호</th>
                                    <th>상품</th>
                                    <th>재고수량</th>
                                    <th>품절여부</th>
                                    <th>누적구매수량</th>
                                    <th>전시상태</th>
                                    <th>카테고리</th>
                                    
                                </tr>
                            </tfoot>
                        </table>
						<button type="button" style="width:100%;background-color: #1f598c;color: white;" id="modifyBtn" class="btn btn-secondary btn-lg">재고 수정하기</button>
						
						</form>
					 <%}else{ %> 
                       		<div class="container">
                       		<div class="mx-auto" style="text-align:center;width:60rem;height:20rem; background:lightgray;">
         
                       		<p style="padding-top:8rem;">검색 결과가 존재하지 않아요.<br><br>
                       		<button class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/stock.it'" style="background-color: #1f598c;color: white;">새로고침</button></p>
                       		
                      
                       		</div>
                       		</div>
                       <%} %>
                       
                       <form id="hiddenForm" method="post" action="<%=request.getContextPath()%>/stockUpdate.it" onsubmit="return stockValidate();">
                       </form>
						
                      
            
                 </div>
                    <!--제품 상세 내용 Modal-->
                    
                    
                    
                    
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
    	 
    	$('#productlist thead tr').clone(true).appendTo('#productlist thead');
     	$('#productlist thead tr:eq(1) th').each(function(i){
     		
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
    	 
       var table=$('#productlist').DataTable({
       		
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
    	   
    	   
    	   console.log(table.rows('.selected').data());
    	   console.log(length);
    	   
    	   console.log(ids);
    	   
    	   var value=[];
    	   
    	   for(var i=0;i<length;i++){
    		   
    		   value.push(document.getElementById(ids[i]).value)
    	   }
    	  
    	   console.log(value);
    	   
    	   $hiddenForm=$("#hiddenForm");
    	   $hiddenForm.html(""); //기존의 tag 지우기
    	   
    	   for(var i=0;i<length;i++){
    		   
    		   var $div=$("<div>");
    		   var $id=$("<input>").attr("type","hidden").attr("name","id").val(ids[i]);
    		   var $stock=$("<input>").attr("type","hidden").attr("name","stock").val(value[i]);
    		   
    		   $div.append($id);
    		   $div.append($stock);
    		   
    		   $hiddenForm.append($div);
    		   
    	   }
    	   
    	   
    	   $("#hiddenForm").submit();
    	  
    	   
       });
       
		
      
           
               
        });
        
        
        </script>
       
        
        <script>
        
        
       
            
        function stockValidate(){
        	//재고에 입력된 값이 숫자인지 확인
        	//행이 선택되었는지 확인
        	
        	
        	var regExp=/^[0-9]{1,}$/;
        	
        	var testName=$("input[name='stock']");
        	
        	var testLength=testName.length;
        	
        	if(testLength==0){
        		alert("수정할 행을 체크해주세요.");
        		return false;
        	}
        	
        	for(var i=0;i<testLength;i++){
        		
        		var testValue=testName.eq(i).val();
        		
        		if(regExp.test(testValue)){
        			 var agree=confirm(testLength+"개의 상품 재고를 수정하시겠습니까?")
            		 if(agree){
            			 return true;
            		 }
        			
        		}else{
        			alert("재고 수량을 확인해주세요.");
        			return false;
        		}
        		
        	}
        	
        	console.log(testName.eq(1).val())
        	console.log(testLength);
        	
        	
        	
        	
        }
        
       
        
        </script>
        <script>
                
                	$(function(){
                	
                		 $("#zero").click(function(){
                        
                         	$("#min").val(0);
                         	$("#max").val(0);
                         });
                         
                         $("#almost").click(function(){
                         	$("#min").val(1);
                         	$("#max").val(5);
                         });
                         
                		
                		
                	})
                	
                
                </script>
                
                <script>
                    $(function(){
                        $("#min").change(function(){

                            var min=$("#min").val();
                            $("#max").attr("min",min);
                        });
                        
                       
                    })
                </script>


       
        
        <%@ include file="../common/footer.jsp" %>



</body>
</html>