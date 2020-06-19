package visitor.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static common.JDBCTemplate.*;

public class VisitorDao {

	public int addIp(Connection conn, String ip, String id) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="INSERT INTO VISITOR VALUES(?,?,SYSDATE)";
		
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, ip);
			pstmt.setString(2, id);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
