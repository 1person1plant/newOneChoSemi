package cartList.model.vo;

import java.io.Serializable;

public class WishList implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8371342916993835062L;
	private String wishListNo;	// 즐겨찾기 번호
	private String memberNo;	// 회원번호
	private String itemNo;		// 상품 번호
	private String itemName;	// 상품 이름
	private int itemPrice;		// 상품 가격
	private String wishListMemo;// 즐겨찾기 메모
	private String itemImageNo;	// 상품 이미지 번호
	private String imageNo;		// 이미지 번호
	private String imagePath;	// 이미지 경로
	private String imageName;	// 이미지 이름
	public WishList() {
		super();
	}
	public WishList(String wishListNo, String wishListMemo) {
		super();
		this.wishListNo = wishListNo;
		this.wishListMemo = wishListMemo;
	}
	public WishList(String wishListNo, String itemNo, String itemName, int itemPrice, String wishListMemo,
			String imageNo, String imagePath, String imageName) {
		super();
		this.wishListNo = wishListNo;
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.wishListMemo = wishListMemo;
		this.imageNo = imageNo;
		this.imagePath = imagePath;
		this.imageName = imageName;
	}
	public WishList(String wishListNo, String memberNo, String itemNo, String itemName, int itemPrice,
			String wishListMemo, String itemImageNo, String imageNo, String imagePath, String imageName) {
		super();
		this.wishListNo = wishListNo;
		this.memberNo = memberNo;
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.wishListMemo = wishListMemo;
		this.itemImageNo = itemImageNo;
		this.imageNo = imageNo;
		this.imagePath = imagePath;
		this.imageName = imageName;
	}
	public String getWishListNo() {
		return wishListNo;
	}
	public void setWishListNo(String wishListNo) {
		this.wishListNo = wishListNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
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
	public String getWishListMemo() {
		return wishListMemo;
	}
	public void setWishListMemo(String wishListMemo) {
		this.wishListMemo = wishListMemo;
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
		return "WishList [wishListNo=" + wishListNo + ", memberNo=" + memberNo + ", itemNo=" + itemNo + ", itemName="
				+ itemName + ", itemPrice=" + itemPrice + ", wishListMemo=" + wishListMemo + ", itemImageNo="
				+ itemImageNo + ", imageNo=" + imageNo + ", imagePath=" + imagePath + ", imageName=" + imageName + "]";
	}
}
