<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="item.model.vo.*, java.util.ArrayList"%>
<%
	String category = (String)request.getAttribute("category");
	int categoryCount = (Integer)request.getAttribute("categoryCount");
	ArrayList<Item> categoryList = (ArrayList)request.getAttribute("categoryList");
	
	int colCount = 4;
	int rowCount = (int)((double)categoryCount/colCount + 0.9);
	int remain = categoryCount % colCount;
	
	if(categoryCount > 5 && remain == 0) {
		remain = 4;
	}
	
	String keyword = "";
	String key1 = "";
	String key2 = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cho-당신을 위한 반려식물</title>
<!--타이틀 아이콘-->
<link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/images/logo.png">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<style>
/* font start */
@font-face {font-family:'basicFont'; src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff'); font-weight: normal; font-style: normal;}
* {font-family: "basicFont";}
/* font end */

/* item page */
.item-container {margin-top:10rem;}
#item-card {width:15rem; height:28rem; border-radius:0px; border:none; text-align:center;}
#item-card:focus,
#item-card:hover {cursor:pointer;}
.title-row {border-bottom:0.3rem solid lightgray; margin-bottom:3rem;}
.item-row {padding-left:1rem; padding-right:1rem;}
.item-card-title {margin-bottom:0rem; font-size:1.3rem;}
.item-order {margin:0; padding:0; list-style:none; display:inline-flex;}
.item-order li {padding:0 0.5rem;}
.item-card-text {margin-bottom:0rem; color:gray;}
#keyword-badge {margin-bottom:0.5rem;}
.card-image-zoom {overflow: hidden;}
.card-image-zoom img {transition-duration: 0.3s; transition-timing-function: ease;}
.card-image-zoom:hover img {transform: scale(1.1);}
.title-col {padding:0rem;}
.title-col-order {padding:0rem; padding-top:1.2rem;}
#all-item-order li::hover {font-color:black; !important}
#keyword-badge {background-color:#5b89a6;}
/* item page end */

/* pagination */
#item-pagination * {color:#2d2d2d;}
#item-pagination li > a:focus,
#item-pagination li > a:hover, 
#item-pagination li > span:focus, 
#item-pagination li > span:hover {color: #2d2d2d; background-color: lightgray;}
/* pagination */
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<section>
		<%@ include file="itemSearch.jsp"%>
		
		
				
		<!--RESULT-->
		<form>
			<div class="container item-container">
				<div class="row title-row">
					<div class="col-sm title-col">
						<h1 class="display-6"><%=category%></h1>
					</div>
					<div class="col-sm title-col-order">
						<ul class="float-right item-order" id="all-item-order">
							<li><a href="#" style="color: grey">낮은가격</a></li>
							<li><a href="#" style="color: grey">높은가격</a></li>
							<li><a href="#" style="color: grey">제품명</a></li>
						</ul>
					</div>
				</div>				
				<%for(int i = 0; i < rowCount; i++) {%>
				<div class="row item-row">
					<%if (i != rowCount-1) {%>
					<%for (int j = 0; j < colCount; j++) {%>
					<input type="hidden" value="<%=((Item)categoryList.get(4*i+j)).getItemNo()%>">
					<div class="col-3 col-sm item-col" id="item-col">
						<div class="card item-card" id="item-card">
							<input type="hidden" value="<%=((Item)categoryList.get(4*i+j)).getItemNo()%>">
							<div class="card-image-zoom">
								<img src="<%=request.getContextPath()%>/<%=((Item) categoryList.get(4*i+j)).getItemImagePath()%>/<%=((Item) categoryList.get(4*i+j)).getItemImageName()%>" class="card-img-top" alt="...">
							</div>
							<div class="card-body item-card-body">
								<p class="card-title item-card-title"><%=((Item) categoryList.get(4*i+j)).getItemName()%></p>
								<p class="card-text item-card-text">&#8361;<%=(((Item) categoryList.get(4*i+j)).getItemPrice()) - (((Item) categoryList.get(4*i+j)).getItemDiscount())%></p>
								<%if (!((Item) categoryList.get(4*i+j)).getItemKeywordNo().equals("K3")) {%>
								<a href="#" class="badge badge-info" id="keyword-badge" style="font-weight: lighter">#<%=((Item) categoryList.get(4*i+j)).getKeywordName()%></a><br>
								<%}else {%>
								<%
									keyword = ((Item) categoryList.get(4*i+j)).getKeywordName();
									key1 = keyword.split(",")[0];
									key2 = keyword.split(",")[1];
								%>
								<a href="#" class="badge badge-info" id="keyword-badge" style="font-weight: lighter">#<%=key1%></a>&nbsp;<a href="#" class="badge badge-info" id="keyword-badge" style="font-weight: lighter">#<%=key2%></a><br>
								<%}%>
								<a href="#" class="btn btn-outline-secondary btn-sm item-btn">VIEW DETAIL</a>
							</div>
						</div>
					</div>
					<%}%>
					<%}else {%>
					<%for(int j = 0; j < remain; j++) {%>
					<input type="hidden" value="<%=((Item) categoryList.get(4*i+j)).getItemNo()%>">
					<div class="col-3 col-sm item-col" id="item-col">
						<div class="card item-card" id="item-card">
							<input type="hidden" value="<%=((Item)categoryList.get(4*i+j)).getItemNo()%>">
							<div class="card-image-zoom">
								<img src="<%=request.getContextPath()%>/<%=((Item) categoryList.get(4*i+j)).getItemImagePath()%>/<%=((Item) categoryList.get(4*i+j)).getItemImageName()%>" class="card-img-top" alt="...">
							</div>
							<div class="card-body item-card-body">
								<p class="card-title item-card-title"><%=((Item) categoryList.get(4*i+j)).getItemName()%></p>
								<p class="card-text item-card-text">&#8361;<%=(((Item) categoryList.get(i)).getItemPrice()) - (((Item) categoryList.get(4*i+j)).getItemDiscount())%></p>
								<%if (!((Item) categoryList.get(4*i+j)).getItemKeywordNo().equals("K3")) {%>
								<a href="#" class="badge badge-info" id="keyword-badge"	style="font-weight: lighter">#<%=((Item) categoryList.get(4*i+j)).getKeywordName()%></a><br>
								<%}else {%>
								<%
									keyword = ((Item) categoryList.get(4*i+j)).getKeywordName();
									key1 = keyword.split(",")[0];
									key2 = keyword.split(",")[1];
								%>
								<a href="#" class="badge badge-info" id="keyword-badge" style="font-weight: lighter">#<%=key1%></a>&nbsp;<a href="#" class="badge badge-info" id="keyword-badge" style="font-weight: lighter">#<%=key2%></a><br>
								<%}%>
								<a href="#" class="btn btn-outline-secondary btn-sm item-btn">VIEW DETAIL</a>
							</div>
						</div>
					</div>
					<%}%>
					<%}%>
				</div>
				<%}%>
			</div>
		</form>
	</section>
	<script>
	// 아이템 카드 눌렀을 때 아이템 상세보기로 넘어가기
	$(function(){
		$(".item-card").click(function(){
			var itemNo = $(this).children("input").val();
			
			location.href="<%=request.getContextPath()%>/itemDetail.it?itemNo=" + itemNo;
		})
	})	
	</script>
	<%@ include file="../common/footer.jsp"%>
	<!-- 제이쿼리 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- popper 툴팁 -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<!-- 부트스트랩 스크립트(jQuery보다 아래 있어야함) -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<!-- 아이콘 -->
	<script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>
</body>
</html>