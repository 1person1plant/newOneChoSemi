package cartList.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

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

	public int updateWMemo(WishList wi) {
		Connection conn = getConnection();

		int result = new WishDao().updateWMemo(conn, wi);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int deleteWish(String wishNo) {
		Connection conn = getConnection();

		int result = new WishDao().deleteWish(conn, wishNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
