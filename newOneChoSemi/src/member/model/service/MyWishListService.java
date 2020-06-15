package member.model.service;

import member.model.dao.MyWishListDao;
import member.model.vo.MyWishList;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import cartList.model.dao.WishDao;
import cartList.model.vo.WishList;
public class MyWishListService {

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

	public ArrayList<MyWishList> myWishList(String memberNo) {
		Connection conn = getConnection();
		ArrayList<MyWishList> mwl = new MyWishListDao().myWishList(conn, memberNo);
		System.out.println("service = " + mwl);
		close(conn);
		return mwl;
	}

}
