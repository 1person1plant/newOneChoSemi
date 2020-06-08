package cartList.model.vo;

import java.io.Serializable;

public class Cart implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4898290017598692978L;
	private String memberNo;	// 회원 번호
	private String cartListNo;	// 장바구니 번호
	private String itemNo;		// 상품 번호
	private String itemName;	// 상품 이름
	private int itemPrice;		// 상품 가격
	private int itemMax;		// 상품 구매 최대 수량
	private int cartListCount;	// 카트 상품 수량
	private String itemImageNo;	// 상품 이미지 번호
	private String imageNo;		// 이미지 번호
	private String imagePath;	// 이미지 경로
	private String imageName;	// 이미지 이름
	public Cart() {
	}
	public Cart(String memberNo, String itemNo, String itemName, int itemPrice, int itemMax, int cartListCount,
			String imageName) {
		this.memberNo = memberNo;
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemMax = itemMax;
		this.cartListCount = cartListCount;
		this.imageName = imageName;
	}
	public Cart(String memberNo, String cartListNo, String itemNo, String itemName, int itemPrice, int itemMax, int cartListCount,
			String imageName) {
		this.memberNo = memberNo;
		this.cartListNo = cartListNo;
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemMax = itemMax;
		this.cartListCount = cartListCount;
		this.imageName = imageName;
	}
	public Cart(String memberNo, String cartListNo, String itemNo, String itemName, int itemPrice, int itemMax,
			int cartListCount, String itemImageNo, String imageNo, String imagePath, String imageName) {
		this.memberNo = memberNo;
		this.cartListNo = cartListNo;
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemMax = itemMax;
		this.cartListCount = cartListCount;
		this.itemImageNo = itemImageNo;
		this.imageNo = imageNo;
		this.imagePath = imagePath;
		this.imageName = imageName;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getCartListNo() {
		return cartListNo;
	}
	public void setCartListNo(String cartListNo) {
		this.cartListNo = cartListNo;
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
	public int getItemMax() {
		return itemMax;
	}
	public void setItemMax(int itemMax) {
		this.itemMax = itemMax;
	}
	public int getCartListCount() {
		return cartListCount;
	}
	public void setCartListCount(int cartListCount) {
		this.cartListCount = cartListCount;
	}
	public String getItemImageNo() {
		return itemImageNo;
	}
	public void setItemImageNo(String itemImageNo) {
		this.itemImageNo = itemImageNo;
	}
	public String getImageNo() {
		return imageNo;
	}
	public void setImageNo(String imageNo) {
		this.imageNo = imageNo;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	@Override
	public String toString() {
		return "Cart [memberNo=" + memberNo + ", cartListNo=" + cartListNo + ", itemNo=" + itemNo + ", itemName="
				+ itemName + ", itemPrice=" + itemPrice + ", itemMax=" + itemMax + ", cartListCount=" + cartListCount
				+ ", itemImageNo=" + itemImageNo + ", imageNo=" + imageNo + ", imagePath=" + imagePath + ", imageName="
				+ imageName + "]";
	}
}
