package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static common.JDBCTemplate.*;
import member.model.vo.MyWishList;
import member.model.vo.RealWishList;

public class MyWishListDao {


	public int memoUpdate(Connection conn, RealWishList realWishList) {
		PreparedStatement pstmt = null;
		int result = 0; 
		String query = "UPDATE WISHLIST SET WISHLIST_MEMO=? WHERE WISHLIST_NO=? AND MEMBER_NO=? AND ITEM_NO=?";
		try { 
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, realWishList.getWishlistMemo());
			pstmt.setString(2, realWishList.getWishlistNo());
			pstmt.setString(3, realWishList.getMemberNo());
			pstmt.setString(4, realWishList.getItemNo());
			result = pstmt.executeUpdate();
			
			System.out.println("MyWishListDao memoUpdate : " + result);
		 	}catch (SQLException e) {
		 		e.printStackTrace(); 
		 	}finally {
		 		close(pstmt);
		 	}
		 return result;
		 }

	public ArrayList<MyWishList> myWishList(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	      
		ArrayList<MyWishList> mwl = new ArrayList<>();
	      
		String query = "SELECT * FROM WISHCHK WHERE MEMBER_NO = ?";
	      
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MyWishList wish = new MyWishList(rset.getString("WISHLIST_MEMO")
										 , rset.getString("WISHLIST_NO")
										 , rset.getString("ITEM_NO")
										 , rset.getString("IMAGE_NAME")
				                         , rset.getString("IMAGE_PATH")
				                         , rset.getString("ITEM_NAME")
				                         , rset.getString("MEMBER_NO"));
			
				mwl.add(wish);
			}
			/* System.out.println("dao = " + mwl); */
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return mwl;
	}

	public int deleteWish(Connection conn, MyWishList myWishList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM WISHLIST WHERE WISHLIST_NO = ? AND MEMBER_NO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, myWishList.getWishlistNo());
			pstmt.setString(2, myWishList.getMemberNo());
			result = pstmt.executeUpdate();
			/* System.out.println("dao result : " +result); */
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	

}
