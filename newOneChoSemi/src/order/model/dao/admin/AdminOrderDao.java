package order.model.dao.admin;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import static common.JDBCTemplate.*;

import order.model.vo.Order;
import order.model.vo.admin.AdminOrder;

public class AdminOrderDao {

	public ArrayList<AdminOrder> selectAllOrders(Connection conn) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<AdminOrder> orders=new ArrayList<>();
		
		String query="SELECT * FROM V_ADMIN_ORDERLIST WHERE ORDER_CANCELYN='N'";
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
			
				AdminOrder order=new AdminOrder(rset.getString("ORDER_NO"),rset.getDate("ORDER_DATE"),rset.getString("ITEM_NO"),rset.getString("ITEM_NAME")
						,rset.getString("PAYMENT_STATUS"),rset.getString("ORDER_CANCELREQUEST"),rset.getString("DELIVERY_STATUS"),rset.getInt("ORDER_COUNT")
						,rset.getString("MEMBER_ID"));
				
				orders.add(order);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return orders;
	}

	public int updateOrder(Connection conn, ArrayList<Order> orders) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="UPDATE ORDERLIST SET PAYMENT_CODE=?, DELIVERY_CODE=? WHERE ORDER_NO=? AND ITEM_NO=?";
		
		try {
			
			for(int i=0;i<orders.size();i++) {
				
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,orders.get(i).getPaymentCode());
			pstmt.setString(2,orders.get(i).getDeliveryCode());
			pstmt.setString(3,orders.get(i).getOrderNo());
			pstmt.setString(4,orders.get(i).getItemNo());
			
			result+=pstmt.executeUpdate();
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int deleteOrder(Connection conn, String orderNum, String itemNum) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="UPDATE ORDERLIST SET ORDER_CANCELYN='Y' WHERE ORDER_NO=? AND ITEM_NO=?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, orderNum);
			pstmt.setString(2, itemNum);
			
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<AdminOrder> searchOrders(Connection conn, Map<String, String> list) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<AdminOrder> orders=new ArrayList<>();
		
		String searchDate=list.get("searchDate");
		String date1=list.get("date1");
		String date2=list.get("date2");
		String delivery=list.get("delivery");
		String payment=list.get("payment");
		String cancel=list.get("cancel");
		
		String query="SELECT * FROM V_ADMIN_ORDERLIST";
		
		int count=0;
		if(searchDate!="") {
			
			if(count==0) {
				
				query+=" WHERE ";
				query+="TO_DATE(TO_CHAR("+searchDate+",'YYYY-MM-DD')) BETWEEN TO_DATE('"+date1+"','YYYY-MM-DD') AND TO_DATE('"+date2+"','YYYY-MM-DD')";
			}
			
			count++;
			
		}
		
		if(delivery!=null) {
			
			if(count==0) {
				query+=" WHERE ";
				query+="DELIVERY_STATUS="+"'"+delivery+"'";
			}else {
				query+=" AND ";
				query+="DELIVERY_STATUS="+"'"+delivery+"'";
			}
			
			count++;
			
		}
		
		if(payment!=null) {
			
			if(count==0) {
				query+=" WHERE ";
				query+="PAYMENT_STATUS="+"'"+payment+"'";
			}else {
				query+=" AND ";
				query+="PAYMENT_STATUS="+"'"+payment+"'";
			}
			
			count++;
			
		}
		
		if(cancel!=null) {
			
			if(count==0) {
				query+=" WHERE ";
				query+="ORDER_CANCELREQUEST="+"'"+cancel+"'";
			}else {
				query+=" AND ";
				query+="ORDER_CANCELREQUEST="+"'"+cancel+"'";
			}
			
			count++;
			
		}
		
		System.out.println(query);
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				AdminOrder order=new AdminOrder(rset.getString("ORDER_NO"),rset.getDate("ORDER_DATE"),rset.getString("ITEM_NO"),rset.getString("ITEM_NAME")
						,rset.getString("PAYMENT_STATUS"),rset.getString("ORDER_CANCELREQUEST"),rset.getString("DELIVERY_STATUS"),rset.getInt("ORDER_COUNT")
						,rset.getString("MEMBER_ID"));
				
				orders.add(order);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			close(rset);
		}
		
		
		
		return orders;
	}

	

}
