package order.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8042025341247276539L;
	private String orderNo;				// 주문 번호 pk
	private String itemNo;				// 상품 번호 pk
	private String memberNo;			// 회원 번호 
	private Date orderDate; 			// 주문 일시
	private String orderItemName; 		// 구매 시 상품 이름
	private String orderItemImgName; 	// 구매 시 상품 사진 이름
	private String orderItemImgPath; 	// 구매 시 상품 사진 경로
	private String orderItemPrice; 		// 구매 시 상품 가격
	private String orderItemDiscount; 	// 구매 시 상품 할인 값
	private int	orderCount; 			// 주문 수량
	private int	orderUsePoint; 			// 사용 포인트
	private String orderName; 			// 수령자 이름
	private String orderPhone1;			// 수령자 전화번호 앞 자리
	private String orderPhone2;			// 수령자 전화번호 중간 자리
	private String orderPhone3;			// 수령자 전화번호 뒷 자리
	private String orderPostcode;		// 수령자 우편번호
	private String orderAddress1;		// 수령자 주소
	private String orderAddress2;		// 수령자 상세 주소
	private String orderRequest;		// 수령자 요청사항
	private int orderDCost;				// 배송비
	private String orderReview;			// 기본: N 작성 후 : Y
	private String orderCancelrequest;	// 기본: N 취소 : Y
	private String orderCancelyn;		// 기본: N , 승인 : Y (주문 삭제 효과)
	private String deliveryCode;		// D1 : 배송전, D2 : 배송중, D3 : 배송완료
	private String paymentCode;			// P1 : 입금 전, P2 : 입금 후	
	public Order() {
		super();
	}
	public Order(String orderNo, String itemNo, String memberNo, Date orderDate, int orderCount, int orderUsePoint,
			String orderName, String orderPhone1, String orderPhone2, String orderPhone3, String orderPostcode,
			String orderAddress1, String orderAddress2, String orderRequest, int orderDCost, String orderCancelrequest,
			String orderCancelyn, String deliveryCode, String paymentCode) {
		super();
		this.orderNo = orderNo;
		this.itemNo = itemNo;
		this.memberNo = memberNo;
		this.orderDate = orderDate;
		this.orderCount = orderCount;
		this.orderUsePoint = orderUsePoint;
		this.orderName = orderName;
		this.orderPhone1 = orderPhone1;
		this.orderPhone2 = orderPhone2;
		this.orderPhone3 = orderPhone3;
		this.orderPostcode = orderPostcode;
		this.orderAddress1 = orderAddress1;
		this.orderAddress2 = orderAddress2;
		this.orderRequest = orderRequest;
		this.orderDCost = orderDCost;
		this.orderCancelrequest = orderCancelrequest;
		this.orderCancelyn = orderCancelyn;
		this.deliveryCode = deliveryCode;
		this.paymentCode = paymentCode;
	}
	
	public Order(String orderNo, String itemNo, String memberNo, Date orderDate, String orderItemName,
			String orderItemPrice, String orderItemDiscount, int orderCount, int orderUsePoint, String orderName,
			String orderPhone1, String orderPhone2, String orderPhone3, String orderPostcode, String orderAddress1,
			String orderAddress2, String orderRequest, int orderDCost, String orderReview, String orderCancelrequest,
			String orderCancelyn, String deliveryCode, String paymentCode) {
		super();
		this.orderNo = orderNo;
		this.itemNo = itemNo;
		this.memberNo = memberNo;
		this.orderDate = orderDate;
		this.orderItemName = orderItemName;
		this.orderItemPrice = orderItemPrice;
		this.orderItemDiscount = orderItemDiscount;
		this.orderCount = orderCount;
		this.orderUsePoint = orderUsePoint;
		this.orderName = orderName;
		this.orderPhone1 = orderPhone1;
		this.orderPhone2 = orderPhone2;
		this.orderPhone3 = orderPhone3;
		this.orderPostcode = orderPostcode;
		this.orderAddress1 = orderAddress1;
		this.orderAddress2 = orderAddress2;
		this.orderRequest = orderRequest;
		this.orderDCost = orderDCost;
		this.orderReview = orderReview;
		this.orderCancelrequest = orderCancelrequest;
		this.orderCancelyn = orderCancelyn;
		this.deliveryCode = deliveryCode;
		this.paymentCode = paymentCode;
	}
	
	public Order(String orderNo, String itemNo, String memberNo, Date orderDate, String orderItemName,
			String orderItemImgName, String orderItemImgPath, String orderItemPrice, String orderItemDiscount,
			int orderCount, int orderUsePoint, String orderName, String orderPhone1, String orderPhone2,
			String orderPhone3, String orderPostcode, String orderAddress1, String orderAddress2, String orderRequest,
			int orderDCost, String orderReview, String orderCancelrequest, String orderCancelyn, String deliveryCode,
			String paymentCode) {
		super();
		this.orderNo = orderNo;
		this.itemNo = itemNo;
		this.memberNo = memberNo;
		this.orderDate = orderDate;
		this.orderItemName = orderItemName;
		this.orderItemImgName = orderItemImgName;
		this.orderItemImgPath = orderItemImgPath;
		this.orderItemPrice = orderItemPrice;
		this.orderItemDiscount = orderItemDiscount;
		this.orderCount = orderCount;
		this.orderUsePoint = orderUsePoint;
		this.orderName = orderName;
		this.orderPhone1 = orderPhone1;
		this.orderPhone2 = orderPhone2;
		this.orderPhone3 = orderPhone3;
		this.orderPostcode = orderPostcode;
		this.orderAddress1 = orderAddress1;
		this.orderAddress2 = orderAddress2;
		this.orderRequest = orderRequest;
		this.orderDCost = orderDCost;
		this.orderReview = orderReview;
		this.orderCancelrequest = orderCancelrequest;
		this.orderCancelyn = orderCancelyn;
		this.deliveryCode = deliveryCode;
		this.paymentCode = paymentCode;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getItemNo() {
		return itemNo;
	}
	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderItemName() {
		return orderItemName;
	}
	public void setOrderItemName(String orderItemName) {
		this.orderItemName = orderItemName;
	}
	public String getOrderItemImgName() {
		return orderItemImgName;
	}
	public void setOrderItemImgName(String orderItemImgName) {
		this.orderItemImgName = orderItemImgName;
	}
	public String getOrderItemImgPath() {
		return orderItemImgPath;
	}
	public void setOrderItemImgPath(String orderItemImgPath) {
		this.orderItemImgPath = orderItemImgPath;
	}
	public String getOrderItemPrice() {
		return orderItemPrice;
	}
	public void setOrderItemPrice(String orderItemPrice) {
		this.orderItemPrice = orderItemPrice;
	}
	public String getOrderItemDiscount() {
		return orderItemDiscount;
	}
	public void setOrderItemDiscount(String orderItemDiscount) {
		this.orderItemDiscount = orderItemDiscount;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getOrderUsePoint() {
		return orderUsePoint;
	}
	public void setOrderUsePoint(int orderUsePoint) {
		this.orderUsePoint = orderUsePoint;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderPhone1() {
		return orderPhone1;
	}
	public void setOrderPhone1(String orderPhone1) {
		this.orderPhone1 = orderPhone1;
	}
	public String getOrderPhone2() {
		return orderPhone2;
	}
	public void setOrderPhone2(String orderPhone2) {
		this.orderPhone2 = orderPhone2;
	}
	public String getOrderPhone3() {
		return orderPhone3;
	}
	public void setOrderPhone3(String orderPhone3) {
		this.orderPhone3 = orderPhone3;
	}
	public String getOrderPostcode() {
		return orderPostcode;
	}
	public void setOrderPostcode(String orderPostcode) {
		this.orderPostcode = orderPostcode;
	}
	public String getOrderAddress1() {
		return orderAddress1;
	}
	public void setOrderAddress1(String orderAddress1) {
		this.orderAddress1 = orderAddress1;
	}
	public String getOrderAddress2() {
		return orderAddress2;
	}
	public void setOrderAddress2(String orderAddress2) {
		this.orderAddress2 = orderAddress2;
	}
	public String getOrderRequest() {
		return orderRequest;
	}
	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}
	public int getOrderDCost() {
		return orderDCost;
	}
	public void setOrderDCost(int orderDCost) {
		this.orderDCost = orderDCost;
	}
	public String getOrderReview() {
		return orderReview;
	}
	public void setOrderReview(String orderReview) {
		this.orderReview = orderReview;
	}
	public String getOrderCancelrequest() {
		return orderCancelrequest;
	}
	public void setOrderCancelrequest(String orderCancelrequest) {
		this.orderCancelrequest = orderCancelrequest;
	}
	public String getOrderCancelyn() {
		return orderCancelyn;
	}
	public void setOrderCancelyn(String orderCancelyn) {
		this.orderCancelyn = orderCancelyn;
	}
	public String getDeliveryCode() {
		return deliveryCode;
	}
	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
	}
	public String getPaymentCode() {
		return paymentCode;
	}
	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}
	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", itemNo=" + itemNo + ", memberNo=" + memberNo + ", orderDate="
				+ orderDate + ", orderItemName=" + orderItemName + ", orderItemImgName=" + orderItemImgName
				+ ", orderItemImgPath=" + orderItemImgPath + ", orderItemPrice=" + orderItemPrice
				+ ", orderItemDiscount=" + orderItemDiscount + ", orderCount=" + orderCount + ", orderUsePoint="
				+ orderUsePoint + ", orderName=" + orderName + ", orderPhone1=" + orderPhone1 + ", orderPhone2="
				+ orderPhone2 + ", orderPhone3=" + orderPhone3 + ", orderPostcode=" + orderPostcode + ", orderAddress1="
				+ orderAddress1 + ", orderAddress2=" + orderAddress2 + ", orderRequest=" + orderRequest
				+ ", orderDCost=" + orderDCost + ", orderReview=" + orderReview + ", orderCancelrequest="
				+ orderCancelrequest + ", orderCancelyn=" + orderCancelyn + ", deliveryCode=" + deliveryCode
				+ ", paymentCode=" + paymentCode + "]";
	}
}
