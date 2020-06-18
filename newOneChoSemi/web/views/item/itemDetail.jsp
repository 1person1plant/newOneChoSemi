<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="order.model.vo.Order, item.model.vo.Item, review.model.vo.Review, java.util.ArrayList"%>
<%
   Item item = (Item)request.getAttribute("itemDetail");
   ArrayList<Review> otherReviewList = (ArrayList)request.getAttribute("otherReviewList");
   ArrayList<Review> myReviewList = (ArrayList)request.getAttribute("myReviewList");
   Order order = (Order)request.getAttribute("orderCheck");
   Review loadReview = (Review)request.getAttribute("loadReview");
   int wishCheck = ((Integer)request.getAttribute("wishCheck"));

   String keyword = "";
   String key1 = "";
   String key2 = "";
   
   int available = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Cho-당신을 위한 반려식물</title>
	<!--타이틀 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath() %>/images/logo.png">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>
/* font start */
@font-face {
font-family: 'basicFont'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff'); font-weight: normal; font-style: normal;}
* {font-family: "basicFont";}
/* font end */

/* itemdetail page start */
.item-container {margin-top:10rem;}
#iteminfo-itemmain-img {width:28.2rem; height:28.2rem; margin-left:3rem; margin-right:2rem;}
#itemmain-img {width:100%; height:100%;}
.iteminfo-row .row {margin-bottom:0.2rem;}
.title-row {border-bottom:0.3rem solid lightgray; margin-bottom:3rem;}
#iteminfo-keyword {padding-top:0.5rem; padding-bottom:0.5rem; color:#1f598c}
#iteminfo-keyword-hash {margin-right:1rem;}
#iteminfo-explain-area {padding-top:0.2rem; padding-bottom:0.2rem;}
#iteminfo-rating {padding-top:0.2rem; padding-bottom:0.2rem;}
#iteminfo-starRating {padding:0rem;}
#iteminfo-afterSale-left {padding:0rem;}
#beforeSale-price {margin:0;}
#afterSale-price {margin:0;}
#iteminfo-price {margin:0; padding-top:0.2rem;}
#iteminfo-ship {border-top: 0.1rem solid lightgray; border-bottom: 0.1rem solid lightgray; padding:0.5rem 0rem;}
#iteminfo-shipinfo {font-size: 0.9rem;} 
.item-quantity {margin:0.3rem 0rem;}          
input[type=number]::-webkit-inner-spin-button {opacity:1;}
input[type=number] {text-align:center;}
.item-quantity {padding-left:0.3rem; padding-right:0.3rem;}
.item-cancel {padding-right:0.1rem;}
.iteminfo-rating-count {padding:0;}
.iteminfo-starRating-text {margin-left:0.5rem;}
#iteminfo-afterSale-price {padding:0;}
#iteminfo-share-btn {padding:0;}
#iteminfo-cart-btn {padding:0;}
#iteminfo-wish-btn {padding:0;}
#iteminfo-icons {padding:0;}
#iteminfo-wish-span {padding:0;}
#iteminfo-cart-span {padding:0;}
#iteminfo-share-span {padding:0;}
#icons-button {padding:0;}
.iteminfo-quantity {padding-right:0.5rem;}
#iteminfo-quantity-result {display:none; background-color:lightgray; padding-right:1rem; padding-bottom:0.5rem; padding-top:0.5rem;}            
dd {margin:0;}
/* itemdetail page end */

/* detail start */
.detail-container {margin-top:10rem;}
#detail-image {margin:auto;}
/* detail end */

/* 리뷰 쓰러 가기 누르는 공간 */
#myReview-writing {padding-top:0rem; padding-bottom:0.5rem; padding-left:1rem; padding-right:1rem; height:13rem;}
#myReview-writing-wrap {margin:0; width:100%; height:100%; text-align:center; padding:1rem; background-image:url("<%=request.getContextPath()%>/images/review-banner.jfif"); background-size:100%; background-repeat:no-repeat; background-position:center;}
#goReview-btn {border:none; width:10rem; height:3rem; background-color: rgba(242,238,188,0.4); color:black;} 
/* 리뷰 쓰러 가기 누르는 공간 */
         
/* myReview start */
.myReview-container {margin-top:10rem;}
.myReview-content {text-align:center; padding:0 1rem;}
#title-col {padding:0rem;}
#title-writing {padding:0rem; padding-top:1rem;}
#big-review-image {display:none;}
/* myReview end */

/* review modal start */
.modal-header {padding:0.5rem;}
.modal-close {padding:0;}
.modal-body {padding-top:0; padding-bottom:0;}
.title-modal-container {padding:0.8rem; background-color:#5b89a6; color:white;}
.iteminfo-modal-img {width:12rem; height:8rem;}
.iteminfo-modal-image {width:100%; height:100%;}
.modal-body > .row {margin-bottom:1rem;}
.ratingTitle-modal-container {margin:0; padding:0.5rem;}
.writing-modal-container {margin-bottom:1rem;}
.textarea-modal-container {margin-left:1rem; margin-right:1rem; background-color:lightgray;}
.textarea-row {padding:0.5rem;}
.attachPhoto-modal {padding-left:1rem; padding-right:1rem;}
/* review modal end */

/* photo review start */
/* photo review end */

/* star rating start */
.starRating {cursor:pointer; margin:1rem 0rem; text-align:center;}
/* star rating end*/

/* review start */
.review-container {margin-top:10rem;}
.review-title {border-bottom:0.3rem solid lightgray; margin-bottom:3rem;}
.review-statistic {padding:0 1rem;}
.review-writing {padding:0 1rem;}
.review-content {text-align:center; padding:0 1rem;}
.fa-star {color:#FDC91B;}
.fa-star-o {color:gray;}
.review-pagination {margin-top:2rem;}
.user-grade-image {border:0.1rem solid #2d2d2d; border-radius:5rem;}
td {padding: 1rem !important;}
td:nth-of-type(1) {width:10rem;}
td:nth-of-type(2) {width:45rem;}
.pagination * {color:black;}
#review-set {color:gray;}
/* review end */
</style>
</head>
<body>
   <%@ include file="../common/header.jsp"%>
   <section>
      <!--아이템 판매정보-->
      <div class="container item-container">
         <div class="row title-row">
            <p class="h1">ITEM</p>
         </div>
         <div class="row iteminfo-row">
            <div class="col iteminfo-col-left">
               <div class="iteminfo-itemmain-img" id="iteminfo-itemmain-img">
                  <img
                     src="<%=request.getContextPath()%>/<%=item.getItemMainImgPath()%>/<%=item.getItemMainImg()%>"
                     id="itemmain-img">
               </div>
            </div>
            <div class="col iteminfo-col-right">
               <div class="row iteminfo-title">
                  <p class="h2 font-weight-bold my-auto iteminfo-title"><%=item.getItemName()%></p>
               </div>
               <div class="row iteminfo-keyword" id="iteminfo-keyword">
                  <%if(!(item.getItemKeywordNo().equals("K3"))) {%>
                  <span class="h5 font-weight-bold my-auto iteminfo-keyword-hash"
                     id="iteminfo-keyword-hash">#<%=item.getKeywordName()%></span>
                  <%}else { %>
                  <%
                     keyword = item.getKeywordName();
                     key1 = keyword.split(",")[0];
                     key2 = keyword.split(",")[1];
                  %>
                  <span class="h5 font-weight-bold my-auto iteminfo-keyword-hash"
                     id="iteminfo-keyword-hash">#<%=key1%></span> <span
                     class="h5 font-weight-bold my-auto iteminfo-keyword-hash"
                     id="iteminfo-keyword-hash">#<%=key2%></span>
                  <%}%>
               </div>
               <div class="row iteminfo-explain-area" id="iteminfo-explain-area">
                  <p class="iteminfo-explain my-auto"><%=item.getItemInfo()%></p>
               </div>
               <div class="row row-1 iteminfo-rating" id="iteminfo-rating">
                  <div class="col iteminfo-starRating" id="iteminfo-starRating">
                     <i class="my-auto fa fa-star"></i> <i class="my-auto fa fa-star"></i>
                     <i class="my-auto fa fa-star"></i> <i class="my-auto fa fa-star"></i>
                     <i class="my-auto fa fa-star-o"></i> <span
                        class="iteminfo-starRating-text my-auto" style="color: gray">5개
                        구매평</span>
                  </div>
               </div>
               <div class="row iteminfo-price" id="iteminfo-price"
                  style="display: block;">
                  <div class="row iteminfo-beforeSale" id="iteminfo-beforeSale"
                     style="color: gray">
                     <p class="h4 beforeSale-price" id="beforeSale-price"
                        style="text-decoration: line-through;">
                        &#8361;<%=item.getItemPrice()%></p>
                  </div>
                  <div class="row iteminfo-afterSale" id="iteminfo-afterSale">
                     <div class="col-10 iteminfo-afterSale-price"
                        id="iteminfo-afterSale-price" style="color: #1f598c;">
                        <p class="h3 afterSale-price" style="font-weight: bold">
                           &#8361;<%=(item.getItemPrice() - item.getItemDiscount())%></p>
                     </div>
                     <div class="col-2 iteminfo-icons" id="iteminfo-icons">
                        <span class="col iteminfo-share-span" id="iteminfo-share-span" style="justify-content: center;">
                           <button class="btn btn-default iteminfo-icons" id="iteminfo-share-btn" data-toggle="popover">
                              <i class="fa fa-paperclip" style="font-size: 1.5rem; color: #5b89a6;"></i>
                           </button>
                        </span>
                        <span class="col iteminfo-cart-span" id="iteminfo-cart-span" style="justify-content: center;">
                           <button class="btn btn-default iteminfo-icons" id="iteminfo-cart-btn" data-toggle="popover">
                              <i class="fa fa-shopping-cart" style="font-size: 1.5rem; color: gray;"></i>
                           </button>
                        </span>
                        <span class="col iteminfo-wish-span" id="iteminfo-wish-span" style="justify-content: center;">
                           <button class="btn btn-default iteminfo-icons" id="iteminfo-wish-btn">
                              <i class="fa fa-heart" style="font-size: 1.5rem;"></i>
                           </button>
                           <input type="hidden" id="goWish-real-btn" data-toggle="modal" href="#goWish">
                        </span>
                     </div>
                  </div>
               </div>
               <div class="row iteminfo-ship" id="iteminfo-ship">
                  <dl class="row iteminfo-shipinfo" id="iteminfo-shipinfo">
                     <dt class="col-2 my-auto shipinfo-left">구매혜택</dt>
                     <dd class="col-10 my-auto shipinfo-right">
                        <button type="button" style="border: none; background: white;"
                           data-toggle="tooltip" data-placement="right"
                           title="누적금액에 따라 등급업">
                           <i class="far fa-question-circle"></i>
                        </button>
                     </dd>
                     <dt class="col-2 my-auto shipinfo-left">배송방법</dt>
                     <dd class="col-10 my-auto shipinfo-right">택배</dd>
                     <dt class="col-2 my-auto shipinfo-left">배송비</dt>
                     <dd class="col-10 my-auto shipinfo-right">3,000원 (도서산간 지역
                        배송비 추가)</dd>
                  </dl>
               </div>
               <div class="row iteminfo-quantity">
                  <div class="col col-9 my-auto item-name">
                     <span><%=item.getItemName()%></span>
                  </div>
                  <div class="col col-2 item-quantity">
                     <%
                        if(item.getItemMax() < item.getItemStock()) {
                           available = item.getItemMax();
                        }else {
                           available = item.getItemStock();
                        }
                     %>
                     <input type="number"
                        class="form-control form-control-sm item-quantity"
                        id="quantityNumber" name="item-quantity" value="0" min="0"
                        max="<%=available%>" step="1">
                  </div>
                  <div class="col col-1 my-auto item-cancel">
                     <button class="btn btn-default cancel-button">
                        <i class="fa fa-times"></i>
                     </button>
                  </div>
               </div>
               <div class="row iteminfo-quantity-result"
                  id="iteminfo-quantity-result" style="text-align: right">
                  <span class="quantity-result"> <span
                     style="font-size: 0.9rem">총 수량: </span><span id="whole-quantity"
                     style="font-weight: bold; color: #1f598c;"></span> <span
                     id="howmany" style="font-size: 0.9rem">개/ </span>
                  </span> <span class="whole-price-result"> <span
                     style="font-size: 0.9rem">총 구매금액: </span><span id="whole-price"
                     style="font-weight: bold; color: #1f598c;"></span> <span
                     id="quantity-won" style="font-size: 0.9rem">원</span>
                  </span>
               </div>
               <div class="row iteminfo-buy">
                  <button type="button"
                     class="btn btn-block btn-secondary btn-buybutton">구매하기</button>
               </div>
            </div>
         </div>
      </div>



      






      <!--아이템 디테일사진-->
      <div class="container detail-container">
         <div class="row title-row">
            <p class="h1">DETAIL</p>
         </div>
         <div class="row detail-row">
            <img id="detail-image"
               src="<%=request.getContextPath()%>/<%=item.getItemSubImgPath()%>/<%=item.getItemSubImg()%>">
         </div>
      </div>









      <!--내 리뷰-->
      <div class="container myReview-container">
         <div class="row title-row">
            <div class="col title-col" id="title-col">
               <p class="h1">MY REVIEW</p>
            </div>
         </div>
         <div class="row myReview-writing" id="myReview-writing">
            <div id="myReview-writing-wrap">
               <p class="h2" style="color: #2d2d2d; font-weight: bold;">REVIEW</p>
               <p style="font-size: 1rem; color: black;">
                  식물 친구와의 첫만남은 어떠셨나요?<br>다른 회원님들도 참고하실 수 있도록 리뷰를 남겨주세요!
               </p>
               <input type="button" class="btn btn-default" value="리뷰 쓰러 가기" id="goReview-btn">
               <input type="hidden" id="goReview-real-btn" data-toggle="modal" href="#createReview">
            </div>
         </div>
         <div class="row myReview-content">
            <table class="table table-hover myReview-table">
               <tbody>
               <%for(int i = 0; i < myReviewList.size(); i++) {%>
                  <tr>
                     <%
                        String rank = "";
                     
                        switch(myReviewList.get(i).getMemberRank()) {
                        case "R1": rank = "seed1.png";
                                 break;
                        case "R2": rank = "sprout2.png";
                                 break;
                        case "R3": rank = "branch3.png";
                                 break;
                        case "R4": rank = "fruit4.png";
                                 break;
                        case "R5": rank = "tree5.png";
                                 break;
                        }
                     %>
                     <td>
                        <input type="hidden" value="<%=myReviewList.get(i).getReviewNo()%>">
                        <img src="<%=request.getContextPath()%>/images/rank/<%=rank%>" class="user-grade-image" style="width: 5rem; height: 5rem;"><br>
                         <a href="#" id="updateReview-btn" style="font-size: 0.8rem; color: grey;">수정하기</a>&nbsp;
                         <a href="#" id="deleteReview-btn" style="font-size: 0.8rem; color: grey;">삭제하기</a></td>
                         <input type="hidden" id="updateReview-real-btn" data-toggle="modal" href="#updateReview">
                     <td>
                        <div class="row review-star-score">
                           <%for(int k = 0; k < 1; k++) {%>
                           <%for(int j = 0; j < 5; j++) {%>

                           <%if(j < myReviewList.get(i).getReviewRate()) {%>
                           <i class="fa fa-star"></i>
                           <%}else {%>
                           <i class="fa fa-star-o"></i>
                           <%}%>

                           <%}%>
                           <%}%>
                        </div>
                        <div class="row review-set" id="review-set">
                           <span class="review-id"><%=myReviewList.get(i).getMemberId()%>/</span><span
                              class="review-date"><%=myReviewList.get(i).getReviewUDate()%></span>
                        </div>
                        <div class="row review-cont">
                           <p class="review-cont-real"><%=myReviewList.get(i).getReviewContent()%></p>
                        </div>
                        <div class="row review-bigImage" style="margin-top: 1rem;">
                           <img src="<%=request.getContextPath()%>/<%=myReviewList.get(i).getReviewImgPath()%>/<%=myReviewList.get(i).getReviewImgName()%>" id="big-review-image"
                              style="width: 30rem; height: 30rem;">
                        </div>
                     </td>
                     <td class="fadeout-image"><img
                        src="<%=request.getContextPath()%>/<%=myReviewList.get(i).getReviewImgPath()%>/<%=myReviewList.get(i).getReviewImgName()%>"
                        id="mini-review-image" style="width: 7rem; height: 7rem;"></td>
                  </tr>
                  <%}%>
               </tbody>
            </table>
         </div>
      </div>











      


      <!--리뷰쓰기 모달-->
      <form action="<%=request.getContextPath()%>/create.rv" method="post" encType="multipart/form-data">
         <div class="modal fade reviewModal" id="createReview">
            <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close modal-close" data-dismiss="modal">&times;</button>
                  </div>
                  <div class="modal-body">
                     <div class="row title-modal">
                        <div class="container-fluid title-modal-container">
                           <p class="h4 my-auto" style="text-align: center">리뷰쓰기</p>
                        </div>
                     </div>
                     <div class="row iteminfo-modal">
                        <div class="col col-4 iteminfo-modal-img">
                           <img class="iteminfo-modal-image" src="<%=request.getContextPath()%>/<%=item.getItemMainImgPath()%>/<%=item.getItemMainImg()%>">
                        </div>
                        <div class="col col-8 iteminfo-modal-text">
                           <div class="row iteminfo-modal-title" style="margin-bottom: 0rem;">
                              <p class="h6 my-auto" style="color: gray; font-size: 1rem;">[<%=item.getItemName()%>]</p>
                              <input type="hidden" name="orderInfo" value="<%=order.getOrderNo()%>,<%=order.getItemNo()%>">
                           </div>
                           <div class="row iteminfo-modal-date">
                              <p class="my-auto" style="color:#5b89a6; font-size:0.8rem;">[구매일:&nbsp;<%=order.getOrderDate()%>]</p>
                           </div>
                           <div class="row iteminfo-modal-content" style="padding-right: 1rem;">
                              <p style="font-size: 0.8rem;"><%=item.getItemInfo()%></p>
                           </div>
                        </div>
                     </div>
                     <hr>
                     <div class="row rating-modal">
                        <div class="container-fluid rating-modal-container">
                           <p class="h5 my-auto" style="text-align: center">상품은 어떠셨나요?</p>
                        </div>
                        <div class="container-fluid starRating">
                           <span class="fa fa-star-o" data-rating="1" style="font-size: 3rem"></span>
                           <span class="fa fa-star-o" data-rating="2" style="font-size: 3rem"></span>
                           <span class="fa fa-star-o" data-rating="3" style="font-size: 3rem"></span>
                           <span class="fa fa-star-o" data-rating="4" style="font-size: 3rem"></span> 
                           <span class="fa fa-star-o" data-rating="5" style="font-size: 3rem"></span> 
                           <input type="hidden" name="score" class="rating-value" value="3">
                        </div>
                     </div>
                     <hr>
                     <div class="row writing-modal">
                        <div class="container writing-modal-container">
                           <p class="h5 my-auto" style="text-align: center">어떤 점이 좋았나요?</p>
                        </div>
                        <div class="container textarea-modal-container">
                           <div class="row textarea-row">
                              <textarea class="form-control review-textarea" name="content" rows="5" placeholder="이곳에 작성해주세요." style="background-color: lightgray; resize: none;"></textarea>
                           </div>
                           <div class="row float-right textarea-count-row">
                              <span class="counter">0</span><span class="textarea-count" style="margin-right: 0.5rem;">/150자</span>
                           </div>
                        </div>
                     </div>
                     <hr>
                     <div class="row attachPhoto-modal">
                        <button type="button" class="btn-secondary btn-block attachPhoto-btn" style="height: 2.5rem; font-weight: lighter; border: none;">
                           <i class="fa fa-camera"></i>&nbsp;사진 첨부하기
                        </button>
                        <div id="photo-result" style="margin-top:1rem; width:10rem; height:12rem; border-style:none;">
                           <img class="photo-preview" style="width: 100%; height: 100%; border:none;">
                        </div>
                        <input type="file" class="review-btn" name="reviewPhoto" style="display: none;" onchange="loadImg(this)">
                     </div>
                  </div>
                  <div class="modal-footer justify-content-center">
                     <button type="reset" class="btn btn-light" data-dismiss="modal">취소하기</button>
                     <button type="submit" class="btn btn-secondary">등록하기</button>
                  </div>
               </div>
            </div>
         </div>
      </form>
      
      
      
      
      
      
      
      
      
      
    
      <!--리뷰수정하기 모달-->
      <form action="<%=request.getContextPath()%>/update.rv" method="post" encType="multipart/form-data">
         <div class="modal fade reviewModal" id="updateReview">
            <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close modal-close" data-dismiss="modal">&times;</button>
                  </div>
                  <div class="modal-body">
                     <div class="row title-modal">
                        <div class="container-fluid title-modal-container">
                           <p class="h4 my-auto" style="text-align: center">리뷰 수정하기</p>
                        </div>
                     </div>
                     <div class="row iteminfo-modal">
                        <div class="col col-4 iteminfo-modal-img">
                           <img class="iteminfo-modal-image" src="<%=request.getContextPath()%>/<%=item.getItemMainImgPath()%>/<%=item.getItemMainImg()%>">
                        </div>
                        <div class="col col-8 iteminfo-modal-text">
                           <div class="row iteminfo-modal-title" style="margin-bottom: 0rem;">
                              <p class="h6 my-auto" style="color: gray; font-size: 1rem;">[<%=item.getItemName()%>]</p>
                              <input type="hidden" name="orderInfo" id="updateReviewNo" value="">
                           </div>
                           <div class="row iteminfo-modal-date">
                              <p class="my-auto" style="color:#5b89a6; font-size:0.8rem;" id="updateReviewUDate">[리뷰작성일:&nbsp;]</p>
                           </div>
                           <div class="row iteminfo-modal-content" style="padding-right: 1rem;">
                              <p style="font-size: 0.8rem;"><%=item.getItemInfo()%></p>
                           </div>
                        </div>
                     </div>
                     <hr>
                     <div class="row rating-modal">
                        <div class="container-fluid rating-modal-container">
                           <p class="h5 my-auto" style="text-align: center">상품은 어떠셨나요?</p>
                        </div>
                        <div class="container-fluid starRating">
                           <span class="fa fa-star-o" data-rating="1" style="font-size: 3rem"></span>
                           <span class="fa fa-star-o" data-rating="2" style="font-size: 3rem"></span>
                           <span class="fa fa-star-o" data-rating="3" style="font-size: 3rem"></span>
                           <span class="fa fa-star-o" data-rating="4" style="font-size: 3rem"></span> 
                           <span class="fa fa-star-o" data-rating="5" style="font-size: 3rem"></span> 
                           <input type="hidden" name="score" class="rating-value" value="3">
                        </div>
                     </div>
                     <hr>
                     <div class="row writing-modal">
                        <div class="container writing-modal-container">
                           <p class="h5 my-auto" style="text-align: center">어떤 점이 좋았나요?</p>
                        </div>
                        <div class="container textarea-modal-container">
                           <div class="row textarea-row">
                              <textarea class="form-control review-textarea" name="content" rows="5" id="reviewUpdateContent" placeholder="이곳에 작성해주세요." style="background-color: lightgray; resize: none;"></textarea>
                           </div>
                           <div class="row float-right textarea-count-row">
                              <span class="counter">0</span><span class="textarea-count" style="margin-right: 0.5rem;">/150자</span>
                           </div>
                        </div>
                     </div>
                     <hr>
                     <div class="row attachPhoto-modal">
                        <button type="button" class="btn-secondary btn-block attachPhoto-btn" style="height: 2.5rem; font-weight: lighter; border: none;">
                           <i class="fa fa-camera"></i>&nbsp;사진 첨부하기
                        </button>
                        <div id="photo-result" style="margin-top:1rem; width:10rem; height:12rem; border-style:none;">
                           <img class="photo-preview" style="width: 100%; height: 100%; border:none;">
                        </div>
                        <input type="file" class="review-btn" name="reviewPhoto" style="display: none;" onchange="loadImg(this)">
                     </div>
                  </div>
                  <div class="modal-footer justify-content-center">
                     <button type="reset" class="btn btn-light" data-dismiss="modal">취소하기</button>
                     <button type="submit" class="btn btn-secondary">수정하기</button>
                  </div>
               </div>
            </div>
         </div>
      </form>
      
      <!--로그인한 멤버의 위시리스트에 해당 상품이 들어있을 경우-->
      <script>
         $(function(){
            
            if(<%=wishCheck%> == 0) {
               $(".fa-heart").css("color","gray");
            }else {
               $(".fa-heart").css("color","pink");
            }
         
         })
      </script>
      
      
      <script>
         $(function(){
            $("#iteminfo-wish-span").click(function(){
               
               if($(this).children("i").css("style") == "gray") {
                  $("#goWish-real-btn").click();
               }else {
                  var deletewish = confirm("찜 목록에서 삭제하시겠습니까?");
                  
                  if(deletewish) {
                     $.ajax({
                        url:"<%=request.getContextPath()%>/delete.wi",
                        type : "POST",
                        data : {itemNo:itemNo},
                        success : function(data) {                  
                           if(data == "something") {
                              $("#goReview-real-btn").click();
                           }else if(data == "nothing"){
                              alert("등록할 리뷰가 없습니다.");
                           }else {
                              alert("로그인한 회원만 리뷰를 작성할 수 있습니다.")
                           }
                        },
                        error : function(request, status, error) {
                           alert("code: " + request.status + "message: " + request.responseText + "error: " + error);
                        }
                     })
                  }
               }
            })
         })
      </script> 


      <!--찜하기 모달-->
      <form action="<%=request.getContextPath()%>/goWish.it" method="post">
         <div class="modal fade reviewModal" id="goWish">
            <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close modal-close" data-dismiss="modal">&times;</button>
                  </div>
                  <div class="modal-body">
                     <div class="row title-modal">
                        <div class="container-fluid title-modal-container">
                           <p class="h4 my-auto" style="text-align: center">찜하기</p>
                        </div>
                     </div>
                     <div class="row iteminfo-modal">
                        <div class="col col-4 iteminfo-modal-img">
                           <img class="iteminfo-modal-image" src="<%=request.getContextPath()%>/<%=item.getItemMainImgPath()%>/<%=item.getItemMainImg()%>">
                        </div>
                        <div class="col col-8 iteminfo-modal-text">
                           <div class="row iteminfo-modal-title" style="margin-bottom: 0rem;">
                              <p class="h6 my-auto" style="color: gray; font-size: 1rem;">[<%=item.getItemName()%>]</p>
                              <input type="hidden" name="orderInfo" id="updateReviewNo" value="">
                           </div>
                           <div class="row iteminfo-modal-content" style="padding-right: 1rem;">
                              <p style="font-size: 0.8rem;"><%=item.getItemInfo()%></p>
                           </div>
                        </div>
                     </div>
                     <hr>
                     <div class="row writing-modal">
                        <div class="container writing-modal-container">
                           <p class="h5 my-auto" style="text-align: center">간단한 메모를 남겨주세요!</p>
                        </div>
                        <div class="container textarea-modal-container">
                           <div class="row textarea-row">
                              <textarea class="form-control review-textarea" name="content" rows="5" id="goWishMemo" placeholder="이곳에 작성해주세요." style="background-color: lightgray; resize: none;"></textarea>
                           </div>
                           <div class="row float-right textarea-count-row">
                              <span class="counter">0</span><span class="textarea-count" style="margin-right: 0.5rem;">/150자</span>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="modal-footer justify-content-center">
                     <button type="reset" class="btn btn-light" data-dismiss="modal">취소하기</button>
                     <button type="submit" class="btn btn-secondary">찜하기</button>
                  </div>
               </div>
            </div>
         </div>
      </form>
      
      
      
      
      
      
      
      
      



      






      <!--다른 사람 리뷰-->
      <div class="container review-container">
         <div class="row review-title">
            <p class="h1">REVIEW</p>
         </div>
         <div class="row review-content">
            <table class="table table-hover review-table">
               <tbody>
                  <%for(int i = 0; i < otherReviewList.size(); i++) {%>
                  <tr>
                     <%
                        String rank = "";
                     
                        switch(otherReviewList.get(i).getMemberRank()) {
                        case "R1": rank = "seed1.png";
                                 break;
                        case "R2": rank = "sprout2.png";
                                 break;
                        case "R3": rank = "branch3.png";
                                 break;
                        case "R4": rank = "fruit4.png";
                                 break;
                        case "R5": rank = "tree5.png";
                                 break;
                        }
                     %>
                     <td><img
                        src="<%=request.getContextPath()%>/images/rank/<%=rank%>"
                        class="user-grade-image" style="width: 5rem; height: 5rem;"></td>
                     <td>
                        <div class="row review-star-score">
                           <%for(int k = 0; k < 1; k++) {%>
                           <%for(int j = 0; j < 5; j++) {%>

                           <%if(j < otherReviewList.get(i).getReviewRate()) {%>
                           <i class="fa fa-star"></i>
                           <%}else {%>
                           <i class="fa fa-star-o"></i>
                           <%}%>

                           <%}%>
                           <%}%>
                        </div>
                        <div class="row review-set" id="review-set">
                           <span class="review-id"><%=otherReviewList.get(i).getMemberId()%>/</span><span
                              class="review-date"><%=otherReviewList.get(i).getReviewUDate()%></span>
                        </div>
                        <div class="row review-cont">
                           <p class="review-cont-real"><%=otherReviewList.get(i).getReviewContent()%></p>
                        </div>
                        <div class="row review-bigImage" style="margin-top: 1rem;">
                           <img
                              src="<%=request.getContextPath()%>/<%=otherReviewList.get(i).getReviewImgPath()%>/<%=otherReviewList.get(i).getReviewImgName()%>"
                              id="big-review-image" style="width: 30rem; height: 30rem;">
                        </div>
                     </td>
                     <td class="fadeout-image"><img
                        src="<%=request.getContextPath()%>/<%=otherReviewList.get(i).getReviewImgPath()%>/<%=otherReviewList.get(i).getReviewImgName()%>"
                        id="mini-review-image" style="width: 7rem; height: 7rem;"></td>
                  </tr>
                  <%}%>
               </tbody>
            </table>
            <nav class="review-pagination mx-auto">
               <ul class="pagination justify-content-center">
                  <li class="page-item"><a class="page-link" href="#"
                     aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                  </a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                  </a></li>
               </ul>
            </nav>
         </div>
      </div>
      
      
      
      <!--수량 체크와 관련된 script-->
      <script>
         $(function(){
            $(".cancel-button").click(function(e){
               
               $("#quantityNumber").val("0");

                    if($("#quantityNumber").val()==0){
                       $(".iteminfo-quantity").css("background","white");
                        $(".iteminfo-quantity-result").css("display","none");
                    }

                    })
                })
                
         $(function(){
            $("#quantityNumber").change(function(e){
               
               var quantity = $("#quantityNumber").val();

               if(quantity>0){
                  $(".iteminfo-quantity").css("background","lightgray");
                  $(".iteminfo-quantity").css("margin-bottom","0");
                  $(".iteminfo-quantity-result").css("display","block");
               }else {
                  $(".iteminfo-quantity").css("background","white");
                  $(".iteminfo-quantity-result").css("display","none");
               }
               
               $("#whole-quantity").text(quantity);

               var wholePrice = quantity * (<%=item.getItemPrice()-item.getItemDiscount()%>);

               $("#whole-price").text(wholePrice);
            })
            
         })
      </script>



      <!--리뷰 사진 확대-->
      <script>
      $(function() {
         $("tr").click(function() {
            
               if ($(this).find("#big-review-image").css("display") == "none") {
                  $(this).find("#big-review-image").css("display", "block");
                  $(this).find("#mini-review-image").css("visibility", "hidden");
               } else {
                  $(this).find("#big-review-image").css("display", "none");
                  $(this).find("#mini-review-image").css("visibility", "visible");
               }
         })
      })
      </script>

      <!--리뷰 쓰러가기 버튼 누르면-->
      <script>
      $(function() {
         $("#goReview-btn").click(function(){
            
            var itemNo = "<%=item.getItemNo()%>";

               $.ajax({
                  url:"<%=request.getContextPath()%>/status.rv",
                  type : "POST",
                  data : {itemNo:itemNo},
                  success : function(data) {                  
                     if(data == "something") {
                        $("#goReview-real-btn").click();
                     }else if(data == "nothing"){
                        alert("등록할 리뷰가 없습니다.");
                     }else {
                        alert("로그인한 회원만 리뷰를 작성할 수 있습니다.")
                     }
                  },
                  error : function(request, status, error) {
                     alert("code: " + request.status + "message: " + request.responseText + "error: " + error);
                  }
               })
         })
      })
      </script>
      
      
      
      
      <!--리뷰 수정하기 버튼 누르면-->
      <script>
      $(function() {
         $("#updateReview-btn").click(function(){
            
            var reviewNo = $(this).siblings("input").val();
            
               console.log(reviewNo);

               $.ajax({
                  url:"<%=request.getContextPath()%>/update.rv",
                  type : "POST",
                  data : {reviewNo:reviewNo},
                  success : function(data) {                  
                     
                     var reviewNo = data.reviewNo;
                     var reviewUDate = data.reviewUDate;
                     var reviewContent = data.reviewContent;
                     
                     console.log(reviewUDate);
                     
                     $("#updateReviewNo").val(reviewNo);
                     $("#updateReviewUDate").html("[리뷰작성일: " + reviewUDate + "]");
                     $("#reviewUpdateContent").text(reviewContent);                     
                     
                     $("#updateReview-real-btn").click();

                  },
                  error : function(request, status, error) {
                     alert("code: " + request.status + "message: " + request.responseText + "error: " + error);
                  }
               })
               
               
         })
      })
      </script>
      
      
   

      <!--리뷰 글자 수 세기(script)-->
      <script>          
            $(function(){               
               $(".review-textarea").keyup(function(){
                  var inputLength = $(this).val().length;                  
                  $(".counter").text(inputLength);
               })
            })
            
            $(function(){
                $(".review-textarea").keydown(function(){
                    var inputLength=$(this).val().length;
                    $(".counter").text(inputLength);
                    
                  var remain=150-inputLength;
                  
                  if(remain>=0) {
                     $(".counter").parent().css("color","black");
                  }else {
                     $(".counter").parent().css("color","red");
                  }
                })
            })
        </script>



      <!--별 평점 주기(script)-->
      <script>
            var starRating=$(".starRating .fa");

            var SetRatingStar = function(){
                return starRating.each(function(){
                    if (parseInt(starRating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
                        return $(this).removeClass('fa-star-o').addClass('fa-star');
                    } else {
                        return $(this).removeClass('fa-star').addClass('fa-star-o');
                    }
                });
            };
            
            starRating.on('click', function(){
               starRating.siblings('input.rating-value').val($(this).data('rating'));
               
               return SetRatingStar();
            });
            
            SetRatingStar();
        </script>



      <!--사진 첨부 버튼을 누르면 숨겨진 input이 눌리게-->
      <script>
         $(function(){
            $(".attachPhoto-btn").click(function(){
               $(".review-btn").click();
            })
         })
      </script>



      <!--사진 미리보기-->
      <script>
         function loadImg(value) {
            if(value.files && value.files[0]) {
               var reader = new FileReader();
               
               reader.onload = function(e) {
                  $(".photo-preview").attr("src", e.target.result);
               }
            }
            reader.readAsDataURL(value.files[0]);
         }
      </script>
      
   </section>
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