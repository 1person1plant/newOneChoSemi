package member.model.vo;

public class Grade {
	private String memberNo;
	private String memberRank;
	private int memberPoint;
	private int totalPrice;
	public Grade() {
		super();
	}
	
	public Grade(String memberNo, String memberRank, int memberPoint, int totalPrice) {
		super();
		this.memberNo = memberNo;
		this.memberRank = memberRank;
		this.memberPoint = memberPoint;
		this.totalPrice = totalPrice;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberRank() {
		return memberRank;
	}
	public void setMemberRank(String memberRank) {
		this.memberRank = memberRank;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	@Override
	public String toString() {
		return "Grade [memberNo=" + memberNo + ", memberRank=" + memberRank + ", memberPoint=" + memberPoint
				+ ", totalPrice=" + totalPrice + "]";
	}
	
	
}
