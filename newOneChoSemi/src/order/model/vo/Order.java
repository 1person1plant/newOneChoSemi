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
	private String itemName;			// 상품 이름
	private int itemPrice;				// 상품 가격
	private int itemDisCount;			// 상품 할인가
	private int itemMax;				// 상품 구매 최대 수량
	private String imagepath;			// 이미지 경로
	private String imageName;			// 이미지 이름
	private String memberId;			// 회원 아이디
	private String memberName;			// 회원 이름
	private int memberPhone1;			// 회원 전화번호 앞 자리
	private int memberPhone2;			// 회원 전화번호 중간 자리
	private int memberPhone3;			// 회원 전화번호 뒷 자리
	private int memberPostcode;			// 회원 우편번호
	private String memberAddress1;		// 회원 주소
	private String memberAddress2;		// 회원 상세 주소
	private int memberPoint;			// 회원 보유포인트
	private String rankPointRat;		// 등급 적립율
	private String rankPointCap;		// 등급 포인트 사용 한도
	private Date orderDate; 			// 주문 일시
	private int	orderCount; 			// 주문 수량
	private int	orderUsePoint; 			// 사용 포인트
	private String orderName; 			// 수령자 이름
	private int orderPhone1;			// 수령자 전화번호 앞 자리
	private int orderPhone2;			// 수령자 전화번호 중간 자리
	private int orderPhone3;			// 수령자 전화번호 뒷 자리
	private int orderPostcode;			// 수령자 우편번호
	private String orderAddress1;		// 수형자 주소
	private String orderAddress2;		// 수령자 상세 주소
	private String orderRequest;		// 수령자 요청사항
	private int orderDCost;				// 배송비
	public Order() {
	}
	public Order(String orderNo, String itemNo, String itemName, int itemPrice, int itemDisCount, int itemMax,
			String imagepath, String imageName, String memberId, String memberName, int memberPhone1, int memberPhone2,
			int memberPhone3, int memberPostcode, String memberAddress1, String memberAddress2, int memberPoint,
			String rankPointRat, String rankPointCap, Date orderDate, int orderCount, int orderUsePoint,
			String orderName, int orderPhone1, int orderPhone2, int orderPhone3, int orderPostcode,
			String orderAddress1, String orderAddress2, String orderRequest, int orderDCost) {
		this.orderNo = orderNo;
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemDisCount = itemDisCount;
		this.itemMax = itemMax;
		this.imagepath = imagepath;
		this.imageName = imageName;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPhone1 = memberPhone1;
		this.memberPhone2 = memberPhone2;
		this.memberPhone3 = memberPhone3;
		this.memberPostcode = memberPostcode;
		this.memberAddress1 = memberAddress1;
		this.memberAddress2 = memberAddress2;
		this.memberPoint = memberPoint;
		this.rankPointRat = rankPointRat;
		this.rankPointCap = rankPointCap;
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
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getItemDisCount() {
		return itemDisCount;
	}
	public void setItemDisCount(int itemDisCount) {
		this.itemDisCount = itemDisCount;
	}
	public int getItemMax() {
		return itemMax;
	}
	public void setItemMax(int itemMax) {
		this.itemMax = itemMax;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getMemberPhone1() {
		return memberPhone1;
	}
	public void setMemberPhone1(int memberPhone1) {
		this.memberPhone1 = memberPhone1;
	}
	public int getMemberPhone2() {
		return memberPhone2;
	}
	public void setMemberPhone2(int memberPhone2) {
		this.memberPhone2 = memberPhone2;
	}
	public int getMemberPhone3() {
		return memberPhone3;
	}
	public void setMemberPhone3(int memberPhone3) {
		this.memberPhone3 = memberPhone3;
	}
	public int getMemberPostcode() {
		return memberPostcode;
	}
	public void setMemberPostcode(int memberPostcode) {
		this.memberPostcode = memberPostcode;
	}
	public String getMemberAddress1() {
		return memberAddress1;
	}
	public void setMemberAddress1(String memberAddress1) {
		this.memberAddress1 = memberAddress1;
	}
	public String getMemberAddress2() {
		return memberAddress2;
	}
	public void setMemberAddress2(String memberAddress2) {
		this.memberAddress2 = memberAddress2;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public String getRankPointRat() {
		return rankPointRat;
	}
	public void setRankPointRat(String rankPointRat) {
		this.rankPointRat = rankPointRat;
	}
	public String getRankPointCap() {
		return rankPointCap;
	}
	public void setRankPointCap(String rankPointCap) {
		this.rankPointCap = rankPointCap;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
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
	public int getOrderPhone1() {
		return orderPhone1;
	}
	public void setOrderPhone1(int orderPhone1) {
		this.orderPhone1 = orderPhone1;
	}
	public int getOrderPhone2() {
		return orderPhone2;
	}
	public void setOrderPhone2(int orderPhone2) {
		this.orderPhone2 = orderPhone2;
	}
	public int getOrderPhone3() {
		return orderPhone3;
	}
	public void setOrderPhone3(int orderPhone3) {
		this.orderPhone3 = orderPhone3;
	}
	public int getOrderPostcode() {
		return orderPostcode;
	}
	public void setOrderPostcode(int orderPostcode) {
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
	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", itemNo=" + itemNo + ", itemName=" + itemName + ", itemPrice="
				+ itemPrice + ", itemDisCount=" + itemDisCount + ", itemMax=" + itemMax + ", imagepath=" + imagepath
				+ ", imageName=" + imageName + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", memberPhone1=" + memberPhone1 + ", memberPhone2=" + memberPhone2 + ", memberPhone3=" + memberPhone3
				+ ", memberPostcode=" + memberPostcode + ", memberAddress1=" + memberAddress1 + ", memberAddress2="
				+ memberAddress2 + ", memberPoint=" + memberPoint + ", rankPointRat=" + rankPointRat + ", rankPointCap="
				+ rankPointCap + ", orderDate=" + orderDate + ", orderCount=" + orderCount + ", orderUsePoint="
				+ orderUsePoint + ", orderName=" + orderName + ", orderPhone1=" + orderPhone1 + ", orderPhone2="
				+ orderPhone2 + ", orderPhone3=" + orderPhone3 + ", orderPostcode=" + orderPostcode + ", orderAddress1="
				+ orderAddress1 + ", orderAddress2=" + orderAddress2 + ", orderRequest=" + orderRequest
				+ ", orderDCost=" + orderDCost + "]";
	}
	
}
