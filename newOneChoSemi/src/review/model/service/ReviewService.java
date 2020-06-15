package review.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

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

}
