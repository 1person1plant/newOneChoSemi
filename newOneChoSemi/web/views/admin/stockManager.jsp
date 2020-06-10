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
        width: 80rem;
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
                  <a class="nav-link" href="#">
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
                  <a class="nav-link" href="#">
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
                  <a class="nav-link" href="#">
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
              <a class="nav-link" href="#">
                <span data-feather="file"></span>
                	Q&A
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
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
            
            <form class="mx-auto" style="margin-bottom: 10rem; width: 60rem;" method="post" action="<%=request.getContextPath()%>/search.it">
                
                <table class="mx-auto" style="border: double black; width: 100%;" id="searchTable">
                        <tr>
                        <th colspan="5" style="text-align: center;height: 7rem;">검색</th>
                        
                        </tr>
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">재고수량</th>
                        <td colspan="4" style="position: relative;top:2px;">
                        <input type="number" id="min" placeholder="이상">
                        <label>~</label><input type="number" id="max" placeholder="이하"><label>  개</label></td>
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
                                <button type="submit" class="btn btn-dark" style="width: 7rem;margin-right: 2rem;">조회</button>
                                <button type="reset" class="btn btn-outline-dark" style="width: 7rem;margin-right: 2rem;">초기화</button>
                                
                            </td>
                                
                            </tr>
                        </table>
                    </form>
                </div>
                
                <script>
                    $(function(){
                        $("#min").change(function(){

                            var min=$("#min").val();
                            $("#max").attr("min",min);
                        })
                    })
                </script>
                
                <div class="row">
                   
                  <%if(!items.isEmpty()){ %>
                    
                        <table id="productlist" class="display" style="width:100%;text-align: center;">
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
                                    <th>수정/삭제</th>
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
                               		
                               			<tr id="row<%=i%>">
                               			<td></td>
                               			<td><%=items.get(i).getItemNo() %></td>
                                		<td><%=items.get(i).getItemName()%></td>
                                		<td><input type="number" value="<%=items.get(i).getItemStock()%>"></td>
                                		<td><%=stockStatus %></td>
                                		<td><%=items.get(i).getItemSCount() %></td>
                                		<td><%=display %></td>
                                		<td><%=items.get(i).getItemCategory()%></td>
                                		<td><button>수정</button><button>삭제</button></td>
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
                                    <th>수정/삭제</th>
                                </tr>
                            </tfoot>
                        </table>

					<%}else{ %> 
                       		<div class="container">
                       		<div class="mx-auto" style="text-align:center;width:60rem;height:20rem; background:lightgray;">
         
                       		<p style="padding-top:8rem;">검색 결과가 존재하지 않아요.<br><br>
                       		<button class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/stock.it'">새로고침</button></p>
                       		
                      
                       		</div>
                       		<div>
                       <%} %>
						
                      
            
                 </div>
                    <!--제품 상세 내용 Modal-->
                    
                    <!-- The Modal -->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog">
                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">재고 조회</h4>
                            
                            <button type="button" class="close" data-dismiss="modal" id="modalClose">&times;</button>
                            </div>
                    
                            <!-- Modal body -->
                            <div class="modal-body">
                            <form id="modalForm"  method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/update.it" onsubmit="return validate();">

                                
                                <ul>
                                    <li><label>상품번호</label><br><input required type="text" readonly id="productNum" name="productNum" style="width:80%"></li>
                                    <li><label>상품명</label><br><input required type="text" readonly id="productName" style="width:80%" name="modifyName"></li>
                                    <li><label>전시상태</label><br><input required type="text" readonly id="exhibitStatus" name="modifyExhibitText">
                                        <select id="modifyExhibitStatus" style="width:35%" name="modifyExhibit">
                                            <option selected value="null">상태수정</option>
                                            <option value="Y">전시중</option>
                                            <option value="N">전시중지</option>
                                            
                                        </select>
                                    </li>
                                    
                                    <li><label>재고수량</label><br><input type="number" readonly id="stock" name="stock"></li>
                                    <li><label>품절여부</label><br><input type="text" readonly id="stockStatus"></li>
                                    <li><label>카테고리</label><br><input required type="text" readonly id="category" name="modifyCategoryText">
                                        <select id="modifyCategory"  style="width:38%" name="modifyCategory">
                                            <option selected value="null">상태수정</option>
                                            <option value="HANGING">HANGING</option>
                                            <option value="WATER">WATER</option>
                                            <option value="SOIL">SOIL</option>
                                        </select>
                                    </li>
                                   
                                    
                                </ul> 
                                
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            <button type="submit" class="btn btn-outline-success" >수정하기</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deleteConfirm();">삭제하기</button>
                            </div>
                            
                            </form>
                        </div>
                        </div>
                    </div>
                    <script>
                        $(function(){

                            $("#discount").change(function(){
                                
                                var price=$("#price").val();
                                var discount=$("#discount").val();
                                console.log(price);
                                console.log(discount);

                                if((price-discount)<0){
                                    console.log("할인 심하다~")
                                    $("#warning").css("display","block").css("color","#d9534f");
                                    $("#discount").val(null);
                                }else{
                                    $("#warning").css("display","none");
                                }
                            })
                            
                            
                            $("#price").change(function(){
                                
                                var price=$("#price").val();
                                var discount=$("#discount").val();
                                console.log(price);
                                console.log(discount);

                                if((price-discount)<0){
                                    console.log("할인 심하다~")
                                    $("#warning").css("display","block").css("color","#d9534f");
                                    $("#discount").val(null);
                                }else{
                                    $("#warning").css("display","none");
                                }
                            })
                            
                        })
                    </script>
                    <script>
                    
										//파일로드시 레이블 수정
										$(function(){
											
											$("#mainImg").change(function(){
												
												$("#mainImg").next().text($("#mainImg").val());
												
											});
											
											$("#subImg").change(function(){
												$("#subImg").next().text($("#subImg").val());
											})
											
										})
										
                    				
                                        //preview
                                        function loadFile(value,num){
                                        	
                                        	console.log("프리뷰 실행중");
											
                                        	var reader=new FileReader();
                                        	reader.onload=function(){
                                        		
                                        		if(num==1){
                                        			
                                        			var preview=document.getElementById("mpreview");
                                        			preview.src=reader.result;
                                        		}else{
                                        			
                                        			var preview=document.getElementById("spreview");
                                        			preview.src=reader.result;
                                        		}
                                        		
                                        	}
                                            
                                                reader.readAsDataURL(value.files[0]);
                                            }

                                        

                 </script>   
                  <script>
                  //상품설명 글자수 세기
                  $(function(){
                	  

                    $("#itemInfo").keyup(function(){

                      var count=$("#itemInfo").val().length;

                      $("#countText").children('span').first().text(count);

                    })

                      $('button[type=reset]').click(function(){
                        $("#countText").children('span').first().text('0');
                      })
                  })

                </script>
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


<!--datatable 관련 script-->
 
 <script type="text/javascript" src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/r-2.2.5/sc-2.0.2/datatables.min.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.3.1/js/dataTables.fixedColumns.min.js"></script>
 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
 <script>
     $(document).ready(function(){
    	 
    	$('#productlist thead tr').clone(true).appendTo('#productlist thead');
     	$('#productlist thead tr:eq(1) th').each(function(i){
     		
     		var title=$(this).text();
     		
     		console.log("this:"+$(this));
     		
     		$(this).html('<input type="text" placeholder="search '+title+'"/>');
     		
     		$('input',this).on('keyup change',function(){
     			
     			if(table.column(i).search()!==this.value){
     				table
     					.column(i)
     					.search(this.value)
     					.draw();
     			}
     			
     		});
     		
     	}); 
    	 
       var table=$('#productlist').DataTable({
       
    	  	orderCellsTop:true,
	   		fixedHeader:true,
	   		scrollX:true,
	   		columnDefs:[{
	   			orderable:false,
	   			className:'select-checkbox',
	   			targets:0
	   		}],
	   		select:{
	   			style:'os',
	   			selector:'td:first-child'
	   		},
	   		order:[[1,'asc']]
        	
         });
       
       var flag=true;
       
       $("#productlist tbody").on('click','button',function(){
     		
     		if($(this).text()=="삭제"){
     			
     			console.log("삭제버튼 클릭");
     			flag=false;
     			console.log("삭제 버튼 클릭 안 플래그"+flag);
     			$(this).parent().parent().removeAttr("data-toggle");
     			
     			var agree=confirm("정말 삭제하시겠어요?"+$(this).parent().parent().children().eq(0).text());
     			var clicked=$(this).parent().parent().children().eq(0).text();
     			
     			if(agree){
     				
     				location.href="<%=request.getContextPath()%>/delete.it?itemNum="+clicked;
     			}
     			
     			
     			
     		}else{
     			flag=true;
     			console.log("수정버튼 클릭");
     			console.log("수정 버튼 클릭 안 플래그"+flag);
     		}
     		
     	})
       
         
         $("#productlist tbody").on('click','tr',function(){
        	 
        	 console.log("행 클릭 안 플래그"+flag);
        	 

        	 console.log("행에 토글달기");
        	 
        	if(flag){
        	
        	 $(this).attr({"data-toggle":"modal","data-target":"#myModal"});
        	 
        	}
        	 
        	 var pNum=$(this).children().eq(0).text();
         	
             $("#productNum").val(pNum);
             $("#productName").val($(this).children().eq(1).text());
             $("#exhibitStatus").val($(this).children().eq(2).text());
             $("#price").val($(this).children().eq(3).text());
             $("#discount").val($(this).children().eq(4).text());
            // $("#itemInfo").val($(this).children().eq(6).text());
             
            
             $("#category").val($(this).children().eq(6).text());
             $("#keyword").val($(this).children().eq(7).text());
             $("#registerDate").val($(this).children().eq(8).text());
             $("#modifyDate").val($(this).children().eq(9).text());
             
             $("#countText").children('span').first().text( $("#itemInfo").val().length);
             
             
             
            
             
             
             if($("#exhibitStatus").val()=="전시중지"){
          	   
          	   $(".modal-body input").not($("#productNum")).not($("#category")).not($("#registerDate")).not($("#modifyDate")).prop("readonly",false);
                $("#mainImg").prop("disabled",false);
                $("#subImg").prop("disabled",false);
                $("#itemInfo").prop("readonly",false);
          	   
             }
         })
         
         
         
         	
       	
       	
         

            $(".modal-body input").click(function(){
                if($("#exhibitStatus").val()=="전시중"){
                    alert("전시상태를 전시중지로 수정해야 값을 수정할 수 있습니다.");
                 }
                })
            
           
            
            
            $("#modifyExhibitStatus").change(function(){
                var selected=$('#modifyExhibitStatus').children("option:selected").text();
                $("#exhibitStatus").val(selected);

                if(selected=="전시중지"){
                    $(".modal-body input").not($("#productNum")).not($("#registerDate")).not($("#modifyDate")).prop("readonly",false);
                    $("#mainImg").prop("disabled",false);
                    $("#subImg").prop("disabled",false);
                    $("#itemInfo").prop("readonly",false);
                    
                }else if(selected=="전시중"){
                    $(".modal-body input").prop("readonly",true);
                }
            })

            $("#modifyCategory").change(function(){

                var display=$("#exhibitStatus").val();
                var selected=$('#modifyCategory').children("option:selected").text();

                if(display=="전시중지"){
                    $("#category").val(selected);
                    $("#category").css("background","yellow");
                }
            })
            
            $("#modifyKeyword").change(function(){
            	
            	var display=$("#exhibitStatus").val();
            	var selected=$("#modifyKeyword").children("option:selected").text();
            	
            	if(display=="전시중지"){
            		$("#keyword").val(selected);
            		$("#keyword").css("background","yellow");
            	}
            })
            
            $("#itemInfo").change(function(){
            	$(this).css("background","yellow");
            })
            
            
            $(".modal-body input").change(function(){
            	
            	$(this).css("background","yellow");
            })
            
			
            
           
               
        });
        
        
        </script>
       
        <!--모달에서 수정/삭제 시 서버로 값 넘기기-->
        <script>
            
        function validate(){
        	
        	if($("#exhibitStatus").val()=="상태수정"){
        		alert("전시상태를 선택하세요");
        		return false;
        	}
        	
        	else if($("#modifyKeyword").val()==null){
        		alert("키워드를 선택하세요.");
        		return false;
        	}else{
        		return true;
        	}
        	
        }
        
        function deleteConfirm(){
            
            var answer=confirm("삭제하시겠습니까?");
            var modalItemNum=$("#productNum").val();
            
            if(answer){
            	location.href="<%=request.getContextPath()%>/delete.it?itemNum="+modalItemNum;
            }
            
        }
        
        </script>


       
        
        <%@ include file="../common/footer.jsp" %>



</body>
</html>