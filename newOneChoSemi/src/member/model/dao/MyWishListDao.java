package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static common.JDBCTemplate.*;
import member.model.vo.MyWishList;

public class MyWishListDao {

	public MyWishList memberWish(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MyWishList mwl = null;
		
		String query = "SELECT * FROM WISHLIST WHERE MEMBER_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				mwl = new MyWishList(rset.getString("WISHLIST_NO"),
									rset.getString("ITEM_NO"),
									rset.getString("MEMBER_NO"),
									rset.getString("WISHLIST_MEMO"));
						
			}
			System.out.println("dao"+mwl);
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
		String query = "UPDATE WISHLIST SET WISHLIST_MEMO=? WHERE ITEM_NO=? AND WISHLIST_NO=? AND MEMBER_NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, myWishList.getWishlistMemo());
			pstmt.setString(2, myWishList.getItemNo());
			pstmt.setString(3, myWishList.getWishlistNo());
			pstmt.setString(4, myWishList.getMemberNo());
			result = pstmt.executeUpdate();
			System.out.println("dao"+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
