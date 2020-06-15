package review.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import review.model.vo.Review;

public class ReviewDao {

	public ArrayList<Review> otherReviewList(Connection conn, String itemNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Review> otherReviewList = new ArrayList<>();
		
		String query = "SELECT * FROM REVIEW_LIST WHERE ITEM_NO = '"+ itemNo +"'";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review rv = new Review(rset.getString("review_no"),
						   			   rset.getString("order_no"),
						   			   rset.getString("item_no"),
						   			   rset.getString("member_no"),						   		
						   			   rset.getDate("review_cdate"),
						   			   rset.getInt("review_rate"),
						   			   rset.getString("review_content"),
						   			   rset.getDate("review_udate"),
						   			   rset.getString("review_imagename"),
						   			   rset.getString("review_imagepath"),
									   rset.getString("order_review"),
									   rset.getString("member_id"),
									   rset.getString("member_rank"));
				
				otherReviewList.add(rv);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return otherReviewList;
	}

	public ArrayList<Review> myReviewList(Connection conn, String itemNo, String memberNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Review> myReviewList = new ArrayList<>();
		
		String query = "SELECT * FROM REVIEW_LIST WHERE ITEM_NO = '"+ itemNo +"' AND MEMBER_NO = '" + memberNo + "'";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review rv = new Review(rset.getString("review_no"),
						   			   rset.getString("order_no"),
						   			   rset.getString("item_no"),
						   			   rset.getString("member_no"),						   		
						   			   rset.getDate("review_cdate"),
						   			   rset.getInt("review_rate"),
						   			   rset.getString("review_content"),
						   			   rset.getDate("review_udate"),
						   			   rset.getString("review_imagename"),
						   			   rset.getString("review_imagepath"),
									   rset.getString("order_review"),
									   rset.getString("member_id"),
									   rset.getString("member_rank"));
				
				myReviewList.add(rv);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return myReviewList;
	}

}
