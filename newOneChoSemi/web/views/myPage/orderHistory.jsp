<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="order.model.vo.*,java.util.ArrayList"%>
	<%-- <%Page pg = (Page)request.getAttribute("pg");
	  ArrayList list = (ArrayList)request.getAttribute("list");
	  
	  int listCount = pg.getListCount();
	  int currentPage = pg.getCurrentPage();
	  int maxPage = pg.getMaxPage();
	  int startPage = pg.getStartPage();
	  int endPage = pg.getEndPage();
	%>  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.container{
			padding-top:2%;
		}
		
		fieldset {
            height: auto;
            margin: 5px;
            margin-bottom: 50px;
            background: white;
            padding-left: 50px;
            padding-right: 50px;
            text-align: center;
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
			width:105px;
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
	</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="container">
		<div class="row">
		<div class="col-md-3">
		<div class="panel panel-info">
			<div class="panel-heading">
				<!-- 패널 타이틀1 -->
				<h3 class="panel-title">
					<span>마이 페이지</span>
				</h3>
			</div>
			<!-- 사이드바 메뉴목록1 -->
			<ul class="list-group">
						<a href="<%=request.getContextPath()%>/views/myPage/grade.jsp">
							<li class="list-group-item">회원 등급</li>
						</a>
						<a href="<%=request.getContextPath()%>/infor.me?memberId=<%=loginUser.getMemberId()%>">
							<li class="list-group-item">개인 정보 수정</li>
						</a>
						<%-- <a href="<%=request.getContextPath();%>/list.bo"> --%>
						<a href="<%=request.getContextPath()%>/views/myPage/orderHistory.jsp">
							<li class="list-group-item">주문 내역 조회</li>
						</a>
						<a href="<%=request.getContextPath() %>/wish.me?memberNo=<%=loginUser.getMemberNo()%>">
							<li class="list-group-item">위시리스트</li>
						</a>
						<a href="<%=request.getContextPath()%>/views/myPage/withdrawal.jsp">
							<li class="list-group-item">회원 탈퇴</li>
						</a>
					</ul>
				</div>
			</div>
			<%@include file="myPageCategory.jsp" %>
			<!-- 9단길이의 첫번째 열 -->
			<div class='col-md-9'>
				<fieldset>
					<div class="table" id='jointable'>
						<h1>주문 내역</h1>
						<br>
						<form>
							<table>
								<thead>
									<tr class='ollist' style='border-bottom: 2px solid black'>
										<td>주문번호</td>
										<td>상품이미지</td>
										<td>상품번호</td>
										<td>상품명</td>
										<td>수량</td>
										<td>배송상태</td>
										<td>기타</td>
									</tr>
								</thead>
								<%-- <%if(list.isEmpty()){%>
								<tr class='ollist' style='border-bottom: 2px solid black'>
									<td class='ordertd' colspan="7">주문 내역이 없습니다.</td>								
								</tr>
								<%}else{ %>
									<%for(int i=0;i<list.size();i++){ %>
										<tr>
											<input type="hidden" value="<%=((Order)list.get(i).getOrderId()) %>">
										</tr>
									<%} %>
								<%} %> --%>
								<tr class='ollist' style='border-bottom: 2px solid black'>
									<td class='ordertd'>???</td>
									<td class='ordertd'><img src='flo.jpg' width='150px'
										height='150px'></td>
									<td class='ordertd'>???</td>
									<td class='ordertd'>???</td>
									<td class='ordertd'>???</td>
									<td class='ordertd'>배송중</td>
									<td id='orderbutton'><a href='main.jsp' id='delete'><button
												type='button' class='button1'>취소신청</button></a><br> <a
										href='main.jsp' id='delete'><button type='button'
												class='button1'>리뷰쓰기</button></a><br> <a href='main.jsp'
										id='delete'><button type='button' class='button1'>상세보기</button></a></td>
								</tr>
								<tr class='ollist' style='border-bottom: 2px solid black'>
									<td class='ordertd'>???</td>
									<td class='ordertd'><img src='flo.jpg' width='150px'
										height='150px'></td>
									<td class='ordertd'>???</td>
									<td class='ordertd'>???</td>
									<td class='ordertd'>???</td>
									<td class='ordertd'>배송중</td>
									<td id='orderbutton'><a href='main.jsp' id='delete'><button
												type='button' class='button1'>취소신청</button></a><br> <a
										href='main.jsp' id='delete'><button type='button'
												class='button1'>리뷰쓰기</button></a><br>
										<button id='myBtn' data-toggle='modal' data-target='#intro'
											type='button' class='button1'>상세보기</button></td>
								</tr>
							</table>
						</form>
					</div>
					<%-- <div class="paginArea" align="center">
			<!-- 맨 처음으로(<<) -->
			<button onclick="location.href='<%=request.getContextPath()%>/list.bo?currentPage=1'"><<</button>
			
			<!-- 이전 페이지로(<) -->
			<button onclick="location.href='<%=request.getContextPath()%>/list.bo?currentPage=<%=currentPage-1%>'"><</button>
			
			<!-- 10개의 페이지 목록 --> 
			<%for(int p=startPage ;p<=endPage ;p++){ %>
				<% if(p == currentPage){ %>
					<button disabled><%=p %></button>
				<%}else{ %>
					<button  onclick="location.href='<%=request.getContextPath()%>/list.bo?currentPage=<%=p%>'"><%=p %></button>
				<%} %>
			<%} %>
			<!-- 다음 페이지로(>) -->
			<button onclick="location.href='<%=request.getContextPath()%>/list.bo?currentPage=<%=currentPage+1%>'">></button>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%=request.getContextPath()%>/list.bo?currentPage=<%=maxPage%>'">>></button>
			
		</div> --%>
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
            			"width":"105px", "height":"42px"});
            		});
            	});
            </script>
			<%@ include file="../common/footer.jsp"%>
</body>
</html>