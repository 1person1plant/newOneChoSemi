<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="order.model.vo.*,java.util.ArrayList"%>

<%
	ArrayList<OrderHis> ohcancel = (ArrayList<OrderHis>)request.getAttribute("ohcancel");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>Cho-당신을 위한 반려식물</title>
<!--타이틀 아이콘-->
<link rel="shortcut icon" type="image⁄x-icon"
	href="<%=request.getContextPath()%>/images/logo.png">
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/4b6b63d8f6.js"
	crossorigin="anonymous"></script>
<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<!-- popper 툴팁 -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<!-- 부트스트랩 스크립트(jQuery보다 아래 있어야함) -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

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
.container {
	padding-top: 2%;
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

td {
	padding: 6px;
}

td.ordertd {
	padding: 6px;
}
/* 주문 내역 테이블 크기 */
.ordertd {
	vertical-align: middle;
	width: 14%;
}

.table td, table th {
	vertical-align: middle !important;
}

/* 버튼 CSS */
.button1 {
	padding: 8px 18px;
	margin: 5px;
	border-radius: 8px;
	color: black;
	border: 1px solid #115D8C;
	background-color: white;
	width: 100px;
	height: 42px;
}

.cancelRequestBtn {
	padding: 8px 18px;
	margin: 5px;
	border-radius: 8px;
	color: black;
	border: 1px solid #115D8C;
	background-color: red;
	width: 100px;
	height: 42px;
}

.button1 :hover {
	border-radius: 8px !important;
	background: #6AAED9 !important;
	color: white !important;
	transition: 0.2s !important;
}

.button1 :active {
	border-radius: 8px !important;
	background: #012340 !important;
}

#orderbutton {
	text-align: right;
}

.cancelListBtn {
	padding: 8px 18px;
	margin: 5px;
	border-radius: 8px;
	color: black;
	border: 1px solid #115D8C;
	background-color: white;
	width: auto;
	height: auto;
	text-align: right !important;
}

.orderHistoryBtn {
	padding: 8px 18px;
	margin: 5px;
	border-radius: 8px;
	color: black;
	border: 1px solid #115D8C;
	background-color: white;
	width: auto;
	height: auto;
	text-align: right !important;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<%@include file="myPageCategory.jsp"%>
			</div>
			<!-- 9단길이의 첫번째 열 -->
			<div class='col-md-9'>
				<fieldset>

					<div class="table" id='cancelListTable'>
						<h1>취소 내역</h1>
						<form>
							<table>
								<thead>

									<tr class='ollist' style='border-bottom: 2px solid black'>
										<input type="text" style="display: none;"
											value="<%=loginUser.getMemberNo()%>" id="memberNo"
											name="memberNo">
										<td>주문번호</td>
										<td>상품이미지</td>
										<td>상품번호</td>
										<td>상품명</td>
										<td>재주문</td>
									</tr>
								</thead>
								<%if(ohcancel.isEmpty()||ohcancel.size()==0){ %>
								<tr class='ollist' style='border-bottom: 2px solid black'>
									<td style="padding: 15px" class='ordertd' colspan="7"
										style="font-size:1rem">취소 내역이 존재하지 않습니다.</td>
								</tr>
								<%}else{%>
								<%for(int i=0;i<ohcancel.size();i++){%>
									<%if((ohcancel.get(i).getOrderCancelYN()).equals("Y")){ %>
								<tr class='ollist' style='border-bottom: 2px solid black'>
									<td class='ordertd'><%=(ohcancel.get(i)).getOrderNo()%></td>
									<td class='ordertd'><img
										src='<%=request.getContextPath()%>/items_uploadFiles/<%=(ohcancel.get(i)).getImageName()%>'
										width='150px' height='150px'></td>
									<td class='ordertd'><%=(ohcancel.get(i)).getItemNo()%></td>
									<td class='ordertd'><%=(ohcancel.get(i)).getItemName()%></td>
									<td class='ordertd'><button type='button' class='button1' id="<%=(ohcancel.get(i)).getOrderNo()%>odBtn">재주문</button></td>
								</tr>
										<%}%>
									<%} %>
								<tr>
									<td colspan="6" class="ordertd" align="right"><input
										type="button" class="orderHistoryBtn" value="주문 내역"></td>
								</tr>
								<%} %>
							</table>

						</form>
					</div>
				</fieldset>
			</div>
		</div>
	</div>
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
			
			<!-- 재주문 버튼 시작 -->
			<%for(int i=0;i<ohcancel.size();i++){ %>
			<script>
				$(function(){
					$("#<%=(ohcancel.get(i)).getOrderNo()%>odBtn").click(function(){
						
					})
				})
			</script>
			<%} %>
			<!-- 재주문 버튼 끝 -->

			<!-- 주문 내역 돌아가기 버튼 시작 -->
			<script>
				$(function(){
					$(".orderHistoryBtn").mouseenter(function(){
						$(this).css({"background":"#6AAED9","color":"white","transition":"0.2s","border-radius":"8px"});
					}).mouseout(function(){
						$(this).css({"padding":"8px 18px","border-radius":"8px","color":"black","border":"1px solid #11538C","background-color":"white", "width":"auto", "height":"auto"});
					});
					$(".orderHistoryBtn").click(function(){
						location.href="<%=request.getContextPath()%>/ohlist.bo?memberNo=<%=loginUser.getMemberNo()%>";
					})
				})
			</script>
			<!-- 주문 내역 돌아가기 버튼 끝 -->

	<%@ include file="../common/footer.jsp"%>
</body>
</html>