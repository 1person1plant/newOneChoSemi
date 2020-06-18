package review.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import order.model.vo.Order;
import review.model.dao.ReviewDao;
import review.model.vo.Review;

public class ReviewService {

	public ArrayList<Review> otherReviewList(String itemNo) {

		Connection conn = getConnection();
		
		ArrayList<Review> otherReviewList = new ReviewDao().otherReviewList(conn, itemNo);
		
		close(conn);
		
		return otherReviewList;
	}

	public ArrayList<Review> myReviewList(String itemNo, String memberNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> myReviewList = new ReviewDao().myReviewList(conn, itemNo, memberNo);
		
		close(conn);
		
		return myReviewList;
	}

	public int statusCheck(String itemNo, String memberNo) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().statusCheck(conn, itemNo, memberNo);
		
		close(conn);
		
		return result;
				
	}

	public Order orderCheck(String itemNo, String memberNo) {
		
		Connection conn = getConnection();
		
		Order order = new ReviewDao().orderCheck(conn, itemNo, memberNo);
		
		close(conn);
		
		return order;
		
	}

}
