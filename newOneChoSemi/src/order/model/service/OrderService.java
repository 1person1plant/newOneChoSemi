package order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import order.model.dao.OrderDao;
import order.model.vo.Order;
import order.model.vo.OrderHis;
import static common.JDBCTemplate.*;
public class OrderService {

	/*광산코드
	 * public int orderComp(ArrayList<Order> orderComp) { Connection conn = null;
	 * conn = getConnection();
	 * 
	 * int result = new OrderDao().orderComp(conn, orderComp);
	 * 
	 * close(conn); return result; }
	 */


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

	public int cancelRequest(Order order) {
		Connection conn = getConnection();
		int result = new OrderDao().cancelRequest(conn,order);
		System.out.println("dao>service : " + result);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
