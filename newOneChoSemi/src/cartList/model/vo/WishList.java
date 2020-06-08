package cartList.model.vo;

import java.io.Serializable;

public class WishList implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8371342916993835062L;
	private String wishListNo;
	private String itemNo;
	private String memberNo;
	private String wishListMemo;
	public WishList() {
	}
	public WishList(String wishListNo, String itemNo, String memberNo, String wishListMemo) {
		this.wishListNo = wishListNo;
		this.itemNo = itemNo;
		this.memberNo = memberNo;
		this.wishListMemo = wishListMemo;
	}
	public String getWishListNo() {
		return wishListNo;
	}
	public void setWishListNo(String wishListNo) {
		this.wishListNo = wishListNo;
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
	public String getWishListMemo() {
		return wishListMemo;
	}
	public void setWishListMemo(String wishListMemo) {
		this.wishListMemo = wishListMemo;
	}
	@Override
	public String toString() {
		return "WishList [wishListNo=" + wishListNo + ", itemNo=" + itemNo + ", memberNo=" + memberNo
				+ ", wishListMemo=" + wishListMemo + "]";
	}
}
