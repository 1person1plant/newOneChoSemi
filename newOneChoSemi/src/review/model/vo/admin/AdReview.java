package review.model.vo.admin;

import java.sql.Date;

public class AdReview {
	
	
	private String reviewNo;
	private String orderNo;
	private String itemNo;
	private String itemName;
	private String memberNo;
	private String memberId;
	private int reviewRate;
	private String reviewContent;
	private Date reviewCDate;
	private Date reviewUDate;
	private String reviewImgName;
	private String reviewImgPath;
	
	public AdReview() {
		super();
	}

	public AdReview(String reviewNo, String orderNo, String itemNo, String itemName, String memberNo, String memberId,
			int reviewRate, String reviewContent, Date reviewCDate, Date reviewUDate, String reviewImgName,
			String reviewImgPath) {
		super();
		this.reviewNo = reviewNo;
		this.orderNo = orderNo;
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.reviewRate = reviewRate;
		this.reviewContent = reviewContent;
		this.reviewCDate = reviewCDate;
		this.reviewUDate = reviewUDate;
		this.reviewImgName = reviewImgName;
		this.reviewImgPath = reviewImgPath;
	}

	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
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

	public int getReviewRate() {
		return reviewRate;
	}

	public void setReviewRate(int reviewRate) {
		this.reviewRate = reviewRate;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewCDate() {
		return reviewCDate;
	}

	public void setReviewCDate(Date reviewCDate) {
		this.reviewCDate = reviewCDate;
	}

	public Date getReviewUDate() {
		return reviewUDate;
	}

	public void setReviewUDate(Date reviewUDate) {
		this.reviewUDate = reviewUDate;
	}

	public String getReviewImgName() {
		return reviewImgName;
	}

	public void setReviewImgName(String reviewImgName) {
		this.reviewImgName = reviewImgName;
	}

	public String getReviewImgPath() {
		return reviewImgPath;
	}

	public void setReviewImgPath(String reviewImgPath) {
		this.reviewImgPath = reviewImgPath;
	}

	@Override
	public String toString() {
		return "AdReview [reviewNo=" + reviewNo + ", orderNo=" + orderNo + ", itemNo=" + itemNo + ", itemName="
				+ itemName + ", memberNo=" + memberNo + ", memberId=" + memberId + ", reviewRate=" + reviewRate
				+ ", reviewContent=" + reviewContent + ", reviewCDate=" + reviewCDate + ", reviewUDate=" + reviewUDate
				+ ", reviewImgName=" + reviewImgName + ", reviewImgPath=" + reviewImgPath + "]";
	}
	
	
	
	
	
	

}
