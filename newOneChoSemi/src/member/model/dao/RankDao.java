package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.model.vo.Rank;

import static common.JDBCTemplate.close;

public class RankDao {

	public Rank rankDetail(Connection conn, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Rank rankDetail = null;

		String query = "SELECT * FROM RANK JOIN (SELECT MEMBER_RANK FROM MEMBER WHERE MEMBER_NO = ?) ON (MEMBER_RANK = RANK_NO)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rankDetail = new Rank(rs.getString("RANK_NO"),
									   rs.getString("RANK_NAME"),
									   rs.getInt("RANK_POINTRAT"),
									   rs.getInt("RANK_POINTCAP"),
									   rs.getInt("RANK_POINTCAP"),
									   rs.getInt("RANK_POINTCAP")
									   );
			}
//			System.out.println("RankDao rankDetail : " + rankDetail);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return rankDetail;
	}
}
