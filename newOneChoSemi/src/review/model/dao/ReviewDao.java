package review.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import order.model.vo.Order;
import review.model.vo.Review;

public class ReviewDao {

	public ArrayList<Review> otherReviewList(Connection conn, String itemNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Review> otherReviewList = new ArrayList<>();
		
		String query = "SELECT * FROM REVIEW_LIST WHERE ITEM_NO = '"+ itemNo +"' ORDER BY 8 DESC";
		
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
		
		String query = "SELECT * FROM REVIEW_LIST WHERE ITEM_NO = '"+ itemNo +"' AND MEMBER_NO = '" + memberNo + "' ORDER BY 8 DESC";
		
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

	public int statusCheck(Connection conn, String itemNo, String memberNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "SELECT COUNT(*) FROM (SELECT ORDER_NO, ITEM_NO, ORDER_DATE, MEMBER_NO, DELIVERY_CODE, ORDER_REVIEW FROM ORDERLIST WHERE ITEM_NO = ? AND MEMBER_NO = ? AND ORDER_REVIEW = 'N')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, itemNo);
			pstmt.setString(2, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	public Order orderCheck(Connection conn, String itemNo, String memberNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Order order = new Order();
		
		String query = "SELECT O.* FROM (SELECT ORDER_NO, ITEM_NO, ORDER_DATE, MEMBER_NO, DELIVERY_CODE, ORDER_REVIEW FROM ORDERLIST WHERE ITEM_NO = ? AND MEMBER_NO = ? AND DELIVERY_CODE = 'D3' AND ORDER_REVIEW = 'N' ORDER BY ORDER_DATE ASC) O WHERE ROWNUM = 1";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, itemNo);
			pstmt.setString(2, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				order = new Order(rset.getString("order_no")
								 ,rset.getString("item_no")
								 ,rset.getDate("order_date")
								 ,rset.getString("member_no")
								 ,rset.getString("delivery_code")
								 ,rset.getString("order_review"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return order;
	}

	public int reviewReady(Connection conn, String orderNo, String itemNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE ORDERLIST SET ORDER_REVIEW = 'Y' WHERE ORDER_NO = ? AND ITEM_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, orderNo);
			pstmt.setString(2, itemNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int reviewCreate(Connection conn, Review rv) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String orderNo = rv.getOrderNo();
		String itemNo = rv.getItemNo();
		String memberNo = rv.getMemberNo();
		int reviewRate = rv.getReviewRate();
		String reviewContent = rv.getReviewContent();
		String reviewImgName = rv.getReviewImgName();
		String reviewImgPath = rv.getReviewImgPath();
		
		if(reviewImgName == null) {
			
			String query = "INSERT INTO REVIEW VALUES('R'||LPAD(SEQ_REVIEW.NEXTVAL,5,'0'), ?, ?, ?, SYSDATE, ?, ?, SYSDATE, NULL, NULL)";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, orderNo);
				pstmt.setString(2, itemNo);
				pstmt.setString(3, memberNo);
				pstmt.setInt(4, reviewRate);
				pstmt.setString(5, reviewContent);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
		}else {				
			
			String query = "INSERT INTO REVIEW VALUES('R'||LPAD(SEQ_REVIEW.NEXTVAL,5,'0'), ?, ?, ?, SYSDATE, ?, ?, SYSDATE, ?, ?)";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, orderNo);
				pstmt.setString(2, itemNo);
				pstmt.setString(3, memberNo);
				pstmt.setInt(4, reviewRate);
				pstmt.setString(5, reviewContent);
				pstmt.setString(6, reviewImgName);
				pstmt.setString(7, reviewImgPath);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
		}
		
		return result;
	}

	public Review loadReview(Connection conn, String reviewNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Review rv = new Review();
		
		String query = "SELECT * FROM REVIEW WHERE REVIEW_NO = '" + reviewNo + "'";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rv = new Review(rset.getString("review_no")
				  			   ,rset.getInt("review_rate")
							   ,rset.getString("review_content")
							   ,rset.getDate("review_udate")
							   ,rset.getString("review_imagename")
							   ,rset.getString("review_imagepath"));
			}
			
			System.out.println(rv);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return rv;
	}

	public int reviewUpdate(Connection conn, Review updateRv) {
		
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE REVIEW SET REVIEW_RATE = ?, REVIEW_CONTENT = ?, REVIEW_UDATE = SYSDATE, REVIEW_IMAGENAME = ? WHERE REVIEW_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, updateRv.getReviewRate());
			pstmt.setString(2, updateRv.getReviewContent());
			pstmt.setString(3, updateRv.getReviewImgName());
			pstmt.setString(4, updateRv.getReviewNo());
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int reviewDelete(Connection conn, String reviewNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM REVIEW WHERE REVIEW_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reviewNo);
			
			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
