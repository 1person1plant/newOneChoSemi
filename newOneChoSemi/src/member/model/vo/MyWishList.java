package member.model.vo;

public class MyWishList {
	private String wishlistMemo;
	private String wishlistNo;
	private String itemNo;
	private String imageName;
	private String imagePath;
	private String itemName;
	private String memberNo;
	public MyWishList() {
		super();
	}
	public MyWishList(String wishlistMemo, String wishlistNo, String itemNo, String imageName, String imagePath,
			String itemName, String memberNo) {
		super();
		this.wishlistMemo = wishlistMemo;
		this.wishlistNo = wishlistNo;
		this.itemNo = itemNo;
		this.imageName = imageName;
		this.imagePath = imagePath;
		this.itemName = itemName;
		this.memberNo = memberNo;
	}
	public String getWishlistMemo() {
		return wishlistMemo;
	}
	public void setWishlistMemo(String wishlistMemo) {
		this.wishlistMemo = wishlistMemo;
	}
	public String getWishlistNo() {
		return wishlistNo;
	}
	public void setWishlistNo(String wishlistNo) {
		this.wishlistNo = wishlistNo;
	}
	public String getItemNo() {
		return itemNo;
	}
	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
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
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "MyWishList [wishlistMemo=" + wishlistMemo + ", wishlistNo=" + wishlistNo + ", itemNo=" + itemNo
				+ ", imageName=" + imageName + ", imagePath=" + imagePath + ", itemName=" + itemName + ", memberNo="
				+ memberNo + "]";
	}
	public MyWishList(String wishlistMemo, String wishlistNo, String memberNo) {
		super();
		this.wishlistMemo = wishlistMemo;
		this.wishlistNo = wishlistNo;
		this.memberNo = memberNo;
	}
	
	
		
}
