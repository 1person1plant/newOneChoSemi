package order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import cartList.model.dao.CartDao;
import cartList.model.service.CartService;
import member.model.service.MemberService;
import order.model.dao.OrderDao;
import order.model.vo.Order;
import order.model.vo.OrderHis;
import static common.JDBCTemplate.*;
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

	public boolean insertOrderList(ArrayList<Order> orderItem, ArrayList<Order> orderBuyer, int orderpaymentTotal, String memberRank) {
		Connection conn = getConnection();
		int result2 = -1;
		int result3 = -1;
		boolean chk = false;
		
		// 주문 내역 db 저장
		boolean result = new OrderDao().insertOrderList(conn, orderItem, orderBuyer);
		
		if(result) {
			// 장바구니 삭제
			result2 = new CartService().orderCompDeleteCartList(orderItem, orderBuyer);
			if(result2 > 0) {
				System.out.println("구매한 카트 리스트 삭제 완료");
				// 사용자 포인트 누적
				result3 = new MemberService().orderCompMemberPoint(orderBuyer, orderpaymentTotal);
				if(result3 > 0) {
					System.out.println("맴버 포인트 적용 완료");
					// 멤버 등급 조정 
					new MemberService().memberRankUpdate(orderBuyer);
					System.out.println("맴버 포인트 적용 성공?!");
					chk = true;
					commit(conn);
				} else {
					rollback(conn);
					System.out.println("맴버 포인트 적용 실패");
				}
			} else {
				rollback(conn);
				System.out.println("카트 삭제 실패");
			}
		} else {
			rollback(conn);
			System.out.println("구매 실패");
		}

		
		close(conn);
		return chk;
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

	public ArrayList<OrderHis> cancelHistory(String memberNo) {
		Connection conn = getConnection();
		ArrayList<OrderHis> ohcancel = new OrderDao().cancelHistory(conn,memberNo);
//		System.out.println("ohcancel service"+ohcancel);
		return ohcancel;
	}

	public int chkPostcode(String postcode) {
		Connection conn = getConnection();

		int result = new OrderDao().chkPostcode(conn, postcode);
		
		if(result < 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
