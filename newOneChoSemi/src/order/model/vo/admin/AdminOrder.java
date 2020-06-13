package order.model.vo.admin;

import java.sql.Date;

public class AdminOrder {

	
	private String orderNo;
	private Date orderDate;
	private String itemNo;
	private String itemName;
	private String paymentStatus;
	private String cancelRequest;
	private String deliveryStatus;
	private int orderCount;
	private String memberId;
	
	public AdminOrder() {
		super();
	}

	public AdminOrder(String orderNo, Date orderDate, String itemNo, String itemName, String paymentStatus,
			String cancelRequest, String deliveryStatus, int orderCount, String memberId) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.paymentStatus = paymentStatus;
		this.cancelRequest = cancelRequest;
		this.deliveryStatus = deliveryStatus;
		this.orderCount = orderCount;
		this.memberId = memberId;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
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

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getCancelRequest() {
		return cancelRequest;
	}

	public void setCancelRequest(String cancelRequest) {
		this.cancelRequest = cancelRequest;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "AdminOrder [orderNo=" + orderNo + ", orderDate=" + orderDate + ", itemNo=" + itemNo + ", itemName="
				+ itemName + ", paymentStatus=" + paymentStatus + ", cancelRequest=" + cancelRequest
				+ ", deliveryStatus=" + deliveryStatus + ", orderCount=" + orderCount + ", memberId=" + memberId + "]";
	}
	
	
	
	
	
}
