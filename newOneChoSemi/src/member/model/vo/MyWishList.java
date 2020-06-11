package member.model.vo;

public class MyWishList {
	private String wishlistNo;
	private String imagePath;
	private String itemName;
	private String wishlistMemo;
	private String memberNo;
	public MyWishList() {
		super();
	}
	public MyWishList(String wishlistNo, String imagePath, String itemName, String wishlistMemo, String memberNo) {
		super();
		this.wishlistNo = wishlistNo;
		this.imagePath = imagePath;
		this.itemName = itemName;
		this.wishlistMemo = wishlistMemo;
		this.memberNo = memberNo;
	}
	public String getWishlistNo() {
		return wishlistNo;
	}
	public void setWishlistNo(String wishlistNo) {
		this.wishlistNo = wishlistNo;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getWishlistMemo() {
		return wishlistMemo;
	}
	public void setWishlistMemo(String wishlistMemo) {
		this.wishlistMemo = wishlistMemo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "MyWishList [wishlistNo=" + wishlistNo + ", imagePath=" + imagePath + ", itemName=" + itemName
				+ ", wishlistMemo=" + wishlistMemo + ", memberNo=" + memberNo + "]";
	}
	
	
	
	
}
