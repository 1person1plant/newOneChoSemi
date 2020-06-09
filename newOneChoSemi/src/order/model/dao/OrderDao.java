package order.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import order.model.vo.Order;

import static common.JDBCTemplate.close;

public class OrderDao {

	/* 광산코드
	 * public int orderComp(Connection conn, ArrayList<Order> orderComp) {
	 * PreparedStatement pstmt = null; int result = 0;
	 * 
	 * String query = "";
	 * 
	 * try { for(int i = 0 ; i < orderComp.size() ; i++) { Order or =
	 * orderComp.get(i);
	 * 
	 * pstmt = conn.prepareStatement(query); pstmt.setString(1, or.getItemNo());
	 * pstmt.setString(2, or.getItemName()); pstmt.setInt(3, or.getItemPrice()); //
	 * TODO 더 추가해야함
	 * 
	 * 
	 * result += pstmt.executeUpdate(); }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(pstmt); }
	 * 
	 * return result; }
	 */

	public int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "SELECT COUNT(*) FROM ORDERLIST";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public ArrayList historyList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList list = new ArrayList();
		
		int ohStart = (currentPage-1)*limit + 1;
		int ohEnd = currentPage * limit;
		String query = "SELECT * FROM (SELECT ROWNUM OREDER_NO, O.* FROM ORDERLIST O) WHERE BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, ohStart);
			pstmt.setInt(2, ohEnd);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Order o = new Order(rset.getString("ORDER_NO"),
									rset.getString("ITEM_NO"),
									rset.getString("MEMBER_NO"),
									rset.getDate("ORDER_DATE"),
									rset.getInt("ORDER_COUNT"),
									rset.getInt("ORDER_USEPOINT"),
									rset.getString("ORDER_NAME"),
									rset.getString("ORDER_PHONE1"),
									rset.getString("ORDER_PHONE2"),
									rset.getString("ORDER_PHONE3"),
									rset.getString("ORDER_POSTCODE"),
									rset.getString("ORDER_ADDRESS1"),
									rset.getString("ORDER_ADDRESS2"),
									rset.getString("ORDER_REQUEST"),
									rset.getInt("ORDER_DCOST"),
									rset.getString("ORDER_CANCELREQUEST"),
									rset.getString("ORDER_CANCELYN"),
									rset.getString("DELIVERY_CODE"),
									rset.getString("PAYMENT_CODE"));
				list.add(o);			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

}
