package item.model.vo;

public class Pagination {
	
	private int currentPage;
	private int itemCount;
	private int howManyAtOnce;
	private int ultimatePage;
	private int startPage;
	private int endPage;
	
	
	public Pagination() {
		super();
	}
	public Pagination(int currentPage, int itemCount, int howManyAtOnce, int ultimatePage, int startPage, int endPage) {
		super();
		this.currentPage = currentPage;
		this.itemCount = itemCount;
		this.howManyAtOnce = howManyAtOnce;
		this.ultimatePage = ultimatePage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	public int getHowManyAtOnce() {
		return howManyAtOnce;
	}
	public void setHowManyAtOnce(int howManyAtOnce) {
		this.howManyAtOnce = howManyAtOnce;
	}
	public int getUltimatePage() {
		return ultimatePage;
	}
	public void setUltimatePage(int ultimatePage) {
		this.ultimatePage = ultimatePage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	@Override
	public String toString() {
		return "Pagination [currentPage=" + currentPage + ", itemCount=" + itemCount + ", howManyAtOnce="
				+ howManyAtOnce + ", ultimatePage=" + ultimatePage + ", startPage=" + startPage + ", endPage=" + endPage
				+ "]";
	}
	
	

}
