package member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3566224316029271677L;
	private String memberNo;		// 회원번호
	private String memberAdmin;		// 관리자:Y, 일반회원:N
	private String memberId;			// 아이디, 유니크
	private String memberPwd;		// 비밀번호
	private String memberName;		// 이름
	private String memberPhone1;		// 연락처1
	private String memberPhone2;		// 연락처2
	private String memberPhone3;		// 연락처3
	private String memberEmail1;	// 이메일1
	private String memberEmail2;	// 이메일2
	private String memberPostcode;		// 우편번호
	private String memberAddress1;	// 주소
	private String memberAddress2;	// 상세주소
	private Date memberJoinDate;	// 회원가입날짜
	private String memberStatus;	// 탈퇴:Y, 기본:N, 회원상태
	private String memberExit;		// 탈퇴사유
	private int memberPoint;		// 포인트
	private String memberRank;		// 등급번호 (R1~R5)
	public Member() {
	}
	public Member(String memberId, String memberPwd) {
		this.memberId = memberId;
		this.memberPwd = memberPwd;
	}
	public Member(String memberNo, String memberAdmin, String memberId, String memberPwd, String memberName,
			String memberPhone1, String memberPhone2, String memberPhone3, String memberEmail1, String memberEmail2,
			String memberPostcode, String memberAddress1, String memberAddress2, String memberStatus, int memberPoint,
			String memberRank) {
		this.memberNo = memberNo;
		this.memberAdmin = memberAdmin;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberPhone1 = memberPhone1;
		this.memberPhone2 = memberPhone2;
		this.memberPhone3 = memberPhone3;
		this.memberEmail1 = memberEmail1;
		this.memberEmail2 = memberEmail2;
		this.memberPostcode = memberPostcode;
		this.memberAddress1 = memberAddress1;
		this.memberAddress2 = memberAddress2;
		this.memberStatus = memberStatus;
		this.memberPoint = memberPoint;
		this.memberRank = memberRank;
	}
	public Member(String memberNo, String memberAdmin, String memberId, String memberPwd, String memberName,
			String memberPhone1, String memberPhone2, String memberPhone3, String memberEmail1, String memberEmail2,
			String memberPostcode, String memberAddress1, String memberAddress2, Date memberJoinDate,
			String memberStatus, String memberExit, int memberPoint, String memberRank) {
		this.memberNo = memberNo;
		this.memberAdmin = memberAdmin;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberPhone1 = memberPhone1;
		this.memberPhone2 = memberPhone2;
		this.memberPhone3 = memberPhone3;
		this.memberEmail1 = memberEmail1;
		this.memberEmail2 = memberEmail2;
		this.memberPostcode = memberPostcode;
		this.memberAddress1 = memberAddress1;
		this.memberAddress2 = memberAddress2;
		this.memberJoinDate = memberJoinDate;
		this.memberStatus = memberStatus;
		this.memberExit = memberExit;
		this.memberPoint = memberPoint;
		this.memberRank = memberRank;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberAdmin() {
		return memberAdmin;
	}
	public void setMemberAdmin(String memberAdmin) {
		this.memberAdmin = memberAdmin;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone1() {
		return memberPhone1;
	}
	public void setMemberPhone1(String memberPhone1) {
		this.memberPhone1 = memberPhone1;
	}
	public String getMemberPhone2() {
		return memberPhone2;
	}
	public void setMemberPhone2(String memberPhone2) {
		this.memberPhone2 = memberPhone2;
	}
	public String getMemberPhone3() {
		return memberPhone3;
	}
	public void setMemberPhone3(String memberPhone3) {
		this.memberPhone3 = memberPhone3;
	}
	public String getMemberEmail1() {
		return memberEmail1;
	}
	public void setMemberEmail1(String memberEmail1) {
		this.memberEmail1 = memberEmail1;
	}
	public String getMemberEmail2() {
		return memberEmail2;
	}
	public void setMemberEmail2(String memberEmail2) {
		this.memberEmail2 = memberEmail2;
	}
	public String getMemberPostcode() {
		return memberPostcode;
	}
	public void setMemberPostcode(String memberPostcode) {
		this.memberPostcode = memberPostcode;
	}
	public String getMemberAddress1() {
		return memberAddress1;
	}
	public void setMemberAddress1(String memberAddress1) {
		this.memberAddress1 = memberAddress1;
	}
	public String getMemberAddress2() {
		return memberAddress2;
	}
	public void setMemberAddress2(String memberAddress2) {
		this.memberAddress2 = memberAddress2;
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
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public String getMemberRank() {
		return memberRank;
	}
	public void setMemberRank(String memberRank) {
		this.memberRank = memberRank;
	}
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberAdmin=" + memberAdmin + ", memberId=" + memberId + ", memberPwd="
				+ memberPwd + ", memberName=" + memberName + ", memberPhone1=" + memberPhone1 + ", memberPhone2="
				+ memberPhone2 + ", memberPhone3=" + memberPhone3 + ", memberEmail1=" + memberEmail1 + ", memberEmail2="
				+ memberEmail2 + ", memberPostcode=" + memberPostcode + ", memberAddress1=" + memberAddress1
				+ ", memberAddress2=" + memberAddress2 + ", memberJoinDate=" + memberJoinDate + ", memberStatus="
				+ memberStatus + ", memberExit=" + memberExit + ", memberPoint=" + memberPoint + ", memberRank="
				+ memberRank + "]";
	}
}
