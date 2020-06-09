package item.model.vo;

import java.io.Serializable;

public class ItemImage implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8597956438115886477L;
	private String itemNo;//상품번호
	private String mItemImgeNo;//메인상품이미지 식별자 번호 II+
	private String mImgNo;//이미지 번호 I
	private String mImgName;//이미지 이름
	private int mCategory;//이미지 카테고리
	private String mPath;//이미지 경로
	private String sItemImgNo;//세부상품이미지 식별자 번호 
	private String sImgNo;//이미지 번호
	private String sImgName;//이미지 이름
	private int sCategory;
	private String sPath;//이미지 경로
	
	public ItemImage() {
		super();
	}

	public ItemImage(String itemNo, String mItemImgeNo, String mImgNo, String mImgName, String mPath, String sItemImgNo,
			String sImgNo, String sImgName, String sPath) {
		super();
		this.itemNo = itemNo;
		this.mItemImgeNo = mItemImgeNo;
		this.mImgNo = mImgNo;
		this.mImgName = mImgName;
		this.mPath = mPath;
		this.sItemImgNo = sItemImgNo;
		this.sImgNo = sImgNo;
		this.sImgName = sImgName;
		this.sPath = sPath;
	}

	public ItemImage(String itemNo, String mItemImgeNo, String mImgNo, String mImgName, int mCategory, String mPath,
			String sItemImgNo, String sImgNo, String sImgName, int sCategory, String sPath) {
		super();
		this.itemNo = itemNo;
		this.mItemImgeNo = mItemImgeNo;
		this.mImgNo = mImgNo;
		this.mImgName = mImgName;
		this.mCategory = mCategory;
		this.mPath = mPath;
		this.sItemImgNo = sItemImgNo;
		this.sImgNo = sImgNo;
		this.sImgName = sImgName;
		this.sCategory = sCategory;
		this.sPath = sPath;
	}

	public String getItemNo() {
		return itemNo;
	}

	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}

	public String getmItemImgeNo() {
		return mItemImgeNo;
	}

	public void setmItemImgeNo(String mItemImgeNo) {
		this.mItemImgeNo = mItemImgeNo;
	}

	public String getmImgNo() {
		return mImgNo;
	}

	public void setmImgNo(String mImgNo) {
		this.mImgNo = mImgNo;
	}

	public String getmImgName() {
		return mImgName;
	}

	public void setmImgName(String mImgName) {
		this.mImgName = mImgName;
	}

	public int getmCategory() {
		return mCategory;
	}

	public void setmCategory(int mCategory) {
		this.mCategory = mCategory;
	}

	public String getmPath() {
		return mPath;
	}

	public void setmPath(String mPath) {
		this.mPath = mPath;
	}

	public String getsItemImgNo() {
		return sItemImgNo;
	}

	public void setsItemImgNo(String sItemImgNo) {
		this.sItemImgNo = sItemImgNo;
	}

	public String getsImgNo() {
		return sImgNo;
	}

	public void setsImgNo(String sImgNo) {
		this.sImgNo = sImgNo;
	}

	public String getsImgName() {
		return sImgName;
	}

	public void setsImgName(String sImgName) {
		this.sImgName = sImgName;
	}

	public int getsCategory() {
		return sCategory;
	}

	public void setsCategory(int sCategory) {
		this.sCategory = sCategory;
	}

	public String getsPath() {
		return sPath;
	}

	public void setsPath(String sPath) {
		this.sPath = sPath;
	}

	@Override
	public String toString() {
		return "ItemImage [itemNo=" + itemNo + ", mItemImgeNo=" + mItemImgeNo + ", mImgNo=" + mImgNo + ", mImgName="
				+ mImgName + ", mCategory=" + mCategory + ", mPath=" + mPath + ", sItemImgNo=" + sItemImgNo
				+ ", sImgNo=" + sImgNo + ", sImgName=" + sImgName + ", sCategory=" + sCategory + ", sPath=" + sPath
				+ "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
