package order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import order.model.dao.OrderDao;
import order.model.vo.Order;

public class OrderService {

	/*광산코드
	 * public int orderComp(ArrayList<Order> orderComp) { Connection conn = null;
	 * conn = getConnection();
	 * 
	 * int result = new OrderDao().orderComp(conn, orderComp);
	 * 
	 * close(conn); return result; }
	 */

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new OrderDao().getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Order> historyList(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList list = new OrderDao().historyList(conn, currentPage, limit);
		close(conn);
		return list;
	}

}
