package cartList.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import cartList.model.dao.CartDao;
import cartList.model.vo.Cart;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;

public class CartService {

	public ArrayList<Cart> cartList(String userNo, ArrayList<Cart> cartOrderList) {
		Connection conn = getConnection();

		int result = new CartDao().cartUpdate(conn, userNo, cartOrderList);
		
		ArrayList<Cart> cartList = new CartDao().cartList(conn, cartOrderList);
				
		close(conn);
		return cartList;
	}

	public int deleteCart(ArrayList<Cart> deleteCart) {
		Connection conn = getConnection();

		int result = new CartDao().deleteCart(conn, deleteCart);
				
		close(conn);
		return result;
	}

}
