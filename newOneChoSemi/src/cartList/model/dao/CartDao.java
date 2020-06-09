package cartList.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cartList.model.vo.Cart;

import static common.JDBCTemplate.close;

public class CartDao {


	public int cartUpdate(Connection conn, String userNo, ArrayList<Cart> cartOrderList) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println("cart update : " + cartOrderList);
		
		String query = "UPDATE CARTLIST SET CARTLIST_COUNT = ?"
				+ "WHERE MEMBER_NO = ?"
				+ "AND CARTLIST_NO = ?";
		
		for(int i = 0 ; i < cartOrderList.size() ; i++) {
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, cartOrderList.get(i).getCartListCount());
				pstmt.setString(2, userNo);
				pstmt.setString(3, cartOrderList.get(i).getCartListNo());
				
				result += pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}

		return result;
	}
	
	public ArrayList<Cart> cartList(Connection conn, ArrayList<Cart> cartOrderList) {
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		ArrayList<Cart> cartList = new ArrayList<>();
		
		String query = "SELECT MEMBER_NO, CARTLIST_NO , ITEM_NO , ITEM_NAME , ITEM_PRICE , ITEM_MAX , CARTLIST_COUNT , IMAGE_NAME FROM MEMBER_CARTLIST WHERE MEMBER_NO =? "
				+ "AND CARTLIST_NO = ?";
		
		try { // TODO 만드는 중
			for(int i = 0 ; i < cartOrderList.size() ; i++) {
				
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cartOrderList.get(i).getMemberNo());
			rSet = pstmt.executeQuery();
			}
			
			
			while(rSet.next()) {
				Cart c = new Cart(rSet.getString("MEMBER_NO")
								, rSet.getString("CARTLIST_NO")
								, rSet.getString("ITEM_NO")
								, rSet.getString("ITEM_NAME")
								, rSet.getInt("ITEM_PRICE")
								, rSet.getInt("ITEM_MAX")
								, rSet.getInt("CARTLIST_COUNT")
								, rSet.getString("IMAGE_NAME")
								 );
				cartList.add(c);
			}
//			System.out.println("CartDao : " + cartList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rSet);
		}

		return cartList;
	}

	public int deleteCart(Connection conn, ArrayList<Cart> deleteCart) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "";
		// TODO 미완성
		
		try {
			for(int i = 0 ; i < deleteCart.size() ; i++) {
				Cart ca = deleteCart.get(i);

				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, ca.getCartListNo());
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


}
