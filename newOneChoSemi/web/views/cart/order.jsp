<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Rank, cartList.model.vo.Cart, java.util.ArrayList"%>
<%
	ArrayList<Cart> cartList = (ArrayList<Cart>)request.getAttribute("cartList");
	//System.out.println("주문 페이지 카트 정보 : " + cartList);
	Rank rankDetail = (Rank)request.getAttribute("rankDetail");
	int totalPrice = 0;
	int totalDiscount = 0;
	//System.out.println(cartList.size());
	for(int i = 0 ; i < cartList.size() ; i++){
		totalPrice += cartList.get(i).getItemPrice() * cartList.get(i).getCartListCount();
		totalDiscount += cartList.get(i).getItemDiscount();
	}
	//System.out.println(cartList);
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
	
	<!-- Daum postcode api -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 기본틀 css -->
<style>
    /* font start */
    @font-face {
        font-family: 'basicFont';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    * {
        font-family: "basicFont";
    }
    /* font end */
</style>

<style>
    /* 테이블 크기 테스트 css */
    /* table, thead, tbody, tfoot, td, th{ border: 1px solid; } */

    /* 주문 페이지 */
    .orderContainer div > h2 {
        margin: 50px 0;
        margin-bottom: 25px;
        display: inline-block;
    }

    .orderContainer div > span {
        font-size: 14px;
        color: gray;
    }

    .orderContainer table{
        border-collapse: collapse;
        vertical-align: middle;
        text-align: left;
        width: 100%;
        padding: 0;
        margin: 0;
    }

    .orderContainer .orderimg img {
        width: 200px;
        height: 200px;
    }

    .orderContainer tr{
        font-size: 1.3rem;
    }
    .orderItem_title{
        font-size: 1.7rem;
    }

    .orderItem td,
    .orderpayment td,
    .orderinfo-buyer td{
        padding: 10px;
    }
    .orderimg {
        width: 200px;
    }

    .orderItem_count {
        text-align: right;
        padding-right: 10px;
    }

    .orderItem_count::after {
        content: " 개 ";
    }

    .orderItem_price {
        text-align: right;
        padding-right: 10px;
    }

    .orderItem_price::after {
        content: " 원 ";
    }

    /* 대항목 구분선 */
    .orderItem > table,
    .orderinfo-buyer > table tr:last-child td,
    .orderinfo-Recipient > table,
    .orderpayment > table,
    .orderpaymentoption > table {
        border-bottom: 1px solid gray;
    }
    
    /* 소항목 구분선 */
    .orderinfo-buyer > table td,
    .orderpayment > table td {
        border-bottom: 1px solid rgba(211, 211, 211, 0.5);
    }

    .orderinfo-buyer td:last-child {
        text-align: right;
    }
    .orderinfo-buyer .buyer_phone1:after,
    .orderinfo-buyer .buyer_phone2:after{
    	content: " - ";
    }

    /* 배송지 정보 */
    .orderinfo-Recipient {
        position: relative;
    }
	.orderinfo-buyer .buyer_postcodeTag,
	.orderinfo-buyer .buyer_detailAddressTag,
	.orderinfo-Recipient .recipient_nameTag,
	.orderpaymentoption{
        white-space: nowrap;
    }
    .orderinfo-Recipient tbody td:first-child i:first-child {
        color: red;
        padding: 5px;
    }
    .orderinfo-Recipient tbody td:first-child i:nth-child(2) {
        color: green;
        padding: 5px;
        display: none;
    }
    .orderinfo-Recipient textarea,
    .orderinfo-Recipient select,
    .orderinfo-Recipient input {
        width: 100%;
        padding: 5px 10px;
        border: 1px solid #dddddd;
        border-radius: 5px;
        resize: none;
    }
    .orderinfo-Recipient select{
        padding-top: 6px;
        padding-bottom: 12px;
    }
    .orderinfo-Recipient tbody td:first-child{
        vertical-align: top;
        min-width: 130px;
    }
    .orderinfo-Recipient tbody tr:nth-child(2) input,
    .orderinfo-Recipient tbody tr:nth-child(2) select,
    .orderinfo-Recipient table table{
        text-align: center;
    }   
    
    .orderpayment_point::-webkit-inner-spin-button,
    .orderpayment_point::-webkit-outer-spin-button,
    .orderinfo-Recipient #recipient_phone2::-webkit-inner-spin-button,
    .orderinfo-Recipient #recipient_phone2::-webkit-outer-spin-button,
    .orderinfo-Recipient #recipient_phone3::-webkit-inner-spin-button,
    .orderinfo-Recipient #recipient_phone3::-webkit-outer-spin-button  {
        -webkit-appearance: none;
    }
    .orderinfo-Recipient tfoot tr td{
        color: gray;
        font-size: 0.8rem;
        padding-bottom: 20px;
        transform: translateY(-10px);
    }
    .orderinfo-Recipient .addr {
        position: relative;
    }
	.orderinfo-Recipient .addrsearch {
		width: auto;
		height: 43px;
        cursor: pointer;
		position: absolute;
        right: 0;
	}
    .orderinfo-Recipient > .switchLabel {
        right: 0;
        position: absolute;
        top: 64px;
    }
    
    /* 스위치 버튼 */
    .orderinfo-Recipient .switch {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
        transform: translateY(2px);
    }

    .orderinfo-Recipient .switch input { 
        opacity: 0;
        width: 0;
        height: 0;
    }

    .orderinfo-Recipient .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
        transform: translateY(-8px);
    }

    .orderinfo-Recipient .slider:before {
        position: absolute;
        content: "";
        height: 26px;
        width: 26px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
    }

    .orderinfo-Recipient input:checked + .slider {
        background-color: #5B89A6;
    }

    .orderinfo-Recipient input:focus + .slider {
        box-shadow: 0 0 1px #5B89A6;
    }

    .orderinfo-Recipient input:checked + .slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }

    .orderinfo-Recipient .slider.round {
        border-radius: 34px;
    }

    .orderinfo-Recipient .slider.round:before {
        border-radius: 50%;
    }
    /* 스위치 끝 */ 
    /* 배송지 정보 끝 */

    /* 결제 금액 */
    .orderpayment th{
        font-size: 1.4rem;
        padding: 10px 0;
    }

    .orderpayment td:nth-child(2),
    .orderpayment th:nth-child(2),
    .orderpayment td:nth-child(2) input{
        text-align: right;
    }

    .orderpayment td:nth-child(2)::after,
    .orderpayment th:nth-child(2)::after {
        content: " 원";
    }

    .orderpayment tr:nth-child(3) td:nth-child(2)::before,
    .orderpayment tr:nth-child(4) td:nth-child(2)::before{
        content: "- ";
    }
    .orderpayment_point {
        width: 6.8rem;
        
    }
    /* 결제 금액 끝 */

    /* 결제 방법 */
    .orderpaymentoption td{
        padding: 115px;
    }
    .orderpaymentoption input {
        margin: 5px;
        width: 15px;
        height: 15px;
    }
    .orderpaymentoption label {
        margin: 0px;
    }
        
    .orderpaymentoption table td {
        margin: 5px;
        padding: 15px;
        border: 1px solid black;
        font-size: 20px;
        color: gray;
    }

    .orderpaymentoption tfoot td {
        border: none;
        font-size: 1.3rem;
        margin: 0;
        padding: 0 10;
    }

    .orderpaymentoption td:first-child {
        color: black;
    }
    /* 결제 방법 끝 */

    /* 결제 약관 */
    .orderterms {
        margin-top: 30px;
    }

    .orderterms td {
        padding: 10px 5px;
    }
    .orderterms td:last-child {
        min-width: 65px;
    }
    /* 결제 약관 끝 */

    /* 결제 버튼 */
    .orderEnd {
        text-align: center;
        padding: 10px;
        margin-bottom: 150px;
    }
    .orderEnd > input,
    .orderEnd > button{
        padding: 10px 50px;
        margin: 10px 10px;
    }
    /* 결제 버튼 끝 */
</style>

<!-- 체크 에니메이션 -->
<style>
    .orderterms_check input {
        display: none;
    }
    .orderterms_check .icon1,
    .orderterms_check .icon2 {
        display: inline-block;
        width: 35px;
        height: 35px;
        background-color: transparent;
        border: 2px solid black;
        border-radius: 5px;
        position: relative;
        cursor: pointer;
        transform: translateY(25%);
    }
    .orderterms_check .icon1::before,
    .orderterms_check .icon1::after,
    .orderterms_check .icon2::before,
    .orderterms_check .icon2::after{
        content: '';
        display: inline-block;
        width: 5px;
        height: 0;
        background-color: red;
        position: absolute;
        transform-origin: left top;
        border-radius: 5px;
    }
    .orderterms_check .icon1::before,
    .orderterms_check .icon2::before {
        top: 10px;
        left: 1px;
        transform: rotate(-45deg);;
    }
    .orderterms_check .icon1::after,
    .orderterms_check .icon2::after {
        top: 25px;
        left: 16px;
        transform: rotate(-135deg);;
    }
    .orderterms_check input:checked ~ .icon1::before,
    .orderterms_check input:checked ~ .icon2::before {
        height: 20px;
        transition: all .35s ease;
    }
    .orderterms_check input:checked ~ .icon1::after,
    .orderterms_check input:checked ~ .icon2::after {
        height: 30px;
        transition: all .30s ease .35s;
    }
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>

	<div class="container orderContainer">
	    <!-- 상품 주문 -->
	    <div class="orderItem">
	        <h2>상품 주문</h2> 
	        <span>주문 정보를 확인해 주세요.</span>
	        <table>
	            <tbody>
	            	<%for(int i = 0 ; i < cartList.size() ; i++) { %>
	                <tr>
	                    <td rowspan="3" class="orderimg">
	                        <img class="orderItem_img" src="<%=request.getContextPath() %>/items_uploadFiles/<%=cartList.get(i).getImageName() %>" alt="상품1">
	                    </td>
	                    <td colspan="2" class="orderItem_title"><%=cartList.get(i).getItemName() %></td>
	                </tr>
	                <tr>
	                    <td>수량</td>
	                    <td class="orderItem_count"><%=cartList.get(i).getCartListCount() %></td>
	                </tr>
	                <tr>
	                    <td colspan="2" class="orderItem_price"><%=cartList.get(i).getItemPrice() %></td>
	                </tr>
	                <%} %>
	            </tbody>
	        </table>
	    </div>
	
	    <!-- 구매자 정보 -->
	    <div class="orderinfo-buyer">
	        <h2>구매자 정보</h2>
			<%if(loginUser.getMemberStatus() == "K"){ %>
		        <table>
		            <tbody>
		                <tr>
		                    <td>이름</td>
		                    <td class="buyer_name"><%=loginUser.getMemberName() %></td>
		                </tr>
		            </tbody>
		        </table>
			<%} else {%>
		        <table>
		            <colgroup>
		                <col width="20%">
		                <col width="80%">
		            </colgroup>
		            <tbody>
		                <tr>
		                    <td>이름</td>
		                    <td class="buyer_name"><%=loginUser.getMemberName() %></td>
		                </tr>
		                <tr>
		                    <td>연락처</td>
		                    <td class="buyer_phone">
		                        <span class="buyer_phone1"><%=loginUser.getMemberPhone1() %></span>
		                        <span class="buyer_phone2"><%=loginUser.getMemberPhone2() %></span>
		                        <span class="buyer_phone3"><%=loginUser.getMemberPhone3() %></span>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="buyer_postcodeTag">우편번호</td>
		                    <td class="buyer_postcode"><%=loginUser.getMemberPostcode() %></td>
		                </tr>
		                <tr>
		                    <td>주소</td>
		                    <td class="buyer_address"><%=loginUser.getMemberAddress1() %></td>
		                </tr>
		                <tr>
		                    <td class="buyer_detailAddressTag">상세주소</td>
		                    <td class="buyer_detailAddress"><%=loginUser.getMemberAddress2() %></td>
		                </tr>
		            </tbody>
		        </table>
			<%} %>
	    </div>
	
	    <!-- 배송지 정보 -->
	    <div class="orderinfo-Recipient" id="orderinfo-Recipient">
	        <h2>배송지 정보</h2>
	        <label for="order_confirm_switch" class="switchLabel">주문고객과 동일 &nbsp;<span class="switch">
	        	<input type="checkbox" class="order_confirm_switch" id="order_confirm_switch">
                <span class="slider round"></span></span></label>
	        <table>
	            <colgroup>
	                <col width="15%">
	                <col width="85%">
	            </colgroup>
	            <tbody>
	                <tr>
	                    <td class="recipient_nameTag"><i class="recipient_name_facheck fas fa-check"></i><i class="recipient_name_faseedling fas fa-seedling"></i> &nbsp;받을 사람</td>
	                    <td><input type="text" id="recipient_name" placeholder="이름" value="" required></td>
	                </tr>
	                <tr>
	                    <td><i class="recipient_phone_facheck fas fa-check"></i><i class="recipient_phone_faseedling fas fa-seedling"></i> &nbsp;연락처</td>
	                    <td>
	                        <table>
	                            <colgroup>
	                                <col width="20%">
	                                <col width="5%">
	                                <col width="35%">
	                                <col width="5%">
	                                <col width="35%">
	                            </colgroup>
	                            <tr>
	                                <td>
	                                    <select id="recipient_phone1" required>
	                                        <option value='010'>010</option>
	                                        <option value='011'>011</option>
	                                        <option value='016'>016</option>
	                                        <option value='017'>017</option>
	                                        <option value='018'>018</option>
	                                        <option value='019'>019</option>
	                                    </select>
	                                </td>
	                                <td>-</td>
	                                <td>
	                                    <input type="number" id="recipient_phone2" min="0" max="9999" maxlength="4" required>  
	                                </td>
	                                <td>-</td>
	                                <td>
	                                    <input type="number" id="recipient_phone3" min="0" max="9999" maxlength="4" required>
	                                </td>
	                            </tr>
	                        </table>
	                    </td>
	                </tr>
	                <tr class="addrsearch-tr">
	                    <td><i class="recipient_address_facheck fas fa-check"></i><i class="recipient_address_faseedling fas fa-seedling"></i> &nbsp;주소</td>
	                    <td class="addr">
	                        <input type="text" placeholder="주소 찾기" id="recipient_postcode" required>
	                        <button type="button" id="addrsearch" onclick="recipient_execDaumPostcode()" class="addrsearch btn btn-outline-info">주소찾기</button>
	                        <div id="wrap" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
	                            <img src="<%=request.getContextPath() %>/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
	                        </div>
	                    </td>
	                </tr>
	                <tr>
	                    <td></td>
	                    <td><input type="text" id="recipient_address" placeholder="주소" required></td>
	                </tr>
	                <tr>
	                    <td></td>
	                    <td><input type="text" id="recipient_detailAddress" placeholder="상세 주소" required></td>
	                </tr>
	                <tr>
	                    <td></td>
	                    <td><textarea id="recipient_request" cols="30" rows="3" maxlength="150" placeholder="배송 시 요청사항"></textarea></td>
	                </tr>
	                <tfoot>
	                	<tr>
		                    <td></td>
		                    <td>&nbsp; ( <span id="recipient_request_count">0</span> / 150 ) 자 이내로 입력 해주세요.</td>
	                	</tr>
	                </tfoot>
	            </tbody>
	        </table> <!-- 배송지 정보 끝 -->

	        <!-- 다음 주소 스크립트 -->
	        <script>
	            // 우편번호 찾기 찾기 화면을 넣을 element
	            var element_wrap = document.getElementById('wrap');
	            function foldDaumPostcode() {
	                // iframe을 넣은 element를 안보이게 한다.
	                element_wrap.style.display = 'none';
	            }
	            function recipient_execDaumPostcode() {
	                // 현재 scroll 위치를 저장해놓는다. 
	                // var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	                new daum.Postcode({
	                    oncomplete: function (data) {
	                        // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	    
	                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                        var addr = ''; // 주소 변수
	                        var extraAddr = ''; // 참고항목 변수
	    
	                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                            addr = data.roadAddress;
	                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                            addr = data.jibunAddress;
	                        }
	    
	                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                        if (data.userSelectedType === 'R') {
	                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
	                                extraAddr += data.bname;
	                            }
	                            // 건물명이 있고, 공동주택일 경우 추가한다.
	                            if (data.buildingName !== '' && data.apartment === 'Y') {
	                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                            }
	                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                            if (extraAddr !== '') {
	                                extraAddr = ' (' + extraAddr + ')';
	                            }
	                            // 조합된 참고항목을 해당 필드에 넣는다.
	                            // document.getElementById("sample3_extraAddress").value = extraAddr;
	    
	                        } else {
	                            // document.getElementById("sample3_extraAddress").value = '';
	                        }
	    
	                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                        document.getElementById('recipient_postcode').value = data.zonecode;
	                        document.getElementById("recipient_address").value = addr + extraAddr;
	                        // 커서를 상세주소 필드로 이동한다.
	                        document.getElementById("recipient_detailAddress").focus();
	                        // 주소 컨테이너로 이동
	                        document.getElementById("orderinfo-Recipient").scrollIntoView();
	
	                        // 산간지역 배송비 계산
	                        calculate_comp = true;
	                        Calculate();
	                        recipient_address_check();
	    
	                        // iframe을 넣은 element를 안보이게 한다.
	                        // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                        element_wrap.style.display = 'none';
	    
	                        // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다. 
	                        // document.body.scrollTop = currentScroll;
	                        
	                    },
	                    // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
	                    onresize: function (size) {
	                        element_wrap.style.height = size.height + 'px';
	                    },
	                    width: '100%',
	                    height: '100%'
	                }).embed(element_wrap);
	    
	                // iframe을 넣은 element를 보이게 한다.
	                element_wrap.style.display = 'block';
	          
	            }
	        </script><!-- 다음 주소 스크립트 끝 -->
	    </div>

	    <div class="orderpayment">	<!-- 결제 금액 -->
	        <h2>결제 금액</h2>
	        <table>
	            <tbody>
	            <tr>
	                <td>상품가</td>
	                <td id="orderpayment_price"></td>
	            </tr>
	            <tr>
	                <td>배송비</td>
	                <td id="orderpayment_delivery"></td>
	            </tr>
	            <tr>
	                <td>할인</td>
	                <td id="orderpayment_discount"></td>
	            </tr>
	            <tr>
	                <td>포인트 사용</td>
	                <td><input type="number" id="orderpayment_point" class="orderpayment_point" name="orderpayment_point" placeholder="포인트 입력"></td>
	            </tr>
	            <tr>
	                <td>보유 포인트</td>
	                <td id="orderpayment_userPoint"></td>
	            </tr>
	            <tr>
	                <td>포인트 적립</td>
	                <td id="orderpayment_userPointAdd"></td>
	            </tr>
	            <tr>
	                <th>최종 결제금액</th>
	                <th id="orderpayment_total"></th>
	            </tr>
	            </tbody>
	        </table>
	    </div> <!-- 결제 금액 끝 -->

	    <div class="orderpaymentoption">	<!-- 결제 방법 -->
	        <h2>결제방법</h2>
	        <table>
	            <tbody>
	                <tr>
	                    <td>
	                        <input type="radio" class="payoption" name="payoption" id="tooltip2" value="card" checked>
	                        <label for="tooltip2" data-toggle="tooltip2" title="일반 결제">일반 결제</label>
	                    </td>
	                    <td>
	                        <input type="radio" class="payoption" name="payoption" id="tooltip1" value="vbank" disabled>
	                        <label for="tooltip1" data-toggle="tooltip1" title="충전 포인트 결제는 준비 중 입니다!">충전 포인트 결제</label>
	                    </td>
	                    <td>
	                        <input type="radio" class="payoption" name="payoption" id="tooltip3" value="trans" disabled>
	                        <label for="tooltip3" data-toggle="tooltip3" title="계좌 간편결제는 준비 중 입니다!">계좌 간편결제</label>
	                    </td>
	                    <td>
	                        <input type="radio" class="payoption" name="payoption" id="tooltip4" value="kakaopay"  disabled>
	                        <label for="tooltip4" data-toggle="tooltip4" title="카드 간편 결제는 준비 중 입니다!">카드 간편 결제</label>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	    </div> <!-- 결제 방법 끝 -->
	    
	    <div class="orderterms">	<!-- 결제 약관 -->
	        <table>
	            <tbody>
	                <tr>
	                    <td>
	                    	<label class="orderterms_check" for="inP-cBox1">
	                            <input id="inP-cBox1" type="checkbox" required> 
	                            <span class="icon1"></span>
	                        </label>
	                    </td>
	                    <td><label for="inP-cBox1">상품 주문 및 배송정보 수집에 동의 합니다.</label></td>
	                    <td><label class="orderterms_check" for="inP-cBox1">[필수]</label></td>
	                </tr>
	                <tr>
	                    <td>
	                        <label class="orderterms_check" for="inP-cBox2">
	                            <input id="inP-cBox2" type="checkbox" required>
	                            <span class="icon2"></span>
	                        </label>
	                    </td>
	                    <td><label for="inP-cBox2">주문 상품의 명시내용과 사용조건을 확인하였으며, 취급환불 규정에 동의 합니다.</label></td>
	                    <td><label class="orderterms_check" for="inP-cBox2">[필수]</label></td>
	                </tr>
	            </tbody>
	        </table>
	    </div> <!-- 결제 약관 끝 -->
	
	    <div class="orderEnd">
	        <button type="button" class="orderEnd_cancel btn btn-info" onclick="orderEnd_cancel()">취소하기</button>
	        <button type="button" id="order_confirm" class="btn btn-outline-info">결제하기</button>
	    </div>
	    
	</div>
	
	<script>
	    // 구매자 정보
	    var buyer_name = $(".buyer_name").text();	// 이름
	    var buyer_phone1 = $(".buyer_phone1").text();	// 전화번호1
	    var buyer_phone2 = $(".buyer_phone2").text();	// 전화번호2
	    var buyer_phone3 = $(".buyer_phone3").text();	// 전화번호3
	    var buyer_postcode = $(".buyer_postcode").text();	// 우편번호
	    var buyer_address = $(".buyer_address").text();	// 주소
	    var buyer_detailAddress = $(".buyer_detailAddress").text();	// 상세 주소
	
	    var totalPrice = <%=totalPrice%>;	// 구매 총가격
	    var totalDiscount = <%=totalDiscount%>;	// 구매 총 할인
	    
	    // 유저 보유 포인트
	    var orderpayment_price = totalPrice;
	    var orderpayment_discount = totalDiscount;
	    // 구매자 보유 포인트
	    var user_point = Number(<%=loginUser.getMemberPoint()%>);
	    // 유저 포인트 사용 최대치
	    var user_pointSpendCap = Number(<%=rankDetail.getRankPonintCap()%>);
	    // 사용 가능 포인트 최대치 계산
	    var userAvailablePoints = 0;
	    if(user_point > user_pointSpendCap) {
	        userAvailablePoints = user_pointSpendCap;
	    } else {
	        userAvailablePoints = user_point;
	    }
	    // 배송비 관련 
	    // TODO 지역별 배송 계산  
	    var orderpayment_point = 0;	// 초기 사용 포인트 값
	    var additional = false;	// 추가 배송비 지역 어부
	    var delivery = Number("2500");	// 기본 배송비
	    var additionalDelivery = Number("5000");
	    var orderpayment_total = 0;
	
	    var calculate_comp = true;
	 	
	    $(function() {
	    	// 첫 로딩 시 계산
		    var orderpayment_delivery = Number(delivery);
			var orderpayment_userPoint = Number(user_point);
			$("#orderpayment_price").text(orderpayment_price);
			$("#orderpayment_delivery").text(orderpayment_delivery);
			$("#orderpayment_discount").text(orderpayment_discount);
			$("#orderpayment_point").val(Number(orderpayment_point));
			$("#orderpayment_userPoint").text(orderpayment_userPoint);
			Calculate();
		});
    </script>
    	        
	<!-- 배송지정보 필수 입력 스크립트 -->
	<script>
	    // 배송지 관련 정보 변경 감지
	    $("#recipient_name").change(function(){
	        recipient_name_check();
	    });
	    $("#recipient_phone1, #recipient_phone2, #recipient_phone3").change(function(){
	        recipient_phone_check();
	    });
	    $("#recipient_postcode").change(function(){
	    	recipient_address_check();
	    });
	    $("#recipient_address").change(function(){
	    	recipient_address_check();
	    });
	    $("#recipient_detailAddress").change(function(){
	    	recipient_address_check();
	    });
	    // 이름 입력
	    function recipient_name_check(){
	        if($("#recipient_name").val() != ""){
	        	// 수령자 이름 있음
	            $(".recipient_name_facheck").css("display","none");
	            $(".recipient_name_faseedling").css("display","inline");
	        } else {
	        	// 수령자 이름 없음
	            $(".recipient_name_facheck").css("display","inline");
	            $(".recipient_name_faseedling").css("display","none");
	        }
	    }
	    // 전화번호 입력
	    function recipient_phone_check(){
	        if($("#recipient_phone2").val() != "" && $("#recipient_phone3").val() != ""){
	        	// 전화번호 값 전부 있음
	            $(".recipient_phone_facheck").css("display","none");
	            $(".recipient_phone_faseedling").css("display","inline");
	        } else {
	        	// 전화번호 값 빈 값 있음
	            $(".recipient_phone_facheck").css("display","inline");
	            $(".recipient_phone_faseedling").css("display","none");
	        }
	    }
	    // 주소 입력
	    function recipient_address_check(){
	        if($("#recipient_postcode").val() != "" && $("#recipient_address").val() != "" && $("#recipient_detailAddress").val() != ""){
	        	// 주소 입력 값 전부 있음
	            $(".recipient_address_facheck").css("display","none");
	            $(".recipient_address_faseedling").css("display","inline");
	        } else {
	        	// 주소 입력 빈값 있음
	            $(".recipient_address_facheck").css("display","inline");
	            $(".recipient_address_faseedling").css("display","none");
	        }
	    }
	</script><!-- 배송지정보 필수 입력 스크립트 끝 -->
	
	<!-- 요청사항 스크립트 -->
	<script>
	    $("#recipient_request").keyup(function(){
	        var inputLength = $(this).val().length;
	        $("#recipient_request_count").text(inputLength);
	        var remain = 149 - inputLength;
	        if(remain>=0){
	            $("#recipient_request_count").css("color","black");
	        }else{
	            $("#recipient_request_count").css("color","red");
	        }
	    }).keydown(function(){
	        var inputLength = $(this).val().length;
	        $("#recipient_request_count").text(inputLength);
	        var remain = 149 - inputLength;
	        if(remain>=0){
	            $("#recipient_request_count").css("color","black");
	        }else{
	            $("#recipient_request_count").css("color","red");
	        }
	    });
	</script> <!-- 요청사항 스크립트  끝 -->
	
    <script>	<!-- 결제 금액 스크립트 -->
        // TODO 제주산간 지역 배송비 계산
        function checkdelivery(){
            // 셈플로 제주특별자치도만 추가 배송비를 낸다
            if($("#recipient_address").val().indexOf("제주특별자치도")==0){
                delivery = Number("4000");
                $("#orderpayment_delivery").text(delivery);
            }
        }
        
        // 최종 결제 금액 계산
        function Calculate(){
            if(calculate_comp){
                checkdelivery();
                orderpayment_total = orderpayment_price
                                    + delivery
                                    - orderpayment_discount
                                    - orderpayment_point;
                $("#orderpayment_total").text(orderpayment_total);
                $("#orderpayment_userPointAdd").text(Math.ceil(orderpayment_total*(<%=rankDetail.getRankPonintRat() %>/100)));
                calculate_comp = false;
            }
        }

		// 포인트 입력시 계산되는 결과 값
		$("#orderpayment_point").on("change", function(){
			calculate_comp = true; 
			this.value = this.value.replace(/\D/g, '');
			if (this.value > userAvailablePoints){
			    this.value = userAvailablePoints;
			    orderpayment_point = this.value;
			    Calculate();
			} else{
			    orderpayment_point = this.value;
			    Calculate();
			}
		}).on("keyup", function(){
			calculate_comp = true; 
			this.value = this.value.replace(/\D/g, '');
			if (this.value > userAvailablePoints){
			    this.value = userAvailablePoints;
			    orderpayment_point = this.value;
			    Calculate();
			} else{
			    orderpayment_point = this.value;
			    Calculate();
			}
		});

    </script> <!-- 결제 금액 스크립트 끝 -->
    <script>
		// 주문고객과 동일 스크립트
        $(".order_confirm_switch").change(function(){
            var result = $(".order_confirm_switch").prop("checked");
            if(result){
                $("#recipient_name").val(buyer_name);
                $("#recipient_phone1").val(buyer_phone1).prop("selected",true);
                $("#recipient_phone2").val(buyer_phone2);
                $("#recipient_phone3").val(buyer_phone3);
                $("#recipient_postcode").val(buyer_postcode);
                $("#recipient_address").val(buyer_address);
                $("#recipient_detailAddress").val(buyer_detailAddress);
                recipient_name_check();
                recipient_phone_check();
                recipient_address_check();
            } else {
                $("#recipient_name").val("");
                $("#recipient_phone1").val("010");
                $("#recipient_phone2").val("");
                $("#recipient_phone3").val("");
                $("#recipient_postcode").val("");
                $("#recipient_address").val("");
                $("#recipient_detailAddress").val("");
                recipient_name_check();
                recipient_phone_check();
                recipient_address_check();
            }
            calculate_comp = true;
            Calculate();
        });
        $("#recipient_name, #recipient_phone, #recipient_postcode, #recipient_address, #recipient_detailAddress").change(function(){
            $(".order_confirm_switch").prop("checked",false);
            calculate_comp = true;
            Calculate();
        });
    </script><!-- 주문고객과 동일 스크립트 끝 -->
	
	<form id="orderCompForm" action="<%=request.getContextPath() %>/orderComp.or?userNo=<%=userNo %>" method="post">
	<div>
		<input type="hidden" class="comp_userNo" name="comp_userNo" value="<%=userNo %>">
		<input type="hidden" class="comp_userRank" name="comp_userRank" value="<%=userRank %>">
		<!-- 상품정보 -->
		<%for(int i = 0 ; i < cartList.size() ; i++) { %>
		<div class="orderComp_item<%=i%>">
			<input type="hidden" class="comp_iNo" name="comp_iNo" value="<%=cartList.get(i).getItemNo() %>">
			<input type="hidden" class="comp_iName" name="comp_iName" value="<%=cartList.get(i).getItemName() %>">
			<input type="hidden" class="comp_imgName" name="comp_imgName" value="<%=cartList.get(i).getImageName() %>">
			<input type="hidden" class="comp_imgPath" name="comp_imgPath" value="<%=cartList.get(i).getImagePath() %>">
			<input type="hidden" class="comp_iCount" name="comp_iCount" value="<%=cartList.get(i).getCartListCount() %>">
			<input type="hidden" class="comp_iPrice" name="comp_iPrice" value="<%=cartList.get(i).getItemPrice() %>">
			<input type="hidden" class="comp_iDiscount" name="comp_iDiscount" value="<%=cartList.get(i).getItemDiscount() %>">
		</div>
        <%} %>
		<!-- 수령자 정보 -->
		<input type="hidden" class="comp_rName" name="comp_rName" value="">
		<input type="hidden" class="comp_rPhone1" name="comp_rPhone1" value="">
		<input type="hidden" class="comp_rPhone2" name="comp_rPhone2" value="">
		<input type="hidden" class="comp_rPhone3" name="comp_rPhone3" value="">
		<input type="hidden" class="comp_rPostcode" name="comp_rPostcode" value="">
		<input type="hidden" class="comp_rAddress1" name="comp_rAddress1" value="">
		<input type="hidden" class="comp_rAddress2" name="comp_rAddress2" value="">
		<input type="hidden" class="comp_rMemo" name="comp_rMemo" value="">
		<!-- 결제 정보 -->
		<input type="hidden" class="comp_paymentPrice" name="comp_paymentPrice" value="">
		<input type="hidden" class="comp_paymentDelivery" name="comp_paymentDelivery" value="">
		<input type="hidden" class="comp_paymentDiscount" name="comp_paymentDiscount" value="">
		<input type="hidden" class="comp_paymentPoint" name="comp_paymentPoint" value="">
		<input type="hidden" class="comp_paymentUserPoint" name="comp_paymentUserPoint" value="">
		<input type="hidden" class="comp_paymentAddPoint" name="comp_paymentAddPoint" value="">
		<input type="hidden" class="comp_paymentTotal" name="comp_paymentTotal" value="">
		<input type="hidden" class="comp_paymentOption" name="comp_paymentOption" value="">
	</div>
	</form>
	<script>
		function orderEnd_cancel() {
		    var result = confirm("입력하신 정보가 지워집니다. 주문을 취소 하시겠습니까?");
		    if(result){
		        location.replace("index.jsp");
		    }
		}
		
		$("#order_confirm").click(function(){
			var rName = $("#recipient_phone2").val();
			
			if($("#recipient_name").val() == "" || $("#recipient_name").val() == null || $("#recipient_name").val() == "undefined") {
				alert("수령자 이름을 입력해 주세요.");
				$("#recipient_name").focus();
			} else if($("#recipient_phone2").val() == "" || $("#recipient_phone2").val() == null || $("#recipient_phone2").val() == "undefined") {
		    	alert("전화 번호를 입력해 주세요.");
				$("#recipient_phone2").focus();
			} else if($("#recipient_phone3").val() == "" || $("#recipient_phone3").val() == null || $("#recipient_phone3").val() == "undefined") {
		    	alert("전화 번호를 입력해 주세요.");
				$("#recipient_phone3").focus();
		    } else if($("#recipient_postcode").val() == "" || $("#recipient_postcode").val() == null || $("#recipient_postcode").val() == "undefined") {
		    	alert("우편번호를 입력해 주세요.");
				$("#recipient_postcode").focus();
			} else if($("#recipient_address").val() == "" || $("#recipient_address").val() == null || $("#recipient_address").val() == "undefined") {
		    	alert("주소를 입력해 주세요.");
				$("#recipient_address").focus();
			} else if($("#recipient_detailAddress").val() == "" || $("#recipient_detailAddress").val() == null || $("#recipient_detailAddress").val() == "undefined") {
		    	alert("상세 주소를 입력해 주세요.");
				$("#recipient_detailAddress").focus();
		    } else if(document.getElementById("inP-cBox1").checked != true && document.getElementById("inP-cBox2").checked != true) {
		        alert("약관에 동의해 주세요.");
				$("#orderterms").focus();
		    } else {
		    	// 전송 값 저장
				$(".comp_rName").val($("#recipient_name").val());
				$(".comp_rPhone1").val($("#recipient_phone1").val());
				$(".comp_rPhone2").val($("#recipient_phone2").val());
				$(".comp_rPhone3").val($("#recipient_phone3").val());
				$(".comp_rPostcode").val($("#recipient_postcode").val());
				$(".comp_rAddress1").val($("#recipient_address").val());
				$(".comp_rAddress2").val($("#recipient_detailAddress").val());
				$(".comp_rMemo").val($("#recipient_request").val());
				
				$(".comp_paymentPrice").val($("#orderpayment_price").text());
				$(".comp_paymentDelivery").val($("#orderpayment_delivery").text());
				$(".comp_paymentDiscount").val($("#orderpayment_discount").text());
				$(".comp_paymentPoint").val("0");
				
				if($("#orderpayment_point").val() != "" || $("#orderpayment_point").val() != null){
					$(".comp_paymentPoint").val(0 + Number($("#orderpayment_point").val()));
				}
				$(".comp_paymentUserPoint").val($("#orderpayment_userPoint").text());
				$(".comp_paymentAddPoint").val($("#orderpayment_userPointAdd").text());
				$(".comp_paymentTotal").val($("#orderpayment_total").text());

				$(".comp_paymentOption").val($(".payoption").val());
				
				
				// 주문 api용 변수들
				var orderMemberNo = $(".comp_userNo").val();
		    	var orderMemberEmail = "<%=loginUser.getMemberEmail1() + loginUser.getMemberEmail2() %>";
		    	
		    	// 주문 api용 상품명 
		    	var itemName = "<%=cartList.get(0).getItemName() %>";
		    	var itemCounnt = "<%=cartList.size() %>" - 1;
		    	if(itemCounnt > 1){
		    		itemName += itemName + " 외 (" + itemCounnt + ")";
		    	}
		    	// 주문 api용 고객 정보
		    	var orderName = $(".comp_rName").val();
		    	var orderPhone = $(".comp_rPhone1").val() + " - " + $(".comp_rPhone2").val() + " - " + $(".comp_rPhone3").val();
		    	var orderPostcode = $(".comp_rPostcode").val();
		    	var orderaddress = $(".comp_rAddress1").val() + $(".comp_rAddress2").val();
		    	
		    	// 주문 옵션
		    	var orderTotalPrice = $(".comp_paymentTotal").val();
		    	var orderPayOption = $(".comp_paymentOption").val();
		    	
				console.log(orderPayOption);
		    	
				// iamport api
				var IMP = window.IMP; // 생략가능
				IMP.init('imp99515555');
				// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
				IMP.request_pay({
					pg: 'inicis', // version 1.1.0부터 지원.
					pay_method: orderPayOption,
					/*
						'samsung':삼성페이,
						'card':신용카드,
						'trans':실시간계좌이체,
						'vbank':가상계좌,
						'phone':휴대폰소액결제
					*/
					merchant_uid: 'merchant_' + new Date().getTime() + ', memberNo=' + orderMemberNo,
					/*
						merchant_uid (https://docs.iamport.kr/implementation/payment) 참고
					*/
					name: itemName,
					//결제창에서 보여질 이름
					amount: orderTotalPrice,
					//가격
					buyer_email: orderMemberEmail,
					buyer_name: orderName,
					buyer_tel: orderPhone,
					buyer_addr: orderaddress,
					buyer_postcode: orderPostcode,
					m_redirect_url: '/web/views/receipt.jsp'

				}, function (rsp) {
					console.log(rsp);
					if (rsp.success) {
						/* 
							var msg = '결제가 완료되었습니다.';
							msg += '고유ID : ' + rsp.imp_uid;
							msg += '상점 거래ID : ' + rsp.merchant_uid;
							msg += '결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;
						*/
				    	// 결제 완료 후 결과 화면으로...
						$("#orderCompForm").submit();
					} else {
						var msg = rsp.error_msg;
						alert(msg);
					}
					//alert(msg);
				});

				

		    }
		});
	</script>

<%@ include file="../common/footer.jsp" %>
</body>
</html>