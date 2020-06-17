package order.model.vo;

public class OrderHis {
	private String orderNo;
	private String imageName;
	private String itemNo;
	private String itemName;
	private int orderCount;
	private String deliveryStatus;
	private String memberNo;
	private String orderCancelrequest;
	public OrderHis() {
		super();
	}
	public OrderHis(String orderNo, String imageName, String itemNo, String itemName, int orderCount,
			String deliveryStatus, String memberNo, String orderCancelrequest) {
		super();
		this.orderNo = orderNo;
		this.imageName = imageName;
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.orderCount = orderCount;
		this.deliveryStatus = deliveryStatus;
		this.memberNo = memberNo;
		this.orderCancelrequest = orderCancelrequest;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
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
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getOrderCancelrequest() {
		return orderCancelrequest;
	}
	public void setOrderCancelrequest(String orderCancelrequest) {
		this.orderCancelrequest = orderCancelrequest;
	}
	@Override
	public String toString() {
		return "OrderHis [orderNo=" + orderNo + ", imageName=" + imageName + ", itemNo=" + itemNo + ", itemName="
				+ itemName + ", orderCount=" + orderCount + ", deliveryStatus=" + deliveryStatus + ", memberNo="
				+ memberNo + ", orderCancelrequest=" + orderCancelrequest + "]";
	}
	
	

}
