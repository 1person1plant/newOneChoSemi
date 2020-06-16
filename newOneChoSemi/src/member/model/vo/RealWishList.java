package member.model.vo;

public class RealWishList {
	private String wishlistNo;
	private String itemNo;
	private String memberNo;
	private String wishlistMemo;
	public RealWishList(String wishlistNo, String itemNo, String memberNo, String wishlistMemo) {
		super();
		this.wishlistNo = wishlistNo;
		this.itemNo = itemNo;
		this.memberNo = memberNo;
		this.wishlistMemo = wishlistMemo;
	}
	public RealWishList() {
		super();
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
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getWishlistMemo() {
		return wishlistMemo;
	}
	public void setWishlistMemo(String wishlistMemo) {
		this.wishlistMemo = wishlistMemo;
	}
	@Override
	public String toString() {
		return "RealWishList [wishlistNo=" + wishlistNo + ", itemNo=" + itemNo + ", memberNo=" + memberNo
				+ ", wishlistMemo=" + wishlistMemo + "]";
	}
	public RealWishList(String wishlistNo, String memberNo, String wishlistMemo) {
		super();
		this.wishlistNo = wishlistNo;
		this.memberNo = memberNo;
		this.wishlistMemo = wishlistMemo;
	}
	
	
	
	

}
