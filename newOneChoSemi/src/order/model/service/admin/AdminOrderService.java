package order.model.service.admin;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;


import order.model.dao.admin.AdminOrderDao;
import order.model.vo.Order;
import order.model.vo.admin.AdminOrder;
import static common.JDBCTemplate.*;

public class AdminOrderService {

	public ArrayList<AdminOrder> selectAllOrders() {
		
		Connection conn=getConnection();
		ArrayList<AdminOrder> orders=new AdminOrderDao().selectAllOrders(conn);
		
		
		close(conn);
		return orders;
	}

	public int updateOrder(ArrayList<Order> orders) {
		
		Connection conn=getConnection();
		int result=new AdminOrderDao().updateOrder(conn,orders);
		
		close(conn);
		return result;
	}

	public int deleteOrder(String orderNum, String itemNum) {
		
		Connection conn=getConnection();
		int result=new AdminOrderDao().deleteOrder(conn,orderNum,itemNum);
		
		close(conn);
		return result;
	}

	public ArrayList<AdminOrder> searchOrders(Map<String, String> list) {
		
		Connection conn=getConnection();
		ArrayList<AdminOrder> orders=new AdminOrderDao().searchOrders(conn,list);
		
		close(conn);
		return orders;
	}

}
