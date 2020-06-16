package member.model.vo.admin;

import java.sql.Date;

public class AdminMember {

	private String memberNo;
	private String memberId;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String memberPostCode;
	private String memberAddress;
	private int accumPaid;
	private int accumCount;
	private int memberPoint;
	private String rankName;
	private Date memberJoinDate;
	private String memberStatus;
	private String memberExit;
	private String memberAdmin;
	
	public AdminMember() {
		super();
	}

	public AdminMember(String memberNo, String memberId, String memberName, String memberEmail, String memberPhone,
			String memberPostCode, String memberAddress, int accumPaid, int accumCount, int memberPoint,
			String rankName, Date memberJoinDate, String memberStatus, String memberExit, String memberAdmin) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberPostCode = memberPostCode;
		this.memberAddress = memberAddress;
		this.accumPaid = accumPaid;
		this.accumCount = accumCount;
		this.memberPoint = memberPoint;
		this.rankName = rankName;
		this.memberJoinDate = memberJoinDate;
		this.memberStatus = memberStatus;
		this.memberExit = memberExit;
		this.memberAdmin = memberAdmin;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberPostCode() {
		return memberPostCode;
	}

	public void setMemberPostCode(String memberPostCode) {
		this.memberPostCode = memberPostCode;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public int getAccumPaid() {
		return accumPaid;
	}

	public void setAccumPaid(int accumPaid) {
		this.accumPaid = accumPaid;
	}

	public int getAccumCount() {
		return accumCount;
	}

	public void setAccumCount(int accumCount) {
		this.accumCount = accumCount;
	}

	public int getMemberPoint() {
		return memberPoint;
	}

	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}

	public String getRankName() {
		return rankName;
	}

	public void setRankName(String rankName) {
		this.rankName = rankName;
	}

	public Date getMemberJoinDate() {
		return memberJoinDate;
	}

	public void setMemberJoinDate(Date memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getMemberExit() {
		return memberExit;
	}

	public void setMemberExit(String memberExit) {
		this.memberExit = memberExit;
	}

	public String getMemberAdmin() {
		return memberAdmin;
	}

	public void setMemberAdmin(String memberAdmin) {
		this.memberAdmin = memberAdmin;
	}

	@Override
	public String toString() {
		return "AdminMember [memberNo=" + memberNo + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", memberEmail=" + memberEmail + ", memberPhone=" + memberPhone + ", memberPostCode=" + memberPostCode
				+ ", memberAddress=" + memberAddress + ", accumPaid=" + accumPaid + ", accumCount=" + accumCount
				+ ", memberPoint=" + memberPoint + ", rankName=" + rankName + ", memberJoinDate=" + memberJoinDate
				+ ", memberStatus=" + memberStatus + ", memberExit=" + memberExit + ", memberAdmin=" + memberAdmin
				+ "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
