package Board.model.vo;

import java.sql.Date;

public class Notice {
	
	
	private String noticeNo;
	private String memberNo;
	private String memberId;
	private String noticeTitle;
	private Date noticeCDate;
	private String noticeContent;
	private String noticeImgName;
	private String noticeImgPath;
	
	public Notice() {
		super();
	}
	
	
	
	public Notice(String noticeNo, String memberId, String noticeTitle, Date noticeCDate, String noticeContent,
			String noticeImgName, String noticeImgPath) {
		super();
		this.noticeNo = noticeNo;
		this.memberId = memberId;
		this.noticeTitle = noticeTitle;
		this.noticeCDate = noticeCDate;
		this.noticeContent = noticeContent;
		this.noticeImgName = noticeImgName;
		this.noticeImgPath = noticeImgPath;
	}



	public Notice(String noticeNo, String memberNo, String memberId, String noticeTitle, Date noticeCDate,
			String noticeContent, String noticeImgName, String noticeImgPath) {
		super();
		this.noticeNo = noticeNo;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.noticeTitle = noticeTitle;
		this.noticeCDate = noticeCDate;
		this.noticeContent = noticeContent;
		this.noticeImgName = noticeImgName;
		this.noticeImgPath = noticeImgPath;
	}
	public String getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
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
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public Date getNoticeCDate() {
		return noticeCDate;
	}
	public void setNoticeCDate(Date noticeCDate) {
		this.noticeCDate = noticeCDate;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeImgName() {
		return noticeImgName;
	}
	public void setNoticeImgName(String noticeImgName) {
		this.noticeImgName = noticeImgName;
	}
	public String getNoticeImgPath() {
		return noticeImgPath;
	}
	public void setNoticeImgPath(String noticeImgPath) {
		this.noticeImgPath = noticeImgPath;
	}
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", memberNo=" + memberNo + ", memberId=" + memberId + ", noticeTitle="
				+ noticeTitle + ", noticeCDate=" + noticeCDate + ", noticeContent=" + noticeContent + ", noticeImgName="
				+ noticeImgName + ", noticeImgPath=" + noticeImgPath + "]";
	}
	
	
	

}
