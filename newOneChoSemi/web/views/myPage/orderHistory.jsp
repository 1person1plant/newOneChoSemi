<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="order.model.vo.*,java.util.ArrayList"%>
<%
	ArrayList<OrderHis> oh = (ArrayList<OrderHis>)request.getAttribute("oh");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<title>Cho-당신을 위한 반려식물</title>
	<!--타이틀 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/images/logo.png">
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
			src:
				url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
				format('woff');
			font-weight: normal;
			font-style: normal;
		}
		
		* {
			font-family: "basicFont";
		}
		/* font end */
	</style>
	<style>
		.container{
			padding-top:2%;
		}
		
		fieldset {
            height: auto;
            margin: 5px;
            margin-bottom: 50px;
            background: white;
            padding-left: 0;
            padding-right: 0;
            text-align: center;
        }     

		td{
			padding:6px;
		}
		td.ordertd{
			padding:6px;
		}
        /* 주문 내역 테이블 크기 */
        .ordertd{
          vertical-align:middle;
          width:14%;
        }
        
        .table td, table th{
        	vertical-align:middle !important;
        }
        
        /* 버튼 CSS */
        .button1{
			padding:8px 18px;
			margin:5px;
			border-radius:8px;
			color:black;
			border: 1px solid #115D8C;
			background-color:white;
			width:100px;
			height:42px;
		}
		.cancelRequestBtn{
			padding:8px 18px;
			margin:5px;
			border-radius:8px;
			color:black;
			border: 1px solid #115D8C;
			background-color:red;
			width:100px;
			height:42px;
		}
		.button1 :hover{
			border-radius:8px !important;
			background:#6AAED9 !important;
			color:white !important;
			transition:0.2s !important;
		}
		.button1 :active{
			border-radius:8px !important;
			background:#012340 !important;
		}
		#orderbutton{
          text-align:right;
        }
        
        .cancelListBtn{
			padding: 8px 18px;
			margin: 5px;
			border-radius: 8px;
			color: black;
			border: 1px solid #115D8C;
			background-color: white;
			width: auto;
			height: auto;
			text-align:right !important;
		}
        .orderHistoryBtn{
			padding: 8px 18px;
			margin: 5px;
			border-radius: 8px;
			color: black;
			border: 1px solid #115D8C;
			background-color: white;
			width: auto;
			height: auto;
			text-align:right !important;
		}
	</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<%if(loginUser.getMemberStatus() == "K" || loginUser.getMemberStatus().equals("K")){ %>
					<%@include file="kakaoCategory.jsp" %>
				<%} else {%>
					<%@include file="myPageCategory.jsp" %>
				<%} %>
			</div>
         <!-- 9단길이의 첫번째 열 -->
			<div class='col-md-9'>
				<fieldset>
					<div class="table" id='orderTable'>
						<form>
							<table>
								<thead>
								<th colspan="9" scope="col" style='border-bottom: 2px solid black'>
									<input type="text" style="display:none;" value="<%=loginUser.getMemberNo()%>" id="memberNo" name="memberNo">
									<h1>주문 내역</h1>
								</th>
								
								</thead>
								<tbody>
									<tr class='ollist' style='border-bottom: 2px solid black'>
										<td>주문번호</td>
										<td>상품이미지</td>
										<td>상품번호</td>
										<td>상품명</td>
										<td>수량</td>
										<td>배송상태</td>
										<td>기타</td>
									</tr>
								<%if(oh.isEmpty()||oh.size()==0){ %>
									<tr class='ollist' style='border-bottom: 2px solid black'>
									<td style="padding:15px"class='ordertd' colspan="7" style="font-size:1rem">주문 내역이 존재하지 않습니다.</td>
								</tr>
								<%}else{%>
									<%for(int i=0;i<oh.size();i++){%>
									<%if((oh.get(i).getOrderCancelrequest()).equals("N")){ %>
										<tr class='ollist' style='border-bottom: 2px solid black'>
										<td class='ordertd'><%=(oh.get(i)).getOrderNo()%></td>
											<td class='ordertd'><img src='<%=request.getContextPath()%>/items_uploadFiles/<%=(oh.get(i)).getImageName()%>' width='150px'
										height='150px'></td>
											<td class='ordertd'><%=(oh.get(i)).getItemNo()%></td>
											<td class='ordertd'><%=(oh.get(i)).getItemName()%></td>
											<td class='ordertd' id="orderT"><%=(oh.get(i)).getOrderCount()%></td>
											<td class='ordertd'><%=(oh.get(i)).getDeliveryStatus()%></td>
											<td id='orderbutton'>
											<input type='button' id="<%=(oh.get(i)).getOrderNo()%><%=(oh.get(i)).getItemNo()%>Btn" class='button1' value="취소신청"><br>
											<button type='button' class='button1' id="<%=(oh.get(i)).getOrderNo()%><%=(oh.get(i)).getItemNo()%>reviewBtn">리뷰쓰기</button><br>
											<button type='button' class='button1' id="<%=(oh.get(i)).getOrderNo()%><%=(oh.get(i)).getItemNo()%>detailBtn">상세보기</button></td>
										</tr>
										
										<%}else{ %>
											<tr class="ollist" style="border-bottom:2px solid black; background-color:#BBDDF2">
											<td class='ordertd'><%=(oh.get(i)).getOrderNo()%></td>
											<td class='ordertd'><img src='<%=request.getContextPath()%>/items_uploadFiles/<%=(oh.get(i)).getImageName()%>' width='150px'
										height='150px'></td>
											<td class='ordertd'><%=(oh.get(i)).getItemNo()%></td>
											<td class='ordertd'><%=(oh.get(i)).getItemName()%></td>
											<td class='ordertd' id="orderT"><%=(oh.get(i)).getOrderCount()%></td>
											<td class='ordertd'><%=(oh.get(i)).getDeliveryStatus()%></td>
											<td id='orderbutton'>
											<input type='button' class='cancelRequestBtn' value="취소 중" disabled="disabled">
											<button type='button' class='button1' id="<%=(oh.get(i)).getOrderNo()%><%=(oh.get(i)).getItemNo()%>detailBtn">상세보기</button></td>
										</tr>
										<%} %>
									<%} %>
										<tr>
											<td colspan="7" class="ordertd" align="right"><input type="button" class="cancelListBtn" value="주문 취소 내역"></td>
										</tr>
								<%} %>
								</tbody>
							</table>
							
						</form>
					</div>
				</fieldset>
			</div>
			</div>
			</div>
			
			<!-- 리뷰쓰기 버튼 클릭 시작 -->
			<%for(int i=0;i<oh.size();i++){ %>
			<script>
				$(function(){
					$("#<%=(oh.get(i)).getOrderNo()%><%=(oh.get(i)).getItemNo()%>reviewBtn").click(function(){
						if("<%=(oh.get(i)).getDeliveryStatus()%>"!="배송 완료"){
							alert("배송 완료되어야 리뷰 작성이 가능합니다.");
						}else if("<%=(oh.get(i)).getDeliveryStatus()%>"=="배송 완료"){
						var itemNo = "<%=(oh.get(i)).getItemNo()%>"
						location.href="<%=request.getContextPath()%>/itemDetail.it?itemNo=" + itemNo+"#myReview-writing";
						}
					})
				})
			</script>
			<%} %>
			<!-- 리뷰쓰기 버튼 클릭 끝 -->
			
			<!-- 상세보기 버튼 클릭 시작 -->
			<%for(int i=0;i<oh.size();i++){ %>
			<script>
				$(function(){
					$("#<%=(oh.get(i)).getOrderNo()%><%=(oh.get(i)).getItemNo()%>detailBtn").click(function(){
						var itemNo = "<%=(oh.get(i)).getItemNo()%>"
						location.href="<%=request.getContextPath()%>/itemDetail.it?itemNo=" + itemNo;
					})
				})
			</script>
			<%} %>
			<!-- 상세보기 버튼 클릭 끝 -->
			
			<!-- 버튼 클릭 옵션 시작 -->
			<script>
            	$(function(){
            		$(".button1").mouseenter(function(){
            			$(this).css({"background":"#6AAED9","color":"white","transition":"0.2s","border-radius":"8px"});
            		}).mouseout(function(){
            			$(this).css({"padding":"8px 18px","border-radius":"8px","color":"black","border":"1px solid #11538C","background-color":"white",
            			"width":"100px", "height":"42px"});
            		});
            	});
            </script>
			<!-- 버튼 클릭 옵션 끝 -->
            
            <!-- 주문 취소 버튼 시작 -->
            <%for(int i=0;i<oh.size();i++){ %>
            <script>
            	$(function(){
	            	$("#<%=(oh.get(i)).getOrderNo()%><%=(oh.get(i)).getItemNo()%>Btn").click(function(){
	            		var deliCode = $(this).parents("tr").children("td:nth-child(6)").text();
	                	var D1 = "배송 전";
	                	var D2 = "배송 중";
	                	var D3 = "배송 완료";
	                	console.log("D1 : " + D1 +"D2 : " + D2 +"D3 : " + D3 + "deliCode : " + deliCode)
	                	var dupeOrderNo = "<%=(oh.get(i)).getItemName()%>"
	                	var cancelAns = confirm("상품명 : " + dupeOrderNo + "\n주문을 취소하시겠습니까?");
	                	
	      				if(cancelAns){
	                	if(deliCode == D2 || deliCode == D3){
	            			alert("배송 중이거나 배송 완료된 상품은 주문 취소가 불가능 합니다.");
	            			
	            		}else if(deliCode == D1){
	            		var orderNo = $(this).parents("tr").children("td:first").text();
	            		var memberNo = "<%=loginUser.getMemberNo()%>";
						var itemNo = $(this).parents("tr").children("td:nth-child(3)").text();
	            		console.log("orderNo: " + orderNo + "/memberNo : " + memberNo + "/itemNo : "+ itemNo);
	            		$.ajax({
	    					url:"<%=request.getContextPath()%>/cancel.re",
	    					type:"post",
	    					data:{orderNo:orderNo,memberNo:memberNo,itemNo:itemNo},
	    					success:function(data){
	    						if(data == "success"){
	    							location.reload();
									alert("주문 취소 요청이 완료 되었습니다.");
	    						}else if(data == "fail"){
	    							alert("실패");
	    						}
	    					},
	    					error:function(request,status,error){
	    						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    					}
	    				});
	            		}
	      				}
	            })
            })
            </script>
			<%} %>
            <!-- 주문 취소 버튼 끝 -->
			
			<!-- 주문 취소 내역 버튼 클릭 시작 -->
			<script>
				$(function(){
					$(".cancelListBtn").mouseenter(function(){
						$(this).css({"background":"#6AAED9","color":"white","transition":"0.2s","border-radius":"8px"});
					}).mouseout(function(){
						$(this).css({"padding":"8px 18px","border-radius":"8px","color":"black","border":"1px solid #11538C","background-color":"white", "width":"auto", "height":"auto"});
					});
					$(".cancelListBtn").click(function(){
						location.href="<%=request.getContextPath()%>/ohcancel.oh?memberNo=<%=loginUser.getMemberNo()%>";
					})
				})
			</script>
			<!-- 주문 취소 내역 버튼 클릭 끝 -->
			<%@ include file="../common/footer.jsp"%>
			
</body>
</html>