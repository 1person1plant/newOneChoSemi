package cartList.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cartList.model.vo.WishList;

public class WishDao {

	public ArrayList<WishList> wishList(Connection conn, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
	      
		ArrayList<WishList> wishList = new ArrayList<>();
	      
		String query = "SELECT WISHLIST_NO, ITEM_NO, ITEM_NAME, ITEM_PRICE, NVL(WISHLIST_MEMO,' ') WISHLIST_MEMO, IMAGE_NO, IMAGE_PATH, IMAGE_NAME FROM MEMBER_WISHLIST WHERE MEMBER_NO = ?";
	      
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNo);
			
			rSet = pstmt.executeQuery();
			
			while(rSet.next()) {
				WishList wi = new WishList(rSet.getString("WISHLIST_NO")
				                         , rSet.getString("ITEM_NO")
				                         , rSet.getString("ITEM_NAME")
				                         , rSet.getInt("ITEM_PRICE")
				                         , rSet.getString("WISHLIST_MEMO")
				                         , rSet.getString("IMAGE_NO")
				                         , rSet.getString("IMAGE_PATH")
				                         , rSet.getString("IMAGE_NAME")
			                         	  );
				
				wishList.add(wi);
			}
//			System.out.println("WishDao : " + wishList);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rSet);
		}
		
		return wishList;
	}

	public int updateWMemo(Connection conn, WishList wi) {
		PreparedStatement pstmt = null;
		int result = 0;
	      
		String query = "UPDATE WISHLIST SET WISHLIST_MEMO = ? WHERE WISHLIST_NO = ?";
	      
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, wi.getWishListMemo());
			pstmt.setString(2, wi.getWishListNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteWish(Connection conn, String wishNo) {
		PreparedStatement pstmt = null;
		int result = 0;
	      
		String query = "DELETE FROM WISHLIST WHERE WISHLIST_NO = ?";
	      
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, wishNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<WishList> myWishList(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
	      
		ArrayList<WishList> mwl = new ArrayList<>();
	      
		String query = "SELECT WISHLIST_NO, ITEM_NO, ITEM_NAME, ITEM_PRICE, WISHLIST_MEMO, IMAGE_NO, IMAGE_PATH, IMAGE_NAME FROM MEMBER_WISHLIST WHERE MEMBER_NO = ?";
	      
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			
			rSet = pstmt.executeQuery();
			
			while(rSet.next()) {
				WishList wi = new WishList(rSet.getString("WISHLIST_NO")
				                         , rSet.getString("ITEM_NO")
				                         , rSet.getString("ITEM_NAME")
				                         , rSet.getInt("ITEM_PRICE")
				                         , rSet.getString("WISHLIST_MEMO")
				                         , rSet.getString("IMAGE_NO")
				                         , rSet.getString("IMAGE_PATH")
				                         , rSet.getString("IMAGE_NAME")
			                         	  );
				
				mwl.add(wi);
			}
			System.out.println("WishDao : " + mwl);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rSet);
		}
		
		return mwl;
	}

}
