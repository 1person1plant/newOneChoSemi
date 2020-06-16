package item.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import static common.JDBCTemplate.*;

import item.model.vo.Item;
import item.model.vo.ItemImage;
import order.model.vo.admin.AdminOrder;

public class ItemDao {
	
	// 김경남 BEST LIST
	public ArrayList<Item> bestList(Connection conn) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Item> list = new ArrayList<>();
		
		String query = "SELECT * FROM ITEM_BESTLIST";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Item it = new Item(rset.getString("item_no"),
								   rset.getString("item_name"),
								   rset.getString("keyword_no"),
								   rset.getString("keyword_name"),
								   rset.getInt("item_price"),
								   rset.getInt("item_discount"),
								   rset.getInt("item_stock"),
								   rset.getDate("item_cdate"),
								   rset.getInt("item_scount"),
								   rset.getInt("item_max"),
								   rset.getString("image_path"),
								   rset.getString("image_name"));
				
				list.add(it);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
	
		return list;
	}

	// 김경남 NEW LIST
	public ArrayList<Item> newList(Connection conn) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Item> list = new ArrayList<>();
		
		String query = "SELECT * FROM ITEM_NEWLIST";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Item it = new Item(rset.getString("item_no"),
								   rset.getString("item_name"),
								   rset.getString("keyword_no"),
								   rset.getString("keyword_name"),
								   rset.getInt("item_price"),
								   rset.getInt("item_discount"),
								   rset.getInt("item_stock"),
								   rset.getDate("item_cdate"),
								   rset.getInt("item_scount"),
								   rset.getInt("item_max"),
								   rset.getString("image_path"),
								   rset.getString("image_name"));
				
				list.add(it);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
	
		return list;
	}

	// 김경남 PAGINATION ITEM COUNT
	public int itemCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT COUNT(*) FROM ITEM";
		
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}
	
	// 김경남 ALL LIST
	public ArrayList<Item> allList(Connection conn, int currentPage, int howManyAtOnce) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Item> list = new ArrayList<>();
		
		int startRow = (currentPage-1) * howManyAtOnce + 1;
		int endRow = currentPage * howManyAtOnce;
		
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM ITEM_ALLLIST A) WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Item it = new Item(rset.getString("item_no"),
								   rset.getString("item_name"),
								   rset.getString("keyword_no"),
								   rset.getString("keyword_name"),
								   rset.getInt("item_price"),
								   rset.getInt("item_discount"),
								   rset.getInt("item_stock"),
								   rset.getDate("item_cdate"),
								   rset.getInt("item_scount"),
								   rset.getInt("item_max"),
								   rset.getString("image_path"),
								   rset.getString("image_name"));
				
				list.add(it);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
	
		return list;
	}

	public int insertItem(Connection conn, Item item) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="insert into item values('I'||LPAD(ITEM_SEQ.NEXTVAL,5,'0'),?,?,?,?,?,0,?,?,?,SYSDATE,SYSDATE,0,?,'Y')";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, item.getItemName());
			pstmt.setString(2, item.getItemCategory());
			pstmt.setString(3, item.getItemKeywordNo());
			pstmt.setInt(4, item.getItemPrice());
			pstmt.setInt(5, item.getItemDiscount());
			pstmt.setInt(6, item.getItemStock());
			pstmt.setString(7, item.getItemDisplay());
			pstmt.setString(8, item.getItemInfo());
			pstmt.setInt(9, item.getItemMax());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertImage(Connection conn, ItemImage im) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="insert into image values('IMG'||LPAD(IMAGE_SEQ.NEXTVAL,5,'0'),?,?)";
		
		try {
		for(int i=0;i<2;i++) {
			
			if(i==0) {
					pstmt=conn.prepareStatement(query);
					pstmt.setString(1,im.getmPath());
					pstmt.setString(2, im.getmImgName());
					result+=pstmt.executeUpdate();
					
			}else {
				
					pstmt=conn.prepareStatement(query);
					pstmt.setString(1, im.getsPath());
					pstmt.setString(2, im.getsImgName());
					result+=pstmt.executeUpdate();
					
			}
			
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	

	public int insertItemImage(Connection conn) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
		for(int i=0;i<2;i++) {
			
			if(i==0) {
				
				System.out.println("메인이미지를 아이템이미지 테이블에 넣는다.");				
				String query="INSERT INTO ITEMIMAGE VALUES('II'||LPAD(ITEMIMAGE_SEQ.NEXTVAL,5,'0'),(select max(item_no) from item),(select concat('IMG',LPAD((substr(max(image_no),4)-1),5,0)) from image),1)";
				pstmt=conn.prepareStatement(query);
				result+=pstmt.executeUpdate();	
			
			}else {
				System.out.println("서브이미지를 아이템이미지 테이블에 넣는다.");	
				String query="INSERT INTO ITEMIMAGE VALUES('II'||LPAD(ITEMIMAGE_SEQ.NEXTVAL,5,'0'),(select max(item_no)from item),(select max(image_no)from image),2)";
				pstmt=conn.prepareStatement(query);
				result+=pstmt.executeUpdate();
			
			}
			
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Item> selectAllItems(Connection conn) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Item> items = new ArrayList<>();
		
		String query="SELECT * FROM ITEM WHERE ITEM_SALE='Y'";
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				Item i=new Item(rset.getString("ITEM_NO"),rset.getString("ITEM_NAME"),rset.getString("ITEM_CATEGORY"),rset.getString("KEYWORD_NO"),rset.getInt("ITEM_PRICE"),
						rset.getInt("ITEM_DISCOUNT"),rset.getInt("ITEM_RATE"),rset.getInt("ITEM_STOCK"),rset.getString("ITEM_DISPLAY"),rset.getString("ITEM_INFO"),
						rset.getDate("ITEM_CDATE"),rset.getDate("ITEM_UDATE"),rset.getInt("ITEM_SCOUNT"),rset.getInt("ITEM_MAX"),rset.getString("ITEM_SALE"));
				
				items.add(i);
				
			}
			
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return items;
	}

	public ItemImage selectItemImg(Connection conn, String pNum) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ItemImage itemImg=null;
		
		String query="SELECT * FROM V_ITEMIMAGE WHERE ITEM_NO=?";
	
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, pNum);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				
				itemImg=new ItemImage(rset.getString("ITEM_NO"),rset.getString("mItemImgNo"),rset.getString("mainImgNo"),
						rset.getString("mainImgName"),rset.getString("mainPath"),
						rset.getString("sItemImgNo"),rset.getString("subImgNo"),rset.getString("subImgName"),rset.getString("subPath"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return itemImg;
	}

	public ArrayList<ItemImage> selectItemImg(Connection conn) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<ItemImage> images=new ArrayList<>();
		
		String query="SELECT * FROM V_ITEMIMAGE ";
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				ItemImage itemImg=new ItemImage(rset.getString("ITEM_NO"),rset.getString("mItemImgNo"),rset.getString("mainImgNo"),
						rset.getString("mainImgName"),rset.getString("mainPath"),
						rset.getString("sItemImgNo"),rset.getString("subImgNo"),rset.getString("subImgName"),rset.getString("subPath"));
				
				images.add(itemImg);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
	
		return images;
	}

	public int updateItem(Connection conn, Item item) {
		
		PreparedStatement pstmt=null;
		int result=0;
		String query="update item set item_name=?, item_category=?,keyword_no=?,item_price=?,item_discount=?,item_stock=?,item_display=?,item_info=?,item_udate=SYSDATE where item_no=?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,item.getItemName());
			pstmt.setString(2, item.getItemCategory());
			pstmt.setString(3, item.getItemKeywordNo());
			pstmt.setInt(4, item.getItemPrice());
			pstmt.setInt(5, item.getItemDiscount());
			pstmt.setInt(6,item.getItemStock());
			pstmt.setString(7,item.getItemDisplay());
			pstmt.setString(8, item.getItemInfo());
			pstmt.setString(9, item.getItemNo());
			
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int updateItemImage(Connection conn, Item item) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
		for(int i=0;i<2;i++) {
			
			if(i==0) {
				
							
				String query="update itemimage set image_no=(select concat('IMG',LPAD((substr(max(image_no),4)-1),5,0)) from image) where item_no=? and itemimage_category=1";
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, item.getItemNo());
				result+=pstmt.executeUpdate();	
			
			}else {
				
				
				String query="update itemimage set image_no=(select max(image_no)from image) where item_no=? and itemimage_category=2";
				pstmt=conn.prepareStatement(query);
				pstmt.setString(2, item.getItemNo());
				result+=pstmt.executeUpdate();
			
			}
			
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteItem(Connection conn, String itemNum) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="UPDATE ITEM SET ITEM_SALE='N' WHERE ITEM_NO=?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, itemNum);
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	public ArrayList<Item> searchItems(Connection conn, Map<String, String> list) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Item> items=new ArrayList<>();
		
		String searchDate=list.get("searchDate");
		String date1=list.get("date1");
		String date2=list.get("date2");
		String display=list.get("display");
		String name=list.get("name");
		String category=list.get("category");
		
		System.out.println("searchDate:"+searchDate);
		System.out.println("category:"+category);
		
		String query="SELECT * FROM ITEM";
		
		int count=0;
		if(searchDate!="") {
			
			if(count==0) {
				query+=" WHERE ";
				query+=searchDate+" BETWEEN "+"'"+date1+"'"+" AND "+"'"+date2+"'";
				
			}
			
			count++;
			
		}
		
		if(display!=null) {
			
			if(count==0) {
				query+=" WHERE ";
				query+="ITEM_DISPLAY="+"'"+display+"'";
			}else {
				query+=" AND ";
				query+="ITEM_DISPLAY="+"'"+display+"'";
			}
			
			count++;
			
		}
		
		if(name!="") {
			
			if(count==0) {
				query+=" WHERE ";
				query+="ITEM_NAME LIKE '%'||"+"'"+name+"'"+"||'%' ";
			}else {
				query+=" AND ";
				query+="ITEM_NAME LIKE '%'||"+"'"+name+"'"+"||'%' ";
			}
			count++;
			
		}
		
		if(category!="") {
			
			if(count==0) {
				query+=" WHERE ";
				query+="ITEM_CATEGORY="+"'"+category+"'";
			}else {
				query+=" AND ";
				query+="ITEM_CATEGORY="+"'"+category+"'";
				
			}
			
			count++;
			
		}
		
		
		System.out.println(query);
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				Item i=new Item(rset.getString("ITEM_NO"),rset.getString("ITEM_NAME"),rset.getString("ITEM_CATEGORY"),rset.getString("KEYWORD_NO"),rset.getInt("ITEM_PRICE"),
						rset.getInt("ITEM_DISCOUNT"),rset.getInt("ITEM_RATE"),rset.getInt("ITEM_STOCK"),rset.getString("ITEM_DISPLAY"),rset.getString("ITEM_INFO"),
						rset.getDate("ITEM_CDATE"),rset.getDate("ITEM_UDATE"),rset.getInt("ITEM_SCOUNT"),rset.getInt("ITEM_MAX"),rset.getString("ITEM_SALE"));
				
				items.add(i);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return items;
	}

	public int updateStock(Connection conn, ArrayList<Item> items) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="UPDATE ITEM SET ITEM_STOCK=? WHERE ITEM_NO=?";
		
		try {
			
		for(int i=0;i<items.size();i++) {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, items.get(i).getItemStock());
			pstmt.setString(2, items.get(i).getItemNo());
			
			result+=pstmt.executeUpdate();
		}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Item> searchStock(Connection conn, Map<String, String> list) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Item> items=new ArrayList<>();
		
		//String searchDate=list.get("searchDate");
		String minStock=list.get("minStock");
		String maxStock=list.get("maxStock");
		String display=list.get("display");
		String name=list.get("name");
		String category=list.get("category");
		
		
		String query="SELECT * FROM ITEM";
		
		int count=0;
		if(minStock!="") {
			
			if(maxStock!="") {
			
			if(count==0) {
				query+=" WHERE ";
				query+="ITEM_STOCK BETWEEN "+minStock+" AND "+maxStock;
				
			}
			
			}else {
				
				query+=" WHERE ";
				query+="ITEM_STOCK BETWEEN "+minStock+" AND (SELECT MAX(ITEM_STOCK) FROM ITEM) ";
				
				
			}
			
			count++;
			
		}
		
		if(display!=null) {
			
			if(count==0) {
				query+=" WHERE ";
				query+="ITEM_DISPLAY="+"'"+display+"'";
			}else {
				query+=" AND ";
				query+="ITEM_DISPLAY="+"'"+display+"'";
			}
			
			count++;
			
		}
		
		if(name!=null) {
			
			if(count==0) {
				query+=" WHERE ";
				query+="ITEM_NAME LIKE '%'||"+"'"+name+"'"+"||'%' ";
			}else {
				query+=" AND ";
				query+="ITEM_NAME LIKE '%'||"+"'"+name+"'"+"||'%' ";
			}
			count++;
			
		}
		
		if(category!="") {
			
			if(count==0) {
				query+=" WHERE ";
				query+="ITEM_CATEGORY="+"'"+category+"'";
			}else {
				query+=" AND ";
				query+="ITEM_CATEGORY="+"'"+category+"'";
				
			}
			
			count++;
			
		}
		
		
		System.out.println(query);
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				Item i=new Item(rset.getString("ITEM_NO"),rset.getString("ITEM_NAME"),rset.getString("ITEM_CATEGORY"),rset.getString("KEYWORD_NO"),rset.getInt("ITEM_PRICE"),
						rset.getInt("ITEM_DISCOUNT"),rset.getInt("ITEM_RATE"),rset.getInt("ITEM_STOCK"),rset.getString("ITEM_DISPLAY"),rset.getString("ITEM_INFO"),
						rset.getDate("ITEM_CDATE"),rset.getDate("ITEM_UDATE"),rset.getInt("ITEM_SCOUNT"),rset.getInt("ITEM_MAX"),rset.getString("ITEM_SALE"));
				
				items.add(i);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return items;
	}


	public int nameCheck(Connection conn, String itemName) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		int result=0;
		
		String query="SELECT COUNT(*) FROM ITEM WHERE ITEM_NAME=?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, itemName);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				result=rset.getInt(1);
			}
			
			System.out.println(result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	// 김경남 ITEM DETAIL
	public Item selectItemDetail(Connection conn, String itemNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Item item = null;
		
		String query = "SELECT * FROM ITEM_DETAIL WHERE ITEM_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, itemNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				item = new Item(rset.getString("item_no")
							   ,rset.getString("item_name")
							   ,rset.getString("keyword_no")
							   ,rset.getString("keyword_name")
							   ,rset.getInt("item_price")
							   ,rset.getInt("item_discount")
							   ,rset.getInt("item_rate")
							   ,rset.getInt("item_stock")
							   ,rset.getString("item_info")
							   ,rset.getInt("item_max")
							   ,rset.getString("mainname")
							   ,rset.getString("mainpath")
							   ,rset.getString("subname")
							   ,rset.getString("subpath"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
			
		return item;
	}

	// 김경남 조회 결과 LIST
	public ArrayList<Item> searchResult(Connection conn, ArrayList searchList) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Item> resultList = new ArrayList<>();
		
		int priceMin = (Integer)searchList.get(0);
		int priceMax = (Integer)searchList.get(1);
		String what = (String)searchList.get(2);
		String query = "";
		
		if(what.equals("anything")) {
			query = "SELECT * FROM ITEM_SEARCHLIST WHERE FINAL_PRICE BETWEEN ? AND ?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, priceMin);
				pstmt.setInt(2, priceMax);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Item it = new Item(rset.getString("item_no")
									 , rset.getString("item_name")
									 , rset.getString("keyword_no")
									 , rset.getString("keyword_name")
									 , rset.getInt("item_price")
									 , rset.getInt("item_discount")
									 , rset.getInt("item_stock")
									 , rset.getDate("item_cdate")
									 , rset.getInt("item_scount")
									 , rset.getInt("item_max")
									 , rset.getString("image_path")
									 , rset.getString("image_name"));
					resultList.add(it);
				}	
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
			
			System.out.println(resultList);
			return resultList;
			
		}else {
			query = "SELECT * FROM ITEM_SEARCHLIST WHERE (FINAL_PRICE BETWEEN ? AND ?) AND ((ITEM_NAME LIKE '%'||?||'%') OR (KEYWORD_NAME LIKE '%'||?||'%'))";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, priceMin);
				pstmt.setInt(2, priceMax);
				pstmt.setString(3, what);
				pstmt.setString(4, what);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Item it = new Item(rset.getString("item_no")
									 , rset.getString("item_name")
									 , rset.getString("keyword_no")
									 , rset.getString("keyword_name")
									 , rset.getInt("item_price")
									 , rset.getInt("item_discount")
									 , rset.getInt("item_stock")
									 , rset.getDate("item_cdate")
									 , rset.getInt("item_scount")
									 , rset.getInt("item_max")
									 , rset.getString("image_path")
									 , rset.getString("image_name"));
					resultList.add(it);
				}	
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
			
			System.out.println(resultList);
			return resultList;
		
		}
		
	
	}
	
	// CATEGORY별로 ITEM의 개수 세기
	public int categoryCount(Connection conn, String category) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int listCount = 0;
		
		String query = "SELECT COUNT(*) FROM ITEM_SEARCHLIST WHERE ITEM_CATEGORY = '"+ category +"'";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listCount = rset.getInt(1);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	// CATEGORY별로 ITEM 모두 가져오기
	public ArrayList<Item> categoryList(Connection conn, String category) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Item> list = new ArrayList<>();
		
		String query = "SELECT * FROM ITEM_SEARCHLIST WHERE ITEM_CATEGORY = '"+ category +"'";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Item it = new Item(rset.getString("item_no"),
								   rset.getString("item_name"),
								   rset.getString("keyword_no"),
								   rset.getString("keyword_name"),
								   rset.getInt("item_price"),
								   rset.getInt("item_discount"),
								   rset.getInt("item_stock"),
								   rset.getDate("item_cdate"),
								   rset.getInt("item_scount"),
								   rset.getInt("item_max"),
								   rset.getString("image_path"),
								   rset.getString("image_name"));
				
				list.add(it);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
	
		return list;
	}

}
