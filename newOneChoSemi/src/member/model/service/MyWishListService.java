package member.model.service;

import member.model.dao.MyWishListDao;
import member.model.vo.MyWishList;
import member.model.vo.RealWishList;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class MyWishListService {

	
	 public int memoUpdate(RealWishList realWishList) { 
		 Connection conn = getConnection();
		 int result = new MyWishListDao().memoUpdate(conn,realWishList); 
		 System.out.println("memoUpdate service"+ result);
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
		/* System.out.println("service = " + mwl); */
		close(conn);
		return mwl;
	}

	public int deleteWish(String wishNo) {
		Connection conn = getConnection();
<<<<<<< HEAD
		int result = new MyWishListDao().deleteWish(conn,myWishList);
=======
		int result = new MyWishListDao().deleteWish(conn,wishNo);
		System.out.println("dao>service : " + result);
>>>>>>> refs/remotes/origin/dev_sh
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int wishCheck(String itemNo, String memberNo) {
		
		Connection conn = getConnection();
		
		int result = new MyWishListDao().wishCheck(conn, itemNo, memberNo);
		
		close(conn);
		
		return result;
	}




}
