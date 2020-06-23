<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cho-당신을 위한 반려식물</title>
<!--타이틀 아이콘-->
<link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/images/logo.png">
<style>
/* item search start */
.item-search {margin-top:5rem;}
.itemsearch-row {border: 0.1rem solid lightgray; margin:0 0.5rem; border-radius:1rem;}
.itemsearch-form {margin:auto; padding:2rem;}
.form-group {padding-left:1rem; padding-right:1rem;}
.itemsearch-label {margin-right:1rem;}
/* item search end */
</style>
</head>
<body>
	<!--SEARCH-->
	<div class="container item-search">
		<div class="row title-row">
			<p class="h1">SEARCH</p>
		</div>
		<div class="row itemsearch-row">
			<form class="form-inline itemsearch-form">
				<div class="form-group itemsearch-price">
					<label class="itemsearch-label">가격대</label>
					<input type="text" class="form-control form-control-sm" id="priceMin" value="" placeholder="10,000" pattern="/^[0-9]$/">
					<span>&nbsp;~&nbsp;</span>
					<input type="text" class="form-control form-control-sm" id="priceMax" value ="" placeholder="50,000">
				</div>
				<div class="form-group itemsearch-name">
					<label class="itemsearch-label">제품명/키워드</label>
					<input type="text" class="form-control form-control-sm" id="itemNameKeyword" value="" placeholder="한글로 입력하세요.">
				</div>
				<div class="form-group itemsearch-btn">
					<button type="button" id="search-btn" class="btn btn-secondary btn-sm btn-searchbutton">검색하기</button>
				</div>
			</form>
		</div>
	</div>





	<!--SEARCH 유효성 검사-->
	<script>
			$(function() {
				$("#priceMin, #priceMax").on("change", function() {
					this.value = this.value.replace(/\D/g, "");
				}).on("keyup", function() {
					this.value = this.value.replace(/\D/g, "");
				})
			})
	</script>
	
	
	
	
	
	<!--SEARCH 검색 내용이 담길 FORM -->
	<form action="<%=request.getContextPath()%>/itemSearch.it" method="post" id="searchForm" name="searchForm">
		<input type="hidden" id="searchPriceMin" name="searchPriceMin">
		<input type="hidden" id="searchPriceMax" name="searchPriceMax">
		<input type="hidden" id="searchWhat2" name="searchWhat">
	</form>	
	
	<!--SEARCH 검색-->
	<script>
		$(function(){
			$("#search-btn").click(function(){
				
				var priceMin = $("#priceMin").val();
				var priceMax = $("#priceMax").val();
				var searchWhat = $("#itemNameKeyword").val();
				
				if(priceMin == "") {
					priceMin = 0;
				}
				
				if(priceMax == "") {
					priceMax = 99999;
				}
				
				if(searchWhat == "") {
					searchWhat = "anything";
				}
				
				$("#searchPriceMin").val(priceMin);
				$("#searchPriceMax").val(priceMax);
				$("#searchWhat2").val(searchWhat);
								
 				$("#searchForm").submit();
			})
		})
	</script>
	
	
</body>
</html>