	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cartList.model.vo.Cart, cartList.model.vo.WishList, java.util.ArrayList"%>
<%
	ArrayList<Cart> cartList = (ArrayList<Cart>)request.getAttribute("cartList");
	ArrayList<WishList> wishList =  (ArrayList<WishList>)request.getAttribute("wishList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">	
	<title>Cho-당신을 위한 반려식물</title>
	<!--타이틀 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath() %>/images/logo.png">
	
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
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	* { font-family: "basicFont"; }
	/* font end */
</style>
    
<!-- 장바구니 통합 css -->
<style>
    /* 테이블 크기 테스트 css */
    /* table, thead, tbody, tfoot, td, th{ border: 1px solid; } */

    /* 장바구니 start */
    .carttable-container { margin-bottom: 100px; }
    
    .listhead { margin: 50px 0 30px 0; text-align: center; }
    .listhead h2 {
        padding: 20px;
    }
    .carttable {
        border-collapse: collapse;
        vertical-align: middle;
        text-align: center;
        width: 100%;
        padding: 0;
        margin: 0;
    }
    .carttable tr {
        border-bottom: 1px solid gray;
    }
    .carttable td:last-child {
        border-bottom: none;
    }
    .carttable thead {
        margin: 0;
        padding: 0;
        font-size: 1.2rem;
    }
    .carttable tfoot td{
        padding: 30px 0 30px 0;
    }
    .carttable tfoot button{
        font-size: 20px;
        padding: 10px 50px 10px 50px;
        margin: 0 10px 0 10px;
    }
    .carttable input{
        width: 15px;
        height: 15px;
    }

    .carttable img {
        width: 100px;
        height: 100px;
        padding: 10px 10px 10px 10px;
    }
    .carttable .emptyCart {
        height: 300px;
    }
    .carttable thead td:nth-child(1) {
        width: 50px;
        font-size: 0px;
    }
    .carttable tbody td:nth-child(1) {
        width: 50px;
        font-size: 0px;
    }
    .carttable thead td:nth-child(2) {
        width: 120px; 
        height: 50px;  
    }
    .carttable tbody td:nth-child(2) {
        width: 120px; 
        height: 120px;  
    }
    .carttable td:nth-child(3) {
        min-width: 50px;
        width: auto;
        orverlfow: hidden;
        text-overflow: ellipsts;
        white-space: nowrap;
    }
    .carttable tbody td:nth-child(3){
        min-width: 100px;
        padding-left: 15px;
        text-align: left;
    }        
    .carttable td:nth-child(4) {
        width: 103px;
        min-width: 103px;
    }
    .carttable td:nth-child(5) {
        width: 100px;
        min-width: 80px;
        text-align: right;
    }
    .carttable thead td:nth-child(6),
    .carttable tbody td:nth-child(6) {
        width: 50px;
        min-width: 25px;
        transform: translate(0, 6px);
    }
    .cart_total_count::after {
        content: " 개 선택";
    }
    .carttable tbody td:nth-child(5)::after {
        content: " 원";
    }
    .carttable tbody td:nth-child(5) span[class=price] {
        display: none;
    }
    .trash{
        background: url("<%=request.getContextPath() %>/images/cart/trash-alt-regular.svg") no-repeat center;
        border: none;
        width: 20px;
        height: 20px;
        padding: auto;
        cursor: pointer;
        vertical-align: center;
    }
    /* 장바구니 수량 css */
    .carttable input[type=number] {
        float: left;
        width: 40px;
        height: 35px;
        padding: 0;
        text-align: center;
        border: 1px lightgray solid;
        pointer-events: none;
    }

    .carttable span.spinner {
        /* position: absolute; */
        padding: 0;
        height: 40px;
        user-select: none;
    }

    .carttable span.spinner>.sub,
    .carttable span.spinner>.add {
        float: left;
        display: block;
        width: 30px;
        height: 35px;
        text-align: center;
        line-height: 33px;
        border: 1px lightgray solid;
        border-right: 0;
        border-radius: 2px 0 0 2px;
        cursor: pointer;
        transition: 0.1s linear;
    }
    .carttable span.spinner>.add {
        top: 0;
        border: 1px lightgray solid;
        border-left: 0;
        border-radius: 0 2px 2px 0;
    }
    .carttable span.spinner>.sub:hover,
    .carttable span.spinner>.add:hover {
        background: #1f598c;
        color: white;
    }
    .carttable input[type=number]::-webkit-inner-spin-button,
    .carttable input[type=number]::-webkit-outer-spin-button {
        -webkit-appearance: none;
    }
    /* imput spinner end */
    /* 장바구니 end */
</style>
<!-- 즐겨찾기 스타일 -->
<style>
    .wishlist-container{
        text-align: center;
    }
    .wishlist-container .emptyWish{
        padding: 150px;
    }
    .wishcardcol {
        margin: auto;
        padding: 5px;
        min-width: 253px;
    }
    .wishcardcol tbody{ 
    	text-align: left; 
    }
    .wishcardcol tbody th{
        font-size: 25px;
    }
    .wishcardcol td {
        height: 30px;
    }
    .wishcardcol td[class^=wishprice]{ 
    	text-align: right; 
    }
    .wishcardcol td[class^=wishprice]::after{
        content: " 원";
    }
    .wishcardcol .wishmemo{
        margin-top: 10px;
        margin-bottom: 0;
    }
    .tablepadding {
        padding: 5px;
    }
    .wishcardcol table {
        width: 100%;
        height: 100%;
    }
    .wishcardcol input {
        border: none;
        width: 100%;
    }
    .wishcardcol td[class^=wishprice] {
        min-width: 200px;
    }
    .memoicon {
        margin: 0;
        padding: 0;
        width: 25px;
        min-width: 25px;
        text-align: center;
        transform: translateY(15px);
    }
    .memoicon .pen{
        display: inline;
        font-size: 20px;
        border: none;
        cursor: pointer;
        vertical-align: bottom;
    }
    .memoicon .save{
        display: none;
        font-size: 20px;
        border: none;
        cursor: pointer;
        vertical-align: bottom;
    }
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>

	<!-- 장바구니 -->
	<form id="orderForm" action="<%=request.getContextPath() %>/order.or?userNo=<%=userNo %>" method="post">
	<div class="container carttable-container">
	    <div class="listhead">
	        <h2>장바구니</h2>
	        <h6>주문하실 상품명 및 수량을 확인해 주세요.</h6>
	    </div>
	    <table class="carttable">
	        <thead>
		        <tr>
					<td><input type="checkbox" name="clearCart"></td>
					<td>전체</td>
					<td></td>
					<td></td>
					<td class="cart_total_count">0</td>
					<td><label for="allTrash"><input type="button" id="allTrash" class="trash"></label></td>
		        </tr>
		        <tr>
		            <td></td>
		            <td></td>
		            <td>상품명</td>
		            <td>수량</td>
		            <td>상품금액</td>
		            <td></td>
		        </tr>
	        </thead>
	        <%if(cartList.isEmpty() || cartList.size() == 0) {%>
	        <tbody class="cartList_tbody">
	            <tr>
	                <td class="emptyCart" colspan="6" style="font-size:1.5rem">장바구니에 상품이 없습니다.</td>
	            </tr>
	        </tbody>
	        <%} else { %>
	        <tbody class="cartList_tbody">
			        <%for(int i = 0 ; i < cartList.size() ; i++) {%>
	        		<tr>
		        		<td><input type="checkbox" class="cart_checkbox" name="cartNo" value="<%=cartList.get(i).getCartListNo()%>"></td>
		        		<td><img class="cartImg" src="<%=request.getContextPath()%>/items_uploadFiles/<%=cartList.get(i).getImageName()%>" alt="상품(<%=cartList.get(i).getImageName()%>)"></td>
		        		<td class="cartName"><%=cartList.get(i).getItemName()%></td>
		        		<td><input type="number" class="cart_count" name="cartItCo" max="<%=cartList.get(i).getItemMax()%>" min="1" value="<%=cartList.get(i).getCartListCount()%>" step="1" disabled></td>
		        		<td><span class="cal_price"><%=cartList.get(i).getCartListCount() * cartList.get(i).getItemPrice()%></span><span class="price"><%=cartList.get(i).getItemPrice()%></span></td>
		        		<td><label for="trash<%=i%>"><input type="button" id="trash<%=i%>" class='trash'></label></td>
	        		</tr>
		        	<%} %>
			</tbody>
	        <%} %>
	        <tfoot>
	        <tr>
	            <td colspan="6">
	            <button class="btn btn-outline-info my-5 my-sm-0" type="button" onclick="goHome()">계속쇼핑</button>
	            <button class="btn btn-outline-info my-5 my-sm-0" type="button" onclick="order()">주문하기</button>
	            </td>
	        </tr>
	        </tfoot>
	    </table>
	    
	</div>
	</form>
    <!-- 수량 버튼 스크립트 -->
    <script>
        (function ($) {
            $.fn.spinner = function() {
                this.each(function() {
                    var el = $(this);

                    // add elements
                    el.wrap('<span class="spinner"></span>');
                    el.before('<span class="sub">-</span>');
                    el.after('<span class="add">+</span>');

                    // substract
                    el.parent().on('click', '.sub', function () {
                    if (el.val() > parseInt(el.attr('min'))){
                        el.val(function(i, oldval) { return --oldval; });
                        //console.log(el.val());
                    }
                        // 수량 감소 가격 계산 
                        var td = el.parents("tr").children("td:nth-child(5)").children(".price").text();
                        el.parents("tr").children("td:nth-child(5)").children(".cal_price").text(td*el.val());
                    });

                    // increment
                    el.parent().on('click', '.add', function () {
                    if (el.val() < parseInt(el.attr('max'))){
                        el.val(function(i, oldval) { return ++oldval; });
                        //console.log(el.val());
                    } else {
                    	alert("1회 구매 최대 수량입니다.");
                    }
                        // 수량 증가 가격 계산
                        var td = el.parents("tr").children("td:nth-child(5)").children(".price").text();
                        el.parents("tr").children("td:nth-child(5)").children(".cal_price").text(td*el.val());
                    });
                });
            };
        })(jQuery);// 수량 버튼 스크립트 끝
        $('input[class=cart_count]').spinner();
    </script>
    
    <script>
    	function goHome() {
    		location.href="<%=request.getContextPath()%>/index.jsp";
		}
    
    	// 구매 상품 확인 후 결제 페이지로 이동
		function order() {
            var orderCheckeds = $("input:checkbox[class=cart_checkbox]:checked");
            var disabledChg = $("input:checkbox[class=cart_checkbox]");
           	//console.log("구매하려는 상품 수량 : " + orderCheckeds.length);
	        if(orderCheckeds.length == 0){
            	alert("구입하려는 상품을 체크 해주세요.");
            } else {
	        	// 구매 해려는 상품의 수량만 폼태그에 담아 보내기 위해 input number의 값 전송을 막는 속성인 disabled를 false로 변환
	        	for(var i = 0 ; i < disabledChg.length ; i++) {
	        		//console.log(disabledChg[i]);
		        	if(disabledChg[i].checked == true){
		        		$("input:checkbox[class=cart_checkbox]").eq(i).parents("tr").children().children().children(".cart_count").prop("disabled",false);
		        	}
	        	}
				$("#orderForm").submit();
            }
		}
	</script>

    <!-- 상품 삭제 스크립트 -->
    <script>
		// 전체 선택
		$(".carttable thead input:checkbox").change(function(){
		    var bool = $(this).prop("checked");
		    $(".carttable tbody input:checkbox").prop("checked",bool);
		    checkCount();
		});
		// 개별 선택 카운트
		$(".carttable tbody input:checkbox").click(function(){
			checkCount();
		});
		// 전체 선택 카운트
		function checkCount(){
		    var checkeds = $("[class=cart_checkbox]:checked");
		    var count = 0;
		    for(var i = 0; i < checkeds.length ; i++){
		        if(checkeds[i].checked == true){
		            count++;
		        }
		    }
		    $(".cart_total_count").html(count);
		}
		$("#allTrash").click(function(){
		    deleteChecked();
		});
		// 선택항목 한번에 삭제
		function deleteChecked(){
			var index = $(".carttable input:checkbox[class=cart_checkbox]:checked");
			var count = $(".cart_total_count").text();
			// 선택 항목이 있을 때 작동
			if(count != 0){
				var result = confirm("삭제 하시겠습니까?");
				// 삭제 재확인 후 삭제
				if(result){
					// ajax 부분
					var cartArr = new Array();
					for(var i = 0 ; i < index.length ; i++){
						cartArr.push(index.eq(i).parents("tr").children("td:first-child").children(".cart_checkbox").val());
						console.log(index.eq(i).parents("tr").children("td:first-child").children(".cart_checkbox").val());
					}
					console.log(cartArr);
	
					$.ajax({
						url:"<%=request.getContextPath()%>/deleteCartList.ca",
						type:"post",
						data:{cartArr:cartArr},
						success:function(data){
							if(data == "fail"){
								alert("삭제에 실패 했습니다.");
							} else {
								for(var i = index.length ; i > -1 ; i--){
									console.log("삭제할 cartIndex : " + i);
									index.eq(i).closest("tr").remove();
								}
								$(".carttable thead input:checkbox").prop("checked",false);
								checkCount();
								checkEmptyCart();
							}
						},
						error:function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				}
			}
		}
       // 개별항목 삭제
		$(".carttable tbody tr td input:button").click(function(){
			var result = confirm("삭제 하시겠습니까?");
			var cartItem = $(this);
			// 삭제 재확인 후 삭제
			if(result){
	                      	
	       	// ajax 부분
			var cartNo = $(this).parents("tr").children("td:first-child").children(".cart_checkbox").val();
			//console.log($(this).parents("tr").children("td:first-child").children(".cart_checkbox").val());
									
				$.ajax({
					url:"<%=request.getContextPath()%>/deleteCart.ca",
					type:"post",
					data:{cartNo:cartNo},
					success:function(data){
						if(data == "fail"){
							alert("삭제에 실패 했습니다.");
						} else {
							cartItem.parents("tr").remove();
							checkCount();
							checkEmptyCart();
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		});
		// 상품이 없으면 상품 없음 행 보임
		function checkEmptyCart(){
			//console.log("tr " + $(".carttable > tbody tr").length);
			if($(".carttable > tbody tr").length == 0){
			// 상품 없음 테이블 추가
			$cartListTbody = $(".cartList_tbody");
			var $tr = $("<tr>");
			var $writerTd = $("<td>").addClass("emptyCart").attr("colspan","6").css("font-size","1.5rem").text("장바구니에 상품이 없습니다.");
			$tr.append($writerTd);
			$cartListTbody.append($tr);
			}
		}
    </script>
    
	<!-- 위시 리스트 -->
	<div class="container wishlist-container">
	    <div class="listhead wishListhead">
	        <h2>위시 리스트</h2>
	        <h6>즐겨찾은 상품에 메모를 남겨보세요.</h6>
	
    	<%if(wishList.isEmpty() || wishList.size() == 0) {%>
			
			<div class="emptyWish" style="font-size:1.5rem">즐겨 찾기가 비어 있습니다.</div>

    	<%} else { %>
	    </div>
	    <div class="wishCardRow row mb-2">
			<%for(int i = 0 ; i < wishList.size() ; i++) {%>
				<!-- card item <%=i %> -->
				<div class="wishcardcol col-md-3 pb-3">
				    <div class="card">
				        <img class="card-img-top cards_imgSize" src="<%=request.getContextPath()%>/items_uploadFiles/<%=wishList.get(i).getImageName() %>" alt="Wish List <%=wishList.get(i).getImageName() %>">
				        <div class="card-body tablepadding">
				            <table>
				                <tbody>
				                    <tr><th class="wishName" colspan="3"><%=wishList.get(i).getItemName() %><input class="wishId" type="hidden" value="<%=wishList.get(i).getItemNo() %>"></th></tr>
				                    <tr>
				                        <td>가격</td>
				                        <td class="wishprice" colspan="2"><%=wishList.get(i).getItemPrice() %></td>
				                    </tr>
				                    <tr>
				                        <td colspan="2">
				                            <label class="wishmemo">memo</label><br>
				                            <input class="memo" type="text" placeholder="메모를 남겨보세요." value="<%=wishList.get(i).getWishListMemo() %>" readonly>
				                            <span class="wishNumber" style="display:none"><%=wishList.get(i).getWishListNo() %></span>
				                        </td>
				                        <td class="memoicon">
				                            <i class='pen far fa-edit'></i>
				                            <i class='save far fa-check-circle'></i>
				                        </td>
				                    </tr>
				                </tbody>
				            </table>
				        </div>
				        <div class="card-foot mb-2 wishbutton">
				            <button type="button" class="wishToCart btn btn-outline-info my-5 my-sm-0">장바구니 추가</button>&nbsp;
				            <button type="button" class="wishDelete btn btn-outline-info my-5 my-sm-0">삭제</button>
				        </div>
				    </div>
				</div>
			<%} %>
        <%} %>
	    </div>
	    
	    <script>
	        // 메모 펜 아이콘 클릭
	        $(".pen").click(function(){
	            // 펜 안보임
	            $(this).css("display","none");
	            // 저장 보임
	            $(this).parent().children().last().css("display","inline");
	            // 메모 읽기모드 제거
	            $(this).parents("tr").children().first().children("input").removeAttr("readonly");
	            // 메모 인풋 테두리 생성
	            $(this).parents("tr").children().first().children("input").css("border","1px solid black");
	            // 메모 인풋에 포커스 이동
	            $(this).parents("tr").children().first().children("input").focus();
	        });
	        // 메모 저장 아이콘 클릭
	        $(".save").click(function(){
	            $(this).css("display","none");
	            $(this).parent().children().first().css("display","inline");
	            $(this).parents("tr").children().first().children("input").attr("readonly",true);
	            $(this).parents("tr").children().first().children("input").css("border","none");
	            
	            // ajax 부분
				var content = $(this).parents("tr").children().first().children("input").val();
				var wishNo = $(this).parents("tr").children().first().children("span").text();
				
				//console.log(content);
				//console.log(wishNo);
				
					$.ajax({
					url:"<%=request.getContextPath()%>/editWMemo.wi",
					type:"post",
					data:{wishNo:wishNo, content:content},
					success:function(data){// data(받는 데이터)
						if(data == "fail"){
							alert("메모를 다시 작성해주세요.");
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
	        });
	        // 메모입력시 엔터키 완료
	        $(".memo").keydown(function(key){
	            if (key.keyCode == 13){
	            	 $(".save").click();
	            }
	        });
	        // 즐겨찾기에서 카트로 추가
			$(".wishToCart").click(function() {
	        	var cartAdd = $(this);
				var wishNum = $(this).parents(".card").find(".wishNumber").text();
	        	var itemId = $(this).parents(".card").find(".wishId").val();
	        	var userNo = "<%=loginUser.getMemberNo() %>";
	        	
	        	var itemName = $(this).parents(".card").find(".wishName").text();
	        	var itemImg = $(this).parents(".card").find(".cards_imgSize").attr("src");
	        	var itemPrice = $(this).parents(".card").find(".wishprice").text();
	        	//console.log("wishNum : " + wishNum + "wishName : " + wishName + " wishImg : " + wishImg + " wishPrice : " + wishPrice);
	        	
				$.ajax({
					url:"<%=request.getContextPath()%>/wishtoCart.wi",
					type:"post",
					data:{wishNum:wishNum, itemId:itemId, userNo:userNo},
					success:function(data){	
		                if(data == "fail"){
		                	alert("장바구니 등록에 실패 했습니다.");
		                } else if(data == "duplication") {
		                	alert("장바구니 이미 등록된 상품 입니다.");
		                } else {
			                console.log("장바구니 상품 수 : " + $(".carttable > tbody tr td input:button").length);
							if($(".carttable > tbody tr td input:button").length == 0){
			                	// 상품 없으면 상품 추가 시 상품없음 테이블행 삭제
			                	$(".cartList_tbody").children("tr").remove();
							}
							
			              	$cartListTbody = $(".cartList_tbody");
													
			              	var $tr = $("<tr>");	
							// 1 td 상품 번호
							var $fstTd = $("<td>");
							var $fstInput = $("<input>").addClass("cart_checkbox").attr("type","checkbox").attr("name","cartNo").val(data[0].cartListNo);
							var $firstChd = $fstTd.append($fstInput);
							// 2 td 상품 이미지
							var $scdTd = $("<td>");
							var $scdImg = $("<img>").addClass("cartImg").attr("src","<%=request.getContextPath()%>/items_uploadFiles/"+data[0].imageName).attr("alt",data[0].imageName);
							var $secondChd = $scdTd.append($scdImg);
							// 3 td 상품명
						 	var $trdTd = $("<td>").addClass("cartName").text(data[0].itemName);
							var $thirdChd = $trdTd;
							// 4 td 수량
							var $fouTd = $("<td>");
							var $fouInput = $("<input>").addClass("cart_count").attr("type","number").attr("name","cartItCo").attr({max:10, min:1, step:1}).attr("disabled",true).val("1");
							var $fourthChd = $fouTd.append($fouInput);
							// 5 td 가격
							var $fifTd = $("<td>");
							var $fifSpan1 = $("<span>").addClass("cal_price").text(data[0].itemPrice);
							var $fifSpan2 = $("<span>").addClass("price").text(data[0].itemPrice);
							var $fifthChd = $fifTd.append($fifSpan1).append($fifSpan2);
							// 6 td 휴지통
							var $sixTd = $("<td>");
							var $sixLabel = $("<label>").attr("for", "trash" + $(".carttable > tbody tr td input:button").length);
							var $sixInput = $("<input>").addClass("trash").attr("type","button").attr("id","trash" + $(".carttable > tbody tr td input:button").length);
							var $sixLabelAdd = $sixLabel.append($sixInput);
							var $sixthChd = $sixTd.append($sixLabelAdd);
							
							$tr.append($firstChd);
							$tr.append($secondChd);
							$tr.append($thirdChd);
							$tr.append($fourthChd);
							$tr.append($fifthChd);
							$tr.append($sixthChd);
							$cartListTbody.append($tr);
							
							$('input[class=cart_count]:last').spinner();
		                } // 장바구니 데이터 (data) 가져옴
					},
						error:function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});		
				
				if($(".wishcardcol").length == 0){
                   	// 상품 없음 테이블 추가
                   	$wishListhead = $(".wishListhead");
   					var $div = $("<div>").addClass("emptyWish").css("font-size","1.5rem").text("즐겨 찾기가 비어 있습니다.");
						$wishListhead.append($div);
        		}
			});
	        
	        // 즐겨찾기 삭제
	        $(".wishDelete").click(function(){
	            var result = confirm("삭제 하시겠습니까?");
	           	var wishDelete = $(this);
	            // 삭제 재확인 후 삭제
	            if(result){
	            	
            	// ajax 부분
            	var wishNum = $(this).parents(".card").find(".wishNumber").text();
				console.log($(this).parents(".card").find(".wishNumber").text());
				//console.log($(this).parents(".card").children().children("table").children().children(":nth-child(3)").children(":first").children(":last").text());
				//console.log($(this).parent().parent().first().children().children().first().children().children().last().children().first().children().last().text());
											
					$.ajax({
					url:"<%=request.getContextPath()%>/deleteWish.wi",
					type:"post",
					data:{wishNo:wishNo},
					success:function(data){
						if(data == "fail"){
							alert("삭제에 실패 했습니다.");
						} else {
							wishDelete.parents(".wishcardcol").remove();
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
                
                if($(".wishcardcol").length == 0){
                   	// 상품 없음 테이블 추가
                   	$wishListhead = $(".wishListhead");
   					var $div = $("<div>").addClass("emptyWish").css("font-size","1.5rem").text("즐겨 찾기가 비어 있습니다.");
   					$wishListhead.append($div);
                }
            }
        });
	    </script>
	</div> <!-- wish container end -->

<%@ include file="../common/footer.jsp" %>
</body>
</html>