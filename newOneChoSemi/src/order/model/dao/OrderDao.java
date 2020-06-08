package order.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import order.model.vo.Order;

import static common.JDBCTemplate.close;

public class OrderDao {

	public int orderComp(Connection conn, ArrayList<Order> orderComp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "";
		
		try {
			for(int i = 0 ; i < orderComp.size() ; i++) {
				Order or = orderComp.get(i);

				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, or.getItemNo());	
				pstmt.setString(2, or.getItemName());	
				pstmt.setInt(3, or.getItemPrice());
				// TODO 더 추가해야함
				
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}
