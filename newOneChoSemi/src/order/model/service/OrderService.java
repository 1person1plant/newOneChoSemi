package order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import order.model.dao.OrderDao;
import order.model.vo.Order;

public class OrderService {

	public int orderComp(ArrayList<Order> orderComp) {
		Connection conn = null;
		conn = getConnection();

		int result = new OrderDao().orderComp(conn, orderComp);
		
		close(conn);
		return result;
	}

}
