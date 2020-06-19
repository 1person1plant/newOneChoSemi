package member.model.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import static common.JDBCTemplate.*;

import member.model.vo.admin.AdminMember;

public class AdminMemberDao {

	public ArrayList<AdminMember> selectAllMember(Connection conn) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<AdminMember> members=new ArrayList<>();
		
		String query="SELECT * FROM V_ADMIN_MEMBER";
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				AdminMember member=new AdminMember(rset.getString("MEMBER_NO"),rset.getString("MEMBER_ID"),rset.getString("MEMBER_NAME"),rset.getString("MEMBER_EMAIL"),rset.getString("MEMBER_PHONE"),
						rset.getString("MEMBER_POSTCODE"),rset.getString("MEMBER_ADDRESS"),rset.getInt("ACCUM_PAID"),rset.getInt("ACCUM_COUNT"),rset.getInt("MEMBER_POINT"),rset.getString("RANK_NAME"),
						rset.getDate("MEMBER_JOINDATE"),rset.getString("MEMBER_STATUS"),rset.getString("MEMBER_EXIT"),rset.getString("MEMBER_ADMIN"));
				
				members.add(member);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return members;
	}

	public int updateMember(Connection conn, String memberNo, String rank, int point) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="UPDATE MEMBER SET MEMBER_RANK=?, MEMBER_POINT=? WHERE MEMBER_NO=?";
		
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, rank);
			pstmt.setInt(2, point);
			pstmt.setString(3, memberNo);
			
			result=pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int grantAdmin(Connection conn, String admin, String memNo) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="UPDATE MEMBER SET MEMBER_ADMIN=? WHERE MEMBER_NO=?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, admin);
			pstmt.setString(2, memNo);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		
		
		
		return result;
	}

	public ArrayList<AdminMember> searchMember(Connection conn, Map<String, String> list) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<AdminMember> members=new ArrayList<>();
		
		String searchDate=list.get("searchDate");
		String date1=list.get("date1");
		String date2=list.get("date2");
		String active=list.get("active");
		String type=list.get("type");
		
		String query="SELECT * FROM V_ADMIN_MEMBER";
		
		int count=0;
		if(searchDate!="") {
			
			if(count==0) {
				
				query+=" WHERE ";
				query+="TO_DATE(TO_CHAR("+searchDate+",'YYYY-MM-DD')) BETWEEN TO_DATE('"+date1+"','YYYY-MM-DD') AND TO_DATE('"+date2+"','YYYY-MM-DD')";
			}
			
			count++;
			
		}
		
		if(active!=null) {
			
			if(count==0) {
				query+=" WHERE ";
				query+="MEMBER_STATUS="+"'"+active+"'";
			}else {
				query+=" AND ";
				query+="MEMBER_STATUS="+"'"+active+"'";
			}
			
			count++;
			
		}
		
		if(type!=null) {
			
			if(count==0) {
				query+=" WHERE ";
				query+="MEMBER_ADMIN="+"'"+type+"'";
			}else {
				query+=" AND ";
				query+="MEMBER_ADMIN="+"'"+type+"'";
			}
			
			count++;
			
		}
		
		System.out.println(query);
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				AdminMember member=new AdminMember(rset.getString("MEMBER_NO"),rset.getString("MEMBER_ID"),rset.getString("MEMBER_NAME"),rset.getString("MEMBER_EMAIL"),rset.getString("MEMBER_PHONE"),
						rset.getString("MEMBER_POSTCODE"),rset.getString("MEMBER_ADDRESS"),rset.getInt("ACCUM_PAID"),rset.getInt("ACCUM_COUNT"),rset.getInt("MEMBER_POINT"),rset.getString("RANK_NAME"),
						rset.getDate("MEMBER_JOINDATE"),rset.getString("MEMBER_STATUS"),rset.getString("MEMBER_EXIT"),rset.getString("MEMBER_ADMIN"));
				
				members.add(member);	
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return members;
	}

}
