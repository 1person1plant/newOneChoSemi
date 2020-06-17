package order.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import order.model.vo.Order;
import order.model.vo.OrderHis;

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



	public ArrayList<OrderHis> historyOrder(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OrderHis> oh = new ArrayList<>();
		
		String query = "SELECT * FROM ORDERHIS WHERE MEMBER_NO=? AND ORDER_CANCELYN='N'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				OrderHis ohlist = new OrderHis(rset.getString("ORDER_NO"),
											rset.getString("IMAGE_NAME"),
											rset.getString("ITEM_NO"),
											rset.getString("ITEM_NAME"),
											rset.getInt("ORDER_COUNT"),
											rset.getString("DELIVERY_STATUS"),
											rset.getString("MEMBER_NO"),
											rset.getString("ORDER_CANCELREQUEST"),
											rset.getString("ORDER_CANCELYN"));
				
				System.out.println("OrderHis dao"+oh);
				oh.add(ohlist);
				System.out.println("oh.size() : " +oh.size());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return oh;
	}

	public int cancelRequest(Connection conn, Order order) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "UPDATE ORDERLIST SET ORDER_CANCELREQUEST='Y' WHERE DELIVERY_CODE ='D1' AND ORDER_NO=? AND ITEM_NO=? AND MEMBER_NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, order.getOrderNo());
			pstmt.setString(2, order.getItemNo());
			pstmt.setString(3, order.getMemberNo());
			result = pstmt.executeUpdate();
			System.out.println("dao : "+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<OrderHis> cancelHistory(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OrderHis> ohcancel = new ArrayList<>();
		
		String query = "SELECT * FROM ORDERHIS WHERE MEMBER_NO=? AND ORDER_CANCELYN='Y'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				OrderHis ohlist = new OrderHis(rset.getString("ORDER_NO"),
											rset.getString("IMAGE_NAME"),
											rset.getString("ITEM_NO"),
											rset.getString("ITEM_NAME"),
											rset.getString("MEMBER_NO"),
											rset.getString("ORDER_CANCELYN"));
				System.out.println("cancelList dao"+ohcancel);
				ohcancel.add(ohlist);
				System.out.println("oh.size() : " +ohcancel.size());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return ohcancel;
	}

}
