<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 
<!-- 기본틀 css -->
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

<!-- 결제 완료 영수증 css -->
<style>
    /* 테이블 크기 테스트 css */
    /* table, thead, tbody, tfoot, td, th{ border: 1px solid; } */

    /* 주문 페이지 */
    .ordercontainer > h1 {
        margin-top: 50px;
        text-align: center;
        padding-bottom: 15px;
        border-bottom: 1px solid gray;
    }

    .ordercontainer > div > h2 {
        margin-top: 50px;
        margin-bottom: 25px;
        display: inline-block;
    }

    .ordercontainer table{
        border-collapse: collapse;
        vertical-align: middle;
        text-align: left;
        width: 100%;
        padding: 0;
        margin: 0;
    }

    .ordercontainer img {
        width: 200px;
        height: 200px;
    }

    .ordercontainer tr{
        font-size: 1.3rem;
    }

    .orderItem_title{
        font-size: 1.7rem;
    }

    .orderItem td,
    .orderpayment td,
    .orderinfo-buyer td,
    .orderinfo-recipient td {
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

    .orderItem > table,
    .orderinfo-buyer > table tr:last-child td,
    .orderinfo-recipient > table tr:last-child td,
    .orderpayment > table,
    .orderpaymentoption > table {
        border-bottom: 1px solid gray;
    }
    
    .orderinfo-buyer > table td,
    .orderinfo-recipient > table td,
    .orderpayment > table td {
        border-bottom: 1px solid rgba(211, 211, 211, 0.5);
    }

    .orderinfo-buyer td:last-child,
    .orderinfo-recipient td:last-child {
        text-align: right;
    }
    
    /* 스위치 버튼 */
    .switch {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    .switch input { 
        opacity: 0;
        width: 0;
        height: 0;
    }

    .slider {
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

    .slider:before {
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

    input:checked + .slider {
        background-color: #2196F3;
    }

    input:focus + .slider {
        box-shadow: 0 0 1px #2196F3;
    }

    input:checked + .slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }

    .slider.round {
        border-radius: 34px;
    }

    .slider.round:before {
        border-radius: 50%;
    }

    /* 스위치 끝 */

    .orderpayment th{
        font-size: 23px;
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

    .orderpaymentoption input {
        margin: 5px;
        width: 15px;
        height: 15px;
    }

    .orderpaymentoption tr {
        border-radius: 5px;
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
        font-size: 15px;
        margin: 0;
        padding: 0 10;
    }

    .orderpaymentoption td:first-child {
        color: black;
    }
    
    .orderend {
        text-align: center;
        padding: 10px;
        margin-bottom: 150px;
    }

    .orderend > a{
        padding: 10px 50px;
        margin: 10px 10px;
    }
</style>
    
</head>
<body>
<%@ include file="../common/header.jsp" %>

	<section>
        <div class="container ordercontainer">
            <h1>상세 내역</h1>
            <div class="orderItem">
                <h2>상품 정보</h2>
                <table>
                    <tbody>
                        <tr>
                            <td rowspan="3" class="orderimg">
                                <img class="orderItem_img" src="..." alt="상품1">
                            </td>
                            <td colspan="2" class="orderItem_title"> </td>
                        </tr>
                        <tr>
                            <td>수량</td>
                            <td class="orderItem_count"></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="orderItem_price"></td>
                        </tr>
                    </tbody>
                </table>
                <!-- 상품정보 추가 (다중 상품에 대한 대책이 필요함)-->
                <script>
                    $(function(){
                        // db에 받아서 출력만 하는 페이지
                        var orderItem_img = "<%=request.getContextPath() %>/images/고무나무.jpg";
                        var orderItem_title = "멜라닌고무나무 라탄바구니 세트";
                        var orderItem_count = "1";
                        var orderItem_price = "32000";

                        $(".orderItem_img").attr("src", orderItem_img);
                        $(".orderItem_title").text(orderItem_title);
                        $(".orderItem_count").text(orderItem_count);
                        $(".orderItem_price").text(orderItem_price);
                    });
                </script>
            </div>

            <div class="orderinfo-buyer">
                <h2>구매자 정보</h2>
                <table>
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td>이름</td>
                            <td class="buyer_name"></td>
                        </tr>
                        <tr>
                            <td>연락처</td>
                            <td class="buyer_phone"></td>
                        </tr>
                        <tr>
                            <td>우편번호</td>
                            <td class="buyer_zCode"></td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td class="buyer_address"></td>
                        </tr>
                        <tr>
                            <td>상세주소</td>
                            <td class="buyer_detailAddress"></td>
                        </tr>
                    </tbody>
                </table>
                <!-- 구매자 정보 추가 -->
                <script>
                    $(function(){
                        // db에 받아서 출력만 하는 페이지
                        var buyer_name = "홍길동";
                        var buyer_phone = "010-1234-5678";
                        var buyer_zCode = "12345";
                        var buyer_address = "서울시 강남구 태혜란로";
                        var buyer_detailAddress = "123-1 201호";

                        $(".buyer_name").text(buyer_name);
                        $(".buyer_phone").text(buyer_phone);
                        $(".buyer_zCode").text(buyer_zCode);
                        $(".buyer_address").text(buyer_address);
                        $(".buyer_detailAddress").text(buyer_detailAddress);
                    });
                </script>
            </div>
            
            <div class="orderinfo-recipient">
                <h2>배송지 정보</h2>
                <table>
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td>이름</td>
                            <td class="recipient_name"></td>
                        </tr>
                        <tr>
                            <td>연락처</td>
                            <td class="recipient_phone"></td>
                        </tr>
                        <tr>
                            <td>우편번호</td>
                            <td class="recipient_postcode"></td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td class="recipient_address"></td>
                        </tr>
                        <tr>
                            <td>상세주소</td>
                            <td class="recipient_detailAddress"></td>
                        </tr>
                        <tr>
                            <td>요청사항</td>
                            <td class="recipient_request"></td>
                        </tr>
                    </tbody>
                </table>
                <!-- 구매자 정보 추가 -->
                <script>
                    $(function(){
                        // db에 받아서 출력만 하는 페이지
                        var recipient_name = "홍길남";
                        var recipient_phone = "010-4321-8765";
                        var recipient_postcode = "54321";
                        var recipient_address = "서울시 송파구 태혜란로";
                        var recipient_detailAddress = "123-1 201호";
                        var recipient_request = "수고가 많으세요~";

                        $(".recipient_name").text(recipient_name);
                        $(".recipient_phone").text(recipient_phone);
                        $(".recipient_postcode").text(recipient_postcode);
                        $(".recipient_address").text(recipient_address);
                        $(".recipient_detailAddress").text(recipient_detailAddress);
                        $(".recipient_request").text(recipient_request);
                    });
                </script>
            </div>

            <div class="orderpayment">
                <h2>결제 금액</h2>
                <table>
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
                        <td id="orderpayment_point"></td>
                    </tr>
                    <tr>
                        <th>최종 결제금액</th>
                        <th id="orderpayment_total"></th>
                    </tr>
                </table>

                <!-- 결제 금액 스크립트 -->
                <script>
                    $(function(){
                        // db에 받아서 출력만 하는 페이지
                        var orderpayment_price = "32000";
                        var orderpayment_delivery = "2500";
                        var orderpayment_discount = "3000";
                        var orderpayment_point = "2500";
                        var orderpayment_total = "29000";

                        $("#orderpayment_price").text(orderpayment_price);
                        $("#orderpayment_delivery").text(orderpayment_delivery);
                        $("#orderpayment_discount").text(orderpayment_discount);
                        $("#orderpayment_point").text(orderpayment_point);
                        $("#orderpayment_total").text(orderpayment_total);
                    });
                </script><!-- 결제 금액 스크립트 끝 -->
            </div>
            <div class="orderend">
                <a href="main.html" class="btn btn-outline-info">확인</a>
            </div>
        </div>
      
    </section>

<%@ include file="../common/footer.jsp" %>
</body>
</html>