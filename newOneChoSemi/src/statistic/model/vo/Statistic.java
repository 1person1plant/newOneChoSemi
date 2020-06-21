package statistic.model.vo;

import java.sql.Date;

public class Statistic {

	private int newVisit;
	private int dBefore;
	private int cancel;
	private int newOrder;
	private int newMember;
	private int allMember;
	private int newSale;
	private int weekSale;
	private int amonthSale;
	private int newQna;
	private int unAnsw;
	private String orderDate;
	private int sales;
	
	public Statistic() {
		super();
	}
	
	

	public Statistic(int newVisit, int dBefore, int cancel, int newOrder, int newMember, int allMember, int newSale,
			int weekSale, int amonthSale, int newQna, int unAnsw) {
		super();
		this.newVisit = newVisit;
		this.dBefore = dBefore;
		this.cancel = cancel;
		this.newOrder = newOrder;
		this.newMember = newMember;
		this.allMember = allMember;
		this.newSale = newSale;
		this.weekSale = weekSale;
		this.amonthSale = amonthSale;
		this.newQna = newQna;
		this.unAnsw = unAnsw;
	}



	public Statistic(String orderDate, int sales) {
		super();
		this.orderDate = orderDate;
		this.sales = sales;
	}



	public Statistic(int newVisit, int dBefore, int cancel, int newOrder, int newMember, int allMember, int newSale,
			int weekSale, int amonthSale, int newQna, int unAnsw, String orderDate, int sales) {
		super();
		this.newVisit = newVisit;
		this.dBefore = dBefore;
		this.cancel = cancel;
		this.newOrder = newOrder;
		this.newMember = newMember;
		this.allMember = allMember;
		this.newSale = newSale;
		this.weekSale = weekSale;
		this.amonthSale = amonthSale;
		this.newQna = newQna;
		this.unAnsw = unAnsw;
		this.orderDate = orderDate;
		this.sales = sales;
	}

	public int getNewVisit() {
		return newVisit;
	}

	public void setNewVisit(int newVisit) {
		this.newVisit = newVisit;
	}

	public int getdBefore() {
		return dBefore;
	}

	public void setdBefore(int dBefore) {
		this.dBefore = dBefore;
	}

	public int getCancel() {
		return cancel;
	}

	public void setCancel(int cancel) {
		this.cancel = cancel;
	}

	public int getNewOrder() {
		return newOrder;
	}

	public void setNewOrder(int newOrder) {
		this.newOrder = newOrder;
	}

	public int getNewMember() {
		return newMember;
	}

	public void setNewMember(int newMember) {
		this.newMember = newMember;
	}

	public int getAllMember() {
		return allMember;
	}

	public void setAllMember(int allMember) {
		this.allMember = allMember;
	}

	public int getNewSale() {
		return newSale;
	}

	public void setNewSale(int newSale) {
		this.newSale = newSale;
	}

	public int getWeekSale() {
		return weekSale;
	}

	public void setWeekSale(int weekSale) {
		this.weekSale = weekSale;
	}

	public int getAmonthSale() {
		return amonthSale;
	}

	public void setAmonthSale(int amonthSale) {
		this.amonthSale = amonthSale;
	}

	public int getNewQna() {
		return newQna;
	}

	public void setNewQna(int newQna) {
		this.newQna = newQna;
	}

	public int getUnAnsw() {
		return unAnsw;
	}

	public void setUnAnsw(int unAnsw) {
		this.unAnsw = unAnsw;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	@Override
	public String toString() {
		return "Statistic [newVisit=" + newVisit + ", dBefore=" + dBefore + ", cancel=" + cancel + ", newOrder="
				+ newOrder + ", newMember=" + newMember + ", allMember=" + allMember + ", newSale=" + newSale
				+ ", weekSale=" + weekSale + ", amonthSale=" + amonthSale + ", newQna=" + newQna + ", unAnsw=" + unAnsw
				+ ", orderDate=" + orderDate + ", sales=" + sales + "]";
	}
	
	
	
	
	
	
	
	
}
