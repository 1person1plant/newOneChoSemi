package order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import order.model.dao.OrderDao;
import order.model.vo.Order;
import order.model.vo.OrderHis;

public class OrderService {

	public ArrayList<Order> historyList(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList list = new OrderDao().historyList(conn, currentPage, limit);
		close(conn);
		return list;
	}

	public ArrayList<OrderHis> historyOrder(String memberNo) {
		Connection conn = getConnection();
		ArrayList<OrderHis> oh = new OrderDao().historyOrder(conn,memberNo);
//		System.out.println("OrderHis service"+oh);
		return oh;
	}

	public ArrayList<Order> insertOrderList(ArrayList<Order> orderItem, ArrayList<Order> orderBuyer) {
		Connection conn = getConnection();
		
		boolean result = new OrderDao().insertOrderList(conn, orderItem, orderBuyer);
				
				
		return null;
	}

}
