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
		
		String query = "SELECT * FROM WISHCHK WHERE MEMBER_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				mwl = new MyWishList(rset.getString("WISHLIST_NO"),
									rset.getString("IMAGE_PATH"),
									rset.getString("ITEM_NAME"),
									rset.getString("WISHLIST_MEMO"),
									rset.getString("MEMBER_NO"));
						
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

}
