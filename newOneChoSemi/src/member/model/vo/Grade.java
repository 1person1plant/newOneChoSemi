package member.model.vo;

public class Grade {
	private String memberNo;
	private String memberRank;
	private int memberPoint;
	private int memberTotalpurchasemount;
	public Grade() {
		super();
	}
	public Grade(String memberNo, String memberRank, int memberPoint, int memberTotalpurchasemount) {
		super();
		this.memberNo = memberNo;
		this.memberRank = memberRank;
		this.memberPoint = memberPoint;
		this.memberTotalpurchasemount = memberTotalpurchasemount;
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
	public int getMemberTotalpurchasemount() {
		return memberTotalpurchasemount;
	}
	public void setMemberTotalpurchasemount(int memberTotalpurchasemount) {
		this.memberTotalpurchasemount = memberTotalpurchasemount;
	}
	@Override
	public String toString() {
		return "Grade [memberNo=" + memberNo + ", memberRank=" + memberRank + ", memberPoint=" + memberPoint
				+ ", memberTotalpurchasemount=" + memberTotalpurchasemount + "]";
	}
	
}
