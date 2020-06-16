package Board.model.vo;

import java.sql.Date;

public class Qna {
	
	private String qnaNo;
	private String memberId;
	private String qnaTitle;
	private Date qnaCDate;
	private String qnaContent;
	private String qnaAnswer;
	private String qnaCategory;
	private String qnaPassword;
	private String qnaYN;
	private String qnaImgName;
	private String qnaImgPath;
	
	
	public Qna() {
		super();
	}


	public Qna(String qnaNo, String memberId, String qnaTitle, Date qnaCDate, String qnaContent, String qnaAnswer,
			String qnaCategory, String qnaPassword, String qnaYN, String qnaImgName, String qnaImgPath) {
		super();
		this.qnaNo = qnaNo;
		this.memberId = memberId;
		this.qnaTitle = qnaTitle;
		this.qnaCDate = qnaCDate;
		this.qnaContent = qnaContent;
		this.qnaAnswer = qnaAnswer;
		this.qnaCategory = qnaCategory;
		this.qnaPassword = qnaPassword;
		this.qnaYN = qnaYN;
		this.qnaImgName = qnaImgName;
		this.qnaImgPath = qnaImgPath;
	}


	public String getQnaNo() {
		return qnaNo;
	}


	public void setQnaNo(String qnaNo) {
		this.qnaNo = qnaNo;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getQnaTitle() {
		return qnaTitle;
	}


	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}


	public Date getQnaCDate() {
		return qnaCDate;
	}


	public void setQnaCDate(Date qnaCDate) {
		this.qnaCDate = qnaCDate;
	}


	public String getQnaContent() {
		return qnaContent;
	}


	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}


	public String getQnaAnswer() {
		return qnaAnswer;
	}


	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}


	public String getQnaCategory() {
		return qnaCategory;
	}


	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}


	public String getQnaPassword() {
		return qnaPassword;
	}


	public void setQnaPassword(String qnaPassword) {
		this.qnaPassword = qnaPassword;
	}


	public String getQnaYN() {
		return qnaYN;
	}


	public void setQnaYN(String qnaYN) {
		this.qnaYN = qnaYN;
	}


	public String getQnaImgName() {
		return qnaImgName;
	}


	public void setQnaImgName(String qnaImgName) {
		this.qnaImgName = qnaImgName;
	}


	public String getQnaImgPath() {
		return qnaImgPath;
	}


	public void setQnaImgPath(String qnaImgPath) {
		this.qnaImgPath = qnaImgPath;
	}


	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", memberId=" + memberId + ", qnaTitle=" + qnaTitle + ", qnaCDate=" + qnaCDate
				+ ", qnaContent=" + qnaContent + ", qnaAnswer=" + qnaAnswer + ", qnaCategory=" + qnaCategory
				+ ", qnaPassword=" + qnaPassword + ", qnaYN=" + qnaYN + ", qnaImgName=" + qnaImgName + ", qnaImgPath="
				+ qnaImgPath + "]";
	}
	
	
	
	
	
	
	
	
	
	

}
