package item.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import item.model.dao.ItemDao;
import item.model.vo.Item;
import item.model.vo.ItemImage;

public class ItemService {

	public ArrayList<Item> bestList() {

		Connection conn = getConnection();

		ArrayList<Item> bestList = new ItemDao().bestList(conn);

		close(conn);

		return bestList;
	}

	public ArrayList<Item> newList() {

		Connection conn = getConnection();

		ArrayList<Item> newList = new ItemDao().newList(conn);

		close(conn);

		return newList;
	}

	public int itemCount() {
		Connection conn = getConnection();

		int itemCount = new ItemDao().itemCount(conn);

		close(conn);

		return itemCount;
	}

	public ArrayList<Item> allList(int currentPage, int howManyAtOnce) {

		Connection conn = getConnection();

		ArrayList<Item> allList = new ItemDao().allList(conn, currentPage, howManyAtOnce);

		close(conn);

		return allList;
	}

	public int insertItem(Item item) {

		Connection conn = getConnection();

		int result = new ItemDao().insertItem(conn, item);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public int insertImage(ItemImage im) {

		Connection conn = getConnection();

		int result = new ItemDao().insertImage(conn, im);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return result;
	}

	public int insertItemImage() {

		Connection conn = getConnection();

		int result = new ItemDao().insertItemImage(conn);

		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}

		return result;
	}

	public ArrayList<Item> selectAllItems() {

		Connection conn = getConnection();

		ArrayList<Item> items = new ItemDao().selectAllItems(conn);

		close(conn);
		return items;
	}

	public ItemImage selectItemImg(String pNum) {

		Connection conn = getConnection();
		ItemImage itemImg = new ItemDao().selectItemImg(conn, pNum);

		close(conn);
		return itemImg;
	}

	public ArrayList<ItemImage> selectItemImg() {

		Connection conn = getConnection();
		ArrayList<ItemImage> images = new ItemDao().selectItemImg(conn);

		close(conn);
		return images;
	}

	public int updateItem(Item item) {

		Connection conn = getConnection();
		int result = 0;

		result = new ItemDao().updateItem(conn, item);
		
		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	

	public int deleteItem(String itemNum) {

		Connection conn = getConnection();
		int result = 0;

		result = new ItemDao().deleteItem(conn, itemNum);
		
		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public ArrayList<Item> searchItems(Map<String, String> list) {

		Connection conn = getConnection();
		ArrayList<Item> items = new ItemDao().searchItems(conn, list);

		close(conn);
		return items;
	}


	public int updateStock(ArrayList<Item> items) {
		
		Connection conn=getConnection();
		int result=new ItemDao().updateStock(conn,items);
		
		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Item> searchStock(Map<String, String> list) {
		
		Connection conn=getConnection();
		ArrayList<Item> items=new ItemDao().searchStock(conn,list);
		
		close(conn);
		return items;
	}


	public int nameCheck(String itemName) {
		
		Connection conn=getConnection();
		int result=new ItemDao().nameCheck(conn,itemName);
		
		
		close(conn);
		return result;
		
	}

	// 김경남: ItemDetail
	public Item selectItemDetail(String itemNo) {

		Connection conn = getConnection();
		
		Item itemDetail = new ItemDao().selectItemDetail(conn, itemNo);
		
		close(conn);
		
		return itemDetail;

	}

	public ArrayList<Item> searchResult(ArrayList searchList) {
		
		Connection conn = getConnection();
		
		ArrayList<Item> resultList = new ItemDao().searchResult(conn, searchList);
		
		close(conn);
		
		return resultList;

	}
	
	public int categoryCount(String category) {

		Connection conn = getConnection();
		
		int categoryCount = new ItemDao().categoryCount(conn, category);
		
		close(conn);
		
		return categoryCount;
	}

	public ArrayList<Item> categoryList(String category) {
		
		Connection conn = getConnection();
		
		ArrayList<Item> categoryList = new ItemDao().categoryList(conn, category);
		
		close(conn);
		
		return categoryList;
	}

	public int updateMainImage(Item item) {
		Connection conn = getConnection();

		int result = new ItemDao().updateMainImage(item,conn);

		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}

		return result;
	}

	public int updateSubImage(Item item) {
		Connection conn = getConnection();

		int result = new ItemDao().updateSubImage(item,conn);

		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}

		return result;
	}

	public int insertOneMain(ItemImage im) {
		Connection conn=getConnection();
		
		int result=new ItemDao().insertOneMain(conn,im);
		
		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}

		return result;
	}

	public int updateOneMain(Item item) {
		Connection conn = getConnection();

		int result = new ItemDao().updateOneMain(item,conn);

		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}

		return result;
	}

	public int insertOneSub(ItemImage im) {
		Connection conn=getConnection();
		
		int result=new ItemDao().insertOneSub(conn,im);
		
		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}

		return result;
	}

	public int updateOneSub(Item item) {
		
		Connection conn = getConnection();

		int result = new ItemDao().updateOneSub(item,conn);

		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}

		return result;
	}
	
	public int wishDelete(String itemNo, String memberNo) {
		
		Connection conn = getConnection();
		
		int result = new ItemDao().wishDelete(conn, itemNo, memberNo);
		
		close(conn);
		
		return result;
		
	}

	public int wishAdd(String itemNo, String memberNo) {
		
		Connection conn = getConnection();
		
		int result = new ItemDao().wishAdd(conn, itemNo, memberNo);
		
		close(conn);
		
		return result;

	}

	public int cartAdd(String itemNo, String memberNo, int itemCount) {
		
		Connection conn = getConnection();
		
		int result = new ItemDao().cartAdd(conn, itemNo, memberNo, itemCount);
		
		close(conn);
		
		return result;
	}

}
