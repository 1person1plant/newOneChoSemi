package member.model.service;

import member.model.dao.MyWishListDao;
import member.model.vo.MyWishList;
import static common.JDBCTemplate.*;

import java.sql.Connection;
public class MyWishListService {

	public MyWishList memberWish(String memberNo) {
		Connection conn = getConnection();
		MyWishList mwl = new MyWishListDao().memberWish(conn,memberNo);
		/* System.out.println("service"+mwl); */
		close(conn);
		return mwl;
	}

	public int memoUpdate(MyWishList myWishList) {
		Connection conn = getConnection();
		int result = new MyWishListDao().memoUpdate(conn,myWishList);
		System.out.println("service"+ result);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
