package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static common.JDBCTemplate.*;
import member.model.vo.MyWishList;

public class MyWishListDao {

	public ArrayList<MyWishList> memberWish(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MyWishList> mwl = new ArrayList<>();
		
		String query = "SELECT * FROM WISHLIST WHERE MEMBER_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				MyWishList mwlTemp = new MyWishList(rset.getString("WISHLIST_NO"),
									rset.getString("ITEM_NO"),
									rset.getString("MEMBER_NO"),
									rset.getString("WISHLIST_MEMO"));
				mwl.add(mwlTemp);
						
			}
			
			System.out.println("MyWishListDao memberWish 조회 : " + mwl);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return mwl;
	}

	public int memoUpdate(Connection conn, MyWishList myWishList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE WISHLIST SET WISHLIST_MEMO=? WHERE WISHLIST_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, myWishList.getWishlistMemo());
			pstmt.setString(2, myWishList.getWishlistNo());
			
			result = pstmt.executeUpdate();
			
			System.out.println("MyWishListDao memoUpdate : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
