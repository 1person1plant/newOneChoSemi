package cartList.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cartList.model.vo.Cart;

import static common.JDBCTemplate.close;

public class CartDao {

	public ArrayList<Cart> cartList(Connection conn, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
	      
		ArrayList<Cart> cartList = new ArrayList<>();
	      
		String query = "SELECT MEMBER_NO, CARTLIST_NO, ITEM_NO, ITEM_NAME, ITEM_PRICE, ITEM_DISCOUNT, ITEM_MAX, CARTLIST_COUNT, IMAGE_NAME FROM MEMBER_CARTLIST WHERE MEMBER_NO =?";
	      
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNo);
			
			rSet = pstmt.executeQuery();
			
			while(rSet.next()) {
				Cart c = new Cart(rSet.getString("MEMBER_NO")
		                        , rSet.getString("CARTLIST_NO")
		                        , rSet.getString("ITEM_NO")
		                        , rSet.getString("ITEM_NAME")
		                        , rSet.getInt("ITEM_PRICE")
								, rSet.getInt("ITEM_DISCOUNT")
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

	// Cart.jsp에서 가져온 카트 수량을 업데이트하려고 OrderServlet에서 왔다
	public boolean cartUpdate(Connection conn, String userNo, ArrayList<Cart> cartOrderList) {
		PreparedStatement pstmt = null;
		int result = 0;
		boolean chk = true;
//		System.out.println("CartDao update : " + cartOrderList);
//		System.out.println("CartDao update Size : " + cartOrderList.size());
		
		String query = "UPDATE CARTLIST SET CARTLIST_COUNT = ?"
					 + "WHERE MEMBER_NO = ?"
					 + "AND CARTLIST_NO = ?";
		
		for(int i = 0 ; i < cartOrderList.size() ; i++) {
//			System.out.println("CartDao 카트 정보 " + i +  " : " + cartOrderList.get(i));
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, cartOrderList.get(i).getCartListCount());
				pstmt.setString(2, userNo);
				pstmt.setString(3, cartOrderList.get(i).getCartListNo());
//				System.out.println("cart 카트 수량 " + i +  " : " + cartOrderList.get(i).getCartListCount());
//				System.out.println("cart update : " + userNo);
//				System.out.println("cart 카트 번호 " + i +  " : " + cartOrderList.get(i).getCartListNo());
				
				// TODO 다중 결과 값 처리가 필요하다... 지금은 임시
				result = pstmt.executeUpdate();
				if(result > 0 && chk == true) {
					chk = true;
				} else {
					chk = false;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
//		System.out.println("CartDao 카트 수량 업데이트 : " + result);

		return chk;
	}
	
	// Order.jsp에 출력하려고 OrderServlet에서 왔다
	public ArrayList<Cart> cartOrderList(Connection conn, String userNo, ArrayList<Cart> cartOrderList) {
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		ArrayList<Cart> cartList = new ArrayList<>();

		String query = "SELECT MEMBER_NO, CARTLIST_NO, ITEM_NO, ITEM_NAME, ITEM_PRICE, ITEM_DISCOUNT, ITEM_MAX, CARTLIST_COUNT, IMAGE_NAME FROM MEMBER_CARTLIST WHERE MEMBER_NO =? ";
		// cartOrderList.size() 만큼 query문 만들기
		for(int i = 0 ; i < cartOrderList.size() ; i++) {
			if(i == 0) {
				query += " AND CARTLIST_NO = ? ";
			} else {
				query += " OR CARTLIST_NO = ? ";
			}
		}

//		System.out.println("query : " + query);
		try { // TODO 만드는 중
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNo);
			
			// cartOrderList.size() 만큼 DB에 요청
			int j = 2;
			for(int i = 0 ; i < cartOrderList.size() ; i++) {
				System.out.println("cartOrderList.get(" + j + ").getCartListNo() : " + cartOrderList.get(i).getCartListNo() + " j : " + j);
				pstmt.setString(j, cartOrderList.get(i).getCartListNo());
				j++;
			}
			
			rSet = pstmt.executeQuery();
			System.out.println("rSet : "+ rSet);
			
			while(rSet.next()) {
				Cart cr = new Cart(rSet.getString("MEMBER_NO")
		                        , rSet.getString("CARTLIST_NO")
		                        , rSet.getString("ITEM_NO")
		                        , rSet.getString("ITEM_NAME")
		                        , rSet.getInt("ITEM_PRICE")
								, rSet.getInt("ITEM_DISCOUNT")
		                        , rSet.getInt("ITEM_MAX")
		                        , rSet.getInt("CARTLIST_COUNT")
		                        , rSet.getString("IMAGE_NAME")
		                     	);
								
				cartList.add(cr);
			}
			System.out.println("CartDao 주문페이지 출력 리스트 : " + cartList);
			
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
		System.out.println("CartDao 카트 삭제 : 만드는 중");

//		try {
//			for(int i = 0 ; i < deleteCart.size() ; i++) {
//				Cart ca = deleteCart.get(i);
//
//				pstmt = conn.prepareStatement(query);
//				pstmt.setString(1, ca.getCartListNo());
//				
//				result += pstmt.executeUpdate();
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}

		return result;
	}




}
