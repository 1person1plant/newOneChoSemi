package review.model.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import static common.JDBCTemplate.*;


import review.model.vo.admin.AdReview;

public class AdminReviewDao {

	public ArrayList<AdReview> selectAllReview(Connection conn) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<AdReview> reviews=new ArrayList<>();
		
		String query="SELECT * FROM V_ADMIN_REVIEW";
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				AdReview r=new AdReview(rset.getString("REVIEW_NO"),rset.getString("ORDER_NO"),rset.getString("ITEM_NO"),rset.getString("ITEM_NAME"),rset.getString("MEMBER_NO")
						,rset.getString("MEMBER_ID"),rset.getInt("REVIEW_RATE"),rset.getString("REVIEW_CONTENT"),rset.getDate("REVIEW_CDATE"),
						rset.getDate("REVIEW_UDATE"),rset.getString("REVIEW_IMAGENAME"),rset.getString("REVIEW_IMAGEPATH"));
				
				
				reviews.add(r);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
	
		
		
		return reviews;
	}

	public ArrayList<AdReview> searchReview(Connection conn, Map<String,String> list) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<AdReview> reviews=new ArrayList<>();
		
		String searchDate=list.get("searchDate");
		String date1=list.get("date1");
		String date2=list.get("date2");
		String rate=list.get("rate");
		
		String query="SELECT * FROM V_ADMIN_REVIEW";
		
		int count=0;
		if(searchDate!="") {
			
			if(count==0) {
				query+=" WHERE ";
				query+="TO_DATE(TO_CHAR("+searchDate+",'YYYY-MM-DD')) BETWEEN TO_DATE('"+date1+"','YYYY-MM-DD') AND TO_DATE('"+date2+"','YYYY-MM-DD')";
				
			}
			
			count++;
			
		}
		
		
		if(rate!=null) {
			
			if(count==0) {
				query+=" WHERE ";
				query+="REVIEW_RATE="+"'"+rate+"'";
			}else {
				query+=" AND ";
				query+="REVIEW_RATE="+"'"+rate+"'";
			}
			
			count++;
			
		}
		
		System.out.println(query);
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()){
				
				AdReview r=new AdReview(rset.getString("REVIEW_NO"),rset.getString("ORDER_NO"),rset.getString("ITEM_NO"),rset.getString("ITEM_NAME"),rset.getString("MEMBER_NO")
						,rset.getString("MEMBER_ID"),rset.getInt("REVIEW_RATE"),rset.getString("REVIEW_CONTENT"),rset.getDate("REVIEW_CDATE"),
						rset.getDate("REVIEW_UDATE"),rset.getString("REVIEW_IMAGENAME"),rset.getString("REVIEW_IMAGEPATH"));
				
				
				reviews.add(r);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			close(rset);
		}
		
		
		
		
		return reviews;
	}

}
