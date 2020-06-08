package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.model.vo.Member;

import static common.JDBCTemplate.close;

public class MemberDao {
	
	public Member loginMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member loginUser = null;

		String query = "SELECT MEMBER_NO" + 
							", MEMBER_ADMIN" +
							", MEMBER_ID" + 
							", MEMBER_PWD" + 
							", MEMBER_NAME" + 
							", MEMBER_PHONE1" + 
							", MEMBER_PHONE2" + 
							", MEMBER_PHONE3" + 
							", MEMBER_EMAIL1" + 
							", MEMBER_EMAIL2" + 
							", MEMBER_POSTCODE" + 
							", MEMBER_ADDRESS1" + 
							", MEMBER_ADDRESS2" + 
							", MEMBER_STATUS" + 
							", MEMBER_POINT" + 
							", MEMBER_RANK" + 
						" FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_PWD=? AND MEMBER_STATUS = 'N'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginUser = new Member(rs.getString("MEMBER_NO"),
									   rs.getString("MEMBER_ADMIN"),
									   rs.getString("MEMBER_ID"),
									   rs.getString("MEMBER_PWD"),
									   rs.getString("MEMBER_NAME"),
									   rs.getString("MEMBER_PHONE1"),
									   rs.getString("MEMBER_PHONE2"),
									   rs.getString("MEMBER_PHONE3"),
									   rs.getString("MEMBER_EMAIL1"),
									   rs.getString("MEMBER_EMAIL2"),
									   rs.getString("MEMBER_POSTCODE"),
									   rs.getString("MEMBER_ADDRESS1"),
									   rs.getString("MEMBER_ADDRESS2"),
									   rs.getString("MEMBER_STATUS"),
									   rs.getInt("MEMBER_POINT"),
									   rs.getString("MEMBER_RANK")
									   );
			}
//			System.out.println("MemberDao : " + loginUser);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return loginUser;
	}
	public int memberUpdate(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE MEMBER SET MEMBER_PWD=?,MEMBER_PHONE1=?,MEMBER_PHONE2=?,MEMBER_PHONE3=?,MEMBER_EMAIL1=?,MEMBER_EMAIL2=?,MEMBER_POSTCODE=?,MEMBER_ADDRESS1=?,MEMBER_ADDRESS2=? WHERE MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberPwd());
			pstmt.setString(2, member.getMemberPhone1());
			pstmt.setString(3, member.getMemberPhone2());
			pstmt.setString(4, member.getMemberPhone3());
			pstmt.setString(5, member.getMemberEmail1());
			pstmt.setString(6, member.getMemberEmail2());
			pstmt.setString(7, member.getMemberPostcode());
			pstmt.setString(8, member.getMemberAddress1());
			pstmt.setString(9, member.getMemberAddress2());
			pstmt.setString(10, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Member idenMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member idenUser = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_ID=?, MEMBER_PWD=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				idenUser = new Member(rset.getString("MEMBER_NO"),
						   rset.getString("MEMBER_ADMIN"),
						   rset.getString("MEMBER_ID"),
						   rset.getString("MEMBER_PWD"),
						   rset.getString("MEMBER_NAME"),
						   rset.getString("MEMBER_PHONE1"),
						   rset.getString("MEMBER_PHONE2"),
						   rset.getString("MEMBER_PHONE3"),
						   rset.getString("MEMBER_EMAIL1"),
						   rset.getString("MEMBER_EMAIL2"),
						   rset.getString("MEMBER_POSTCODE"),
						   rset.getString("MEMBER_ADDRESS1"),
						   rset.getString("MEMBER_ADDRESS2"),
						   rset.getString("MEMBER_STATUS"),
						   rset.getInt("MEMBER_POINT"),
						   rset.getString("MEMBER_RANK")
						   );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return idenUser;
	}

	public Member inforMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member(rset.getString("MEMBER_NO"),
						   rset.getString("MEMBER_ADMIN"),
						   rset.getString("MEMBER_ID"),
						   rset.getString("MEMBER_PWD"),
						   rset.getString("MEMBER_NAME"),
						   rset.getString("MEMBER_PHONE1"),
						   rset.getString("MEMBER_PHONE2"),
						   rset.getString("MEMBER_PHONE3"),
						   rset.getString("MEMBER_EMAIL1"),
						   rset.getString("MEMBER_EMAIL2"),
						   rset.getString("MEMBER_POSTCODE"),
						   rset.getString("MEMBER_ADDRESS1"),
						   rset.getString("MEMBER_ADDRESS2"),
						   rset.getDate("MEMBER_JOINDATE"),
						   rset.getString("MEMBER_STATUS"),
						   rset.getString("MEMBER_EXIT"),
						   rset.getInt("MEMBER_POINT"),
						   rset.getString("MEMBER_RANK")
						   );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return member;
	}

	public int withdrawalMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE MEMBER SET MEMBER_STATUS='Y' WHERE MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		System.out.println("탈퇴dao"+result);
		return result;
	}

}
