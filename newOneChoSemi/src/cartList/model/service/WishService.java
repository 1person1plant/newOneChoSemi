package cartList.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import cartList.model.dao.WishDao;
import cartList.model.vo.WishList;

public class WishService {

	public ArrayList<WishList> wishList(String userNo) {
		Connection conn = getConnection();

		ArrayList<WishList> wishList = new WishDao().wishList(conn, userNo);
		
		close(conn);
		return wishList;
	}

}
