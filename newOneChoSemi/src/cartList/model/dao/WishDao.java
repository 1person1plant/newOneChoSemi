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
	      
		String query = "SELECT WISHLIST_NO, ITEM_NO, ITEM_NAME, ITEM_PRICE, WISHLIST_MEMO, IMAGE_NO, IMAGE_PATH, IMAGE_NAME FROM MEMBER_WISHLIST WHERE MEMBER_NO = ?";
	      
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
			System.out.println("WishDao : " + wishList);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rSet);
		}
		
		return wishList;
	}

}