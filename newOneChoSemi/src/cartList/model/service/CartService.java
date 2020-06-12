package cartList.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import cartList.model.dao.CartDao;
import cartList.model.vo.Cart;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;

public class CartService {


	public ArrayList<Cart> cartList(String userNo) {
		Connection conn = getConnection();

		ArrayList<Cart> cartList = new CartDao().cartList(conn, userNo);
		
		close(conn);
		return cartList;
	}
	
	public ArrayList<Cart> cartOrderList(String userNo, ArrayList<Cart> cartOrderList) {
		Connection conn = getConnection();

		// DB 카트 수량 증가
		boolean result = new CartDao().cartUpdate(conn, userNo, cartOrderList);
		
		ArrayList<Cart> cartList = new ArrayList<>();
		
		// 카트 업데이트가 정상적이라면 구매 정보 다시 가져오기
		if(result) {
			commit(conn);
			// 카트 수량 다시 받아오기
			cartList = new CartDao().cartOrderList(conn, userNo, cartOrderList);
		}else {
			rollback(conn);
		}
				
		close(conn);
		return cartList;
	}

	public int deleteCart(String cartNo) {
		Connection conn = getConnection();

		int result = new CartDao().deleteCart(conn, cartNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public boolean deleteCartList(ArrayList<Cart> deleteCart) {
		Connection conn = getConnection();

		boolean result = new CartDao().deleteCartList(conn, deleteCart);
		
		if(result) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Cart> wishtoCartList(String cartNum, String itemId, String userNo) {
		Connection conn = getConnection();

		int result = new CartDao().wishtoCartUpdate(conn, cartNum, itemId, userNo);

		ArrayList<Cart> cartList = new ArrayList<>();
		
		if(result > 0) {
			commit(conn);
			cartList = new CartDao().wishtoCartList(conn, itemId, userNo);
		}else {
			rollback(conn);
		}
				
		close(conn);
		return cartList;
	}


}
