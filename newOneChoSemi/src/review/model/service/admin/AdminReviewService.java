package review.model.service.admin;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import static common.JDBCTemplate.*;

import review.model.dao.admin.AdminReviewDao;

import review.model.vo.admin.AdReview;

public class AdminReviewService {

	public ArrayList<AdReview> selectAllReview() {
		
		Connection conn=getConnection();
		ArrayList<AdReview> reviews=new AdminReviewDao().selectAllReview(conn);
		
		close(conn);
		return reviews;
	}

	public ArrayList<AdReview> searchReview(Map<String,String> list) {
		
		Connection conn=getConnection();
		ArrayList<AdReview> reviews=new AdminReviewDao().searchReview(conn,list);
		
		close(conn);
		return reviews;
	}

}
