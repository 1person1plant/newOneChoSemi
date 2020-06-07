<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cartList.model.vo.Cart, java.util.ArrayList"%>
<%
	ArrayList<Cart> cartList = (ArrayList<Cart>)request.getAttribute("cartList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<title>Cho-당신을 위한 반려식물</title>
	<!-- 타이틀 아이콘 -->
	<link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath() %>/images/logo.png">
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<!-- popper -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<!-- 아이콘 -->
	<script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>
	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
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
        /* display: none; */
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
    /* type=number 기본 화살표 제거 */
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
        display: none;
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
    .wishcardcol tbody td:nth-child(2){
        min-width: 100px
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
<!-- data sample -->
<%-- <script> 
    var cartitem_img = "<%=request.getContextPath() %>/images/고무나무.jpg";
    var cartitem_title = "멜라닌고무나무 라탄바구니 세트";
    var cartitem_count = 2;
    var cartitem_price = "32000";
</script> --%>
</head>
<body>
<%@ include file="../common/header.jsp" %>

	<!-- 장바구니 -->
	<div class="container carttable-container">
	    <div class="listhead">
	        <h2>장바구니</h2>
	        <h6>주문하실 상풍명 및 수량을 정확하게 확인해 주세요.</h3>
	    </div>
	    <table class="carttable">
	        <thead>
	        <tr>
	            <td><input type="checkbox" name="clearCart"></td>
	            <td>전체</td>
	            <td></td>
	            <td></td>
	            <td class="cart_total_count">0</td>
	            <td><label for="trash0"><input type="button" id="trash0" class="trash"></input></label></td>
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
	        <tbody>
	        <%if(cartList.isEmpty()) {%>
	            <tr>
	                <td class="emptyCart" colspan="6">상품이 없습니다.</td>
	            </tr>
	        <%} else { %>
				<form id="orderForm" action="<%=request.getContextPath() %>/order.or?userNo=<%=userNo %>" method="post">
	        	<%int i = 0; %>
		        <%for(Cart c : (ArrayList<Cart>)cartList) {
	        		i++;
	        		out.println("<tr class='cartitem" + i + "'>");
	        		out.println("<td><input type='checkbox' class='cart_checkbox' name='cartNo" + i + "'>" + c.getItemNo() + "</td>");
	        		out.println("<td><img src='" + request.getContextPath() + "/items_uploadFiles/" + c.getImageName() + "' alt='상품'></td>");
	        		out.println("<td>" + c.getItemName() + "</td>");
	        		out.println("<td><input class='cart_count' name='cartCount" + i + "' type='number' min='1' max='" + c.getItemMax() + "' value='" + (int)c.getCartListCount() + "' step='1'></td>");
	        		out.println("<td><span class='cal_price'>" + c.getCartListCount() * c.getItemPrice() + "</span><span class='price'>" + c.getItemPrice() + "</span></td>");
	        		out.println("<td><label for='trash1'><input type='button' id='trash1' class='trash'></input></label></td>");
	        		out.println("</tr>");
	        	} %>
				</form>
	        <%} %>
			</tbody>
	        <tfoot>
	        <tr>
	            <td colspan="6">
	            <button class="btn btn-outline-info my-5 my-sm-0" onclick="location.href='index.jsp'">계속쇼핑</button>
	            <button class="btn btn-outline-info my-5 my-sm-0" onclick="order()">주문하기</button>
	            </td>
	        </tr>
	        </tfoot>
	    </table>
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
	                        el.val(function(i, oldval) { 
	                        	return --oldval; 
	                        });
	                        console.log(el.val());
	                    }
	
	                        // 수량 감소 가격 계산 
	                        var td = el.parents("tr").children("td:nth-child(5)").children(".price").text();
	                        el.parents("tr").children("td:nth-child(5)").children(".cal_price").text(td*el.val());
	                    });
	
	                    // increment
	                    el.parent().on('click', '.add', function () {
	                    if (el.val() < parseInt(el.attr('max'))){
	                        el.val(function(i, oldval) { return ++oldval; });
	                        console.log(el.val());
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
			function order() {
				/* var checkboxs= $("[class=cart_checkbox]");
                for(var i = 0; i < checkboxs.length ; i++){
                    if(checkboxs[i].checked == false){
                    	checkboxs[i].attr("disabled",true);
                    	console.log(checkboxs[i].val());
                    }
                } */
				$("#orderForm").submit();
			}	
	    
		</script>

	    <!-- 상품 삭제 스크립트 -->
	    <script>
	        $(function(){
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
	            $("#trash0").click(function(){
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
	                        for(var i=index.length ; i>-1 ; i--){
	                            index.eq(i).closest("tr").remove();
	                        }
	                        $(".carttable thead input:checkbox").prop("checked",false);
	                        checkCount();
	                        checkEmptyCart();
	                    }
	                }
	            }
	            // 개별항목 삭제
	            $(".carttable tbody tr td input:button").click(function(){
	                var result = confirm("삭제 하시겠습니까?");
	                // 삭제 재확인 후 삭제
	                if(result){
	                    $(this).parents("tr").remove();
	                    checkCount();
	                    checkEmptyCart();
	                }
	            });
	        });
	    </script>
	    
	</div>
	<!-- 위시 리스트 -->
	<div class="container wishlist-container">
	    <div class="listhead">
	        <h2>위시 리스트</h2>
	        <h6>즐겨찾은 상품에 메모를 남겨보세요.</h3>
	        <div class="emptyWish">즐겨 찾기가 없습니다.</div>
	    </div>
	
	    <div class="wishCardRow row mb-2">
	        <!-- card item 1 -->
	        <div class="wishcardcol col-md-3 pb-3">
	            <div class="card">
	                <img class="card-img-top" src="<%=request.getContextPath() %>/images/고무나무.jpg" alt="Card image cap">
	                <div class="card-body tablepadding">
	                    <table>
	                        <tbody>
	                            <tr><th colspan="3">고목나무1</th></tr>
	                            <tr>
	                                <td>가격</td>
	                                <td class="wishprice" colspan="2">32000</td>
	                            </tr>
	                            <tr>
	                                <td colspan="2">
	                                    <label class="wishmemo">memo</label><br>
	                                    <input class="memo" type="text" placeholder="메모를 남겨보세요." readonly>
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
	                    <button class="wishToCart btn btn-outline-info my-5 my-sm-0">장바구니 추가</button>&nbsp;<button class="wishDelete btn btn-outline-info my-5 my-sm-0">삭제</button>
	                </div>
	            </div>
	        </div>
	        <!-- card item 2 -->
	        <div class="wishcardcol col-md-3 pb-3">
	            <div class="card">
	                <img class="card-img-top" src="<%=request.getContextPath() %>/images/고무나무.jpg" alt="Card image cap">
	                <div class="card-body tablepadding">
	                    <table>
	                        <tbody>
	                            <tr><th colspan="3">고목나무2</th></tr>
	                            <tr>
	                                <td>가격</td>
	                                <td class="wishprice" colspan="2">32000</td>
	                            </tr>
	                            <tr>
	                                <td colspan="2">
	                                    <label class="wishmemo">memo</label><br>
	                                    <input class="memo" type="text" placeholder="메모를 남겨보세요." readonly>
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
	                    <button class="wishToCart btn btn-outline-info my-5 my-sm-0">장바구니 추가</button>&nbsp;<button class="wishDelete btn btn-outline-info my-5 my-sm-0">삭제</button>
	                </div>
	            </div>
	        </div>
	        <!-- card item 3 -->
	        <div class="wishcardcol col-md-3 pb-3">
	            <div class="card">
	                <img class="card-img-top" src="<%=request.getContextPath() %>/images/고무나무.jpg" alt="Card image cap">
	                <div class="card-body tablepadding">
	                    <table>
	                        <tbody>
	                            <tr><th colspan="3">고목나무3</th></tr>
	                            <tr>
	                                <td>가격</td>
	                                <td class="wishprice" colspan="2">32000</td>
	                            </tr>
	                            <tr>
	                                <td colspan="2">
	                                    <label class="wishmemo">memo</label><br>
	                                    <input class="memo" type="text" placeholder="메모를 남겨보세요." readonly>
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
	                    <button class="wishToCart btn btn-outline-info my-5 my-sm-0">장바구니 추가</button>&nbsp;<button class="wishDelete btn btn-outline-info my-5 my-sm-0">삭제</button>
	                </div>
	            </div>
	        </div>
	        <!-- card item 4 -->
	        <div class="wishcardcol col-md-3 pb-3">
	            <div class="card">
	                <img class="card-img-top" src="<%=request.getContextPath() %>/images/고무나무.jpg" alt="Card image cap">
	                <div class="card-body tablepadding">
	                    <table>
	                        <tbody>
	                            <tr><th colspan="3">고목나무4</th></tr>
	                            <tr>
	                                <td>가격</td>
	                                <td class="wishprice" colspan="2">32000</td>
	                            </tr>
	                            <tr>
	                                <td colspan="2">
	                                    <label class="wishmemo">memo</label><br>
	                                    <input class="memo" type="text" placeholder="메모를 남겨보세요." readonly>
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
	                    <button class="wishToCart btn btn-outline-info my-5 my-sm-0">장바구니 추가</button>&nbsp;<button class="wishDelete btn btn-outline-info my-5 my-sm-0">삭제</button>
	                </div>
	            </div>
	        </div>
	        <!-- card item 5 -->
	        <div class="wishcardcol col-md-3 pb-3">
	            <div class="card">
	                <img class="card-img-top" src="<%=request.getContextPath() %>/images/고무나무.jpg" alt="Card image cap">
	                <div class="card-body tablepadding">
	                    <table>
	                        <tbody>
	                            <tr><th colspan="3">고목나무5</th></tr>
	                            <tr>
	                                <td>가격</td>
	                                <td class="wishprice" colspan="2">32000</td>
	                            </tr>
	                            <tr>
	                                <td colspan="2">
	                                    <label class="wishmemo">memo</label><br>
	                                    <input class="memo" type="text" placeholder="메모를 남겨보세요." readonly>
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
	                    <button class="wishToCart btn btn-outline-info my-5 my-sm-0">장바구니 추가</button>&nbsp;<button class="wishDelete btn btn-outline-info my-5 my-sm-0">삭제</button>
	                </div>
	            </div>
	        </div>
	        <!-- card item 6 -->
	        <div class="wishcardcol col-md-3 pb-3">
	            <div class="card">
	                <img class="card-img-top" src="<%=request.getContextPath() %>/images/고무나무.jpg" alt="Card image cap">
	                <div class="card-body tablepadding">
	                    <table>
	                        <tbody>
	                            <tr><th colspan="3">고목나무6</th></tr>
	                            <tr>
	                                <td>가격</td>
	                                <td class="wishprice" colspan="2">32000</td>
	                            </tr>
	                            <tr>
	                                <td colspan="2">
	                                    <label class="wishmemo">memo</label><br>
	                                    <input class="memo" type="text" placeholder="메모를 남겨보세요." readonly>
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
	                    <button class="wishToCart btn btn-outline-info my-5 my-sm-0">장바구니 추가</button>&nbsp;<button class="wishDelete btn btn-outline-info my-5 my-sm-0">삭제</button>
	                </div>
	            </div>
	        </div>
	        <!-- card item 7 -->
	        <div class="wishcardcol col-md-3 pb-3">
	            <div class="card">
	                <img class="card-img-top" src="<%=request.getContextPath() %>/images/고무나무.jpg" alt="Card image cap">
	                <div class="card-body tablepadding">
	                    <table>
	                        <tbody>
	                            <tr><th colspan="3">고목나무7</th></tr>
	                            <tr>
	                                <td>가격</td>
	                                <td class="wishprice" colspan="2">32000</td>
	                            </tr>
	                            <tr>
	                                <td colspan="2">
	                                    <label class="wishmemo">memo</label><br>
	                                    <input class="memo" type="text" placeholder="메모를 남겨보세요." readonly>
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
	                    <button class="wishToCart btn btn-outline-info my-5 my-sm-0">장바구니 추가</button>&nbsp;<button class="wishDelete btn btn-outline-info my-5 my-sm-0">삭제</button>
	                </div>
	            </div>
	        </div>
	        <!-- card item 8 -->
	        <div class="wishcardcol col-md-3 pb-3">
	            <div class="card">
	                <img class="card-img-top" src="<%=request.getContextPath() %>/images/고무나무.jpg" alt="Card image cap">
	                <div class="card-body tablepadding">
	                    <table>
	                        <tbody>
	                            <tr><th colspan="3">고목나무8</th></tr>
	                            <tr>
	                                <td>가격</td>
	                                <td class="wishprice" colspan="2">32000</td>
	                            </tr>
	                            <tr>
	                                <td colspan="2">
	                                    <label class="wishmemo">memo</label><br>
	                                    <input class="memo" type="text" placeholder="메모를 남겨보세요." readonly>
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
	                    <button class="wishToCart btn btn-outline-info my-5 my-sm-0">장바구니 추가</button>&nbsp;<button class="wishDelete btn btn-outline-info my-5 my-sm-0">삭제</button>
	                </div>
	            </div>
	        </div>
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
	        });
	        // 메모입력시 엔터키 완료
	        $(".memo").keydown(function(key){
	            if (key.keyCode == 13){
	                $(this).attr("readonly",true);
	                $(this).css("border","none");
	                $(this).parents("tr").children().last().children(".save").css("display","none");
	                $(this).parents("tr").children().last().children(".pen").css("display","inline");
	            }
	        });
	        // 즐겨찾기 삭제
	        $(".wishDelete").click(function(){
	            var result = confirm("삭제 하시겠습니까?");
	            // 삭제 재확인 후 삭제
	            if(result){
	                $(this).parents(".wishcardcol").remove();
	                //  부모의 크기가 1이면 자식이 없음
	                if($(".wishCardRow").length == 1){
	                    $(".emptyWish").css("display","block");
	                }
	            }
	        });
	    </script>
	</div> <!-- wish container end -->

<%@ include file="../common/footer.jsp" %>
</body>
</html>