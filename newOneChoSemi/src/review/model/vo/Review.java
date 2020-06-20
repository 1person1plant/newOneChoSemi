package review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable {
	
	private static final long serialVersionUID = -443751549353229204L;
	
	private String reviewNo;
	private String orderNo;
	private String itemNo;
	private String memberNo;
	private Date reviewCDate;
	private int reviewRate;
	private String reviewContent;
	private Date reviewUDate;
	private String reviewImgName;
	private String reviewImgPath;
	private String reviewExist;
	private String memberId;
	private String memberRank;
	
	
	public Review() {}
	
	
	
	public Review(String reviewNo, int reviewRate, String reviewContent) {
		super();
		this.reviewNo = reviewNo;
		this.reviewRate = reviewRate;
		this.reviewContent = reviewContent;
	}



	public Review(String reviewNo, int reviewRate, String reviewContent, Date reviewUDate, String reviewImgName,
			String reviewImgPath) {
		super();
		this.reviewNo = reviewNo;
		this.reviewRate = reviewRate;
		this.reviewContent = reviewContent;
		this.reviewUDate = reviewUDate;
		this.reviewImgName = reviewImgName;
		this.reviewImgPath = reviewImgPath;
	}



	public Review(String orderNo, String itemNo, String memberNo, int reviewRate, String reviewContent,
			String reviewImgName, String reviewImgPath) {
		super();
		this.orderNo = orderNo;
		this.itemNo = itemNo;
		this.memberNo = memberNo;
		this.reviewRate = reviewRate;
		this.reviewContent = reviewContent;
		this.reviewImgName = reviewImgName;
		this.reviewImgPath = reviewImgPath;
	}

	public Review(String reviewNo, String orderNo, String itemNo, String memberNo, Date reviewCDate, int reviewRate,
			String reviewContent, Date reviewUDate, String reviewImgName, String reviewImgPath, String reviewExist,
			String memberId, String memberRank) {
		super();
		this.reviewNo = reviewNo;
		this.orderNo = orderNo;
		this.itemNo = itemNo;
		this.memberNo = memberNo;
		this.reviewCDate = reviewCDate;
		this.reviewRate = reviewRate;
		this.reviewContent = reviewContent;
		this.reviewUDate = reviewUDate;
		this.reviewImgName = reviewImgName;
		this.reviewImgPath = reviewImgPath;
		this.reviewExist = reviewExist;
		this.memberId = memberId;
		this.memberRank = memberRank;
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

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public Date getReviewCDate() {
		return reviewCDate;
	}

	public void setReviewCDate(Date reviewCDate) {
		this.reviewCDate = reviewCDate;
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

	public String getReviewExist() {
		return reviewExist;
	}

	public void setReviewExist(String reviewExist) {
		this.reviewExist = reviewExist;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberRank() {
		return memberRank;
	}

	public void setMemberRank(String memberRank) {
		this.memberRank = memberRank;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", orderNo=" + orderNo + ", itemNo=" + itemNo + ", memberNo=" + memberNo
				+ ", reviewCDate=" + reviewCDate + ", reviewRate=" + reviewRate + ", reviewContent=" + reviewContent
				+ ", reviewUDate=" + reviewUDate + ", reviewImgName=" + reviewImgName + ", reviewImgPath="
				+ reviewImgPath + ", reviewExist=" + reviewExist + ", memberId=" + memberId + ", memberRank="
				+ memberRank + "]";
	}
	
}
