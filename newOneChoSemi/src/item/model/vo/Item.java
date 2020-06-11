package item.model.vo;


import java.io.Serializable;
import java.sql.Date;

public class Item implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7288938816876895976L;
	private String itemNo;//상품 번호(식별자)
	private String itemName;//상품 이름
	private String itemCategory;//카테고리
	private String itemKeywordNo;//키워드
	private int itemPrice;//가격
	private int itemDiscount;//할인
	private int itemRate;//평점
	private int itemStock;//재고
	private String itemDisplay;//전시상태 여부
	private String itemInfo;//세부 정보
	private Date CDate;//생성일
	private Date UDate;//수정일.
	private int itemSCount;//누적 구매량
	private int itemMax;//최대 구매 가능 수량
	private String itemSale;//삭제 여부 
	
	// 김경남: LIST에서 쓴다
	private String keywordName;
	private String itemImagePath;
	private String itemImageName;
	//
	
	public Item() {
		super();
	}
	
	
	// 김경남 LIST들 담아주는 생성자
	public Item(String itemNo, String itemName, String itemKeywordNo, String keywordName, int itemPrice, int itemDiscount, int itemStock, Date cDate,
			int itemSCount, int itemMax, String itemImagePath, String itemImageName) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemKeywordNo = itemKeywordNo;
		this.keywordName = keywordName;
		this.itemPrice = itemPrice;
		this.itemDiscount = itemDiscount;
		this.itemStock = itemStock;
		CDate = cDate;
		this.itemSCount = itemSCount;
		this.itemMax = itemMax;
		this.itemImagePath = itemImagePath;
		this.itemImageName = itemImageName;
	}



	public Item(String itemName, String itemCategory, String itemKeywordNo, int itemPrice, int itemDiscount,
			int itemStock, String itemDisplay, String itemInfo, int itemMax) {
		super();
		this.itemName = itemName;
		this.itemCategory = itemCategory;
		this.itemKeywordNo = itemKeywordNo;
		this.itemPrice = itemPrice;
		this.itemDiscount = itemDiscount;
		this.itemStock = itemStock;
		this.itemDisplay = itemDisplay;
		this.itemInfo = itemInfo;
		this.itemMax = itemMax;
	}
	
	
	


	public Item(String itemName, String itemCategory, String itemKeywordNo, int itemPrice, int itemDiscount,
			String itemDisplay, String itemInfo) {
		super();
		this.itemName = itemName;
		this.itemCategory = itemCategory;
		this.itemKeywordNo = itemKeywordNo;
		this.itemPrice = itemPrice;
		this.itemDiscount = itemDiscount;
		this.itemDisplay = itemDisplay;
		this.itemInfo = itemInfo;
	}


	public Item(String itemName, String itemCategory, String itemKeywordNo, int itemPrice, int itemDiscount,
			String itemDisplay, String itemInfo, int itemMax) {
		super();
		this.itemName = itemName;
		this.itemCategory = itemCategory;
		this.itemKeywordNo = itemKeywordNo;
		this.itemPrice = itemPrice;
		this.itemDiscount = itemDiscount;
		this.itemDisplay = itemDisplay;
		this.itemInfo = itemInfo;
		this.itemMax = itemMax;
	}
	
	


	public Item(String itemNo, String itemName, String itemCategory, String itemKeywordNo, int itemPrice,
			int itemDiscount, String itemDisplay, String itemInfo) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemCategory = itemCategory;
		this.itemKeywordNo = itemKeywordNo;
		this.itemPrice = itemPrice;
		this.itemDiscount = itemDiscount;
		this.itemDisplay = itemDisplay;
		this.itemInfo = itemInfo;
	}


	public Item(String itemNo, String itemName, String itemCategory, String itemKeywordNo, int itemPrice,
			int itemDiscount, int itemRate, int itemStock, String itemDisplay, String itemInfo, Date cDate, Date uDate,
			int itemMax, String itemSale) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemCategory = itemCategory;
		this.itemKeywordNo = itemKeywordNo;
		this.itemPrice = itemPrice;
		this.itemDiscount = itemDiscount;
		this.itemRate = itemRate;
		this.itemStock = itemStock;
		this.itemDisplay = itemDisplay;
		this.itemInfo = itemInfo;
		CDate = cDate;
		UDate = uDate;
		this.itemMax = itemMax;
		this.itemSale = itemSale;
	}
	
	


	public Item(String itemNo, String itemName, String itemCategory, String itemKeywordNo, int itemPrice,
			int itemDiscount, int itemRate, int itemStock, String itemDisplay, String itemInfo, Date cDate, Date uDate,
			int itemSCount, int itemMax, String itemSale) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemCategory = itemCategory;
		this.itemKeywordNo = itemKeywordNo;
		this.itemPrice = itemPrice;
		this.itemDiscount = itemDiscount;
		this.itemRate = itemRate;
		this.itemStock = itemStock;
		this.itemDisplay = itemDisplay;
		this.itemInfo = itemInfo;
		CDate = cDate;
		UDate = uDate;
		this.itemSCount = itemSCount;
		this.itemMax = itemMax;
		this.itemSale = itemSale;
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

	public String getItemCategory() {
		return itemCategory;
	}

	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}

	public String getItemKeywordNo() {
		return itemKeywordNo;
	}

	public void setItemKeywordNo(String itemKeywordNo) {
		this.itemKeywordNo = itemKeywordNo;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getItemDiscount() {
		return itemDiscount;
	}

	public void setItemDiscount(int itemDiscount) {
		this.itemDiscount = itemDiscount;
	}

	public int getItemRate() {
		return itemRate;
	}

	public void setItemRate(int itemRate) {
		this.itemRate = itemRate;
	}

	public int getItemStock() {
		return itemStock;
	}

	public void setItemStock(int itemStock) {
		this.itemStock = itemStock;
	}

	public String getItemDisplay() {
		return itemDisplay;
	}

	public void setItemDisplay(String itemDisplay) {
		this.itemDisplay = itemDisplay;
	}

	public String getItemInfo() {
		return itemInfo;
	}

	public void setItemInfo(String itemInfo) {
		this.itemInfo = itemInfo;
	}

	public Date getCDate() {
		return CDate;
	}

	public void setCDate(Date cDate) {
		CDate = cDate;
	}

	public Date getUDate() {
		return UDate;
	}

	public void setUDate(Date uDate) {
		UDate = uDate;
	}

	public int getItemSCount() {
		return itemSCount;
	}

	public void setItemSCount(int itemSCount) {
		this.itemSCount = itemSCount;
	}

	public int getItemMax() {
		return itemMax;
	}

	public void setItemMax(int itemMax) {
		this.itemMax = itemMax;
	}

	public String getItemSale() {
		return itemSale;
	}

	public void setItemSale(String itemSale) {
		this.itemSale = itemSale;
	}

	public String getKeywordName() {
		return keywordName;
	}

	public void setKeywordName(String keywordName) {
		this.keywordName = keywordName;
	}

	public String getItemImagePath() {
		return itemImagePath;
	}

	public void setItemImagePath(String itemImagePath) {
		this.itemImagePath = itemImagePath;
	}

	public String getItemImageName() {
		return itemImageName;
	}

	public void setItemImageName(String itemImageName) {
		this.itemImageName = itemImageName;
	}

	


}
