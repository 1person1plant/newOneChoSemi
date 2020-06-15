package order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import cartList.model.service.CartService;
import member.model.service.MemberService;
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
		
		close(conn);
		return oh;
	}

	public boolean insertOrderList(ArrayList<Order> orderItem, ArrayList<Order> orderBuyer, int orderpaymentTotal) {
		Connection conn = getConnection();
		int result2 = -1;
		int result3 = -1;
		boolean chk = false;
		
		boolean result = new OrderDao().insertOrderList(conn, orderItem, orderBuyer);
		
		if(result) {
			result2 = new CartService().orderCompDeleteCartList(orderItem, orderBuyer);
			if(result2 > 0) {
				result3 = new MemberService().orderCompMemberPoint(orderBuyer, orderpaymentTotal);
				if(result3 > 0) {
					chk = true;
					commit(conn);
				} else {
					rollback(conn);
				}
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}

		// 멤버 등급 조정 
		new MemberService().memberRankUpdate();
		
		close(conn);
		return chk;
	}

}
