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
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public ArrayList<OrderHis> historyOrder(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OrderHis> oh = new ArrayList<>();
		
		String query = "SELECT * FROM ORDERHIS WHERE MEMBER_NO=?";
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
											rset.getString("ORDER_CANCELREQUEST"));
				
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

	public boolean insertOrderList(Connection conn, ArrayList<Order> orderItem, ArrayList<Order> orderBuyer) {
		String query = "";
		int result = -1;
		boolean chk = true;
		
		//System.out.println("주문 완료 쿼리 시작한다 : " + orderItem.size());

		// 첫상품 쿼리
		String query1 = "INSERT INTO ORDERLIST (ORDER_NO, ITEM_NO, MEMBER_NO, ORDER_DATE"
					  + ", ORDER_ITEMNAME, ORDER_ITEMIMGNAME, ORDER_ITEMIMGPATH"
					  + ", ORDER_ITEMPRICE, ORDER_ITEMDISCOUNT, ORDER_COUNT, ORDER_USEPOINT, ORDER_NAME" 
					  + ", ORDER_PHONE1, ORDER_PHONE2, ORDER_PHONE3, ORDER_POSTCODE, ORDER_ADDRESS1"
					  + ", ORDER_ADDRESS2, ORDER_REQUEST, ORDER_DCOST, ORDER_ADDPOINT, ORDER_PAYMENTOPTION"
					  + ", ORDER_REIEW, ORDER_CANCELREQUEST, ORDER_CANCELYN, DELIVERY_CODE, PAYMENT_CODE) "
					  + "VALUES('O'||LPAD(ORDERLIST_SEQ.NEXTVAL,5,'0'),?,?,SYSDATE" 
					  + ",?,?,?"
					  + ",?,?,?,?,?"
					  + ",?,?,?,?,?"
					  + ",?,?,?,?,?" 
					  + ",DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
		// 두번째 이후 쿼리
		String query2 = "INSERT INTO ORDERLIST (ORDER_NO, ITEM_NO, MEMBER_NO, ORDER_DATE"
					  + ", ORDER_ITEMNAME, ORDER_ITEMIMGNAME, ORDER_ITEMIMGPATH"
					  + ", ORDER_ITEMPRICE, ORDER_ITEMDISCOUNT, ORDER_COUNT, ORDER_USEPOINT, ORDER_NAME" 
					  + ", ORDER_PHONE1, ORDER_PHONE2, ORDER_PHONE3, ORDER_POSTCODE, ORDER_ADDRESS1"
					  + ", ORDER_ADDRESS2, ORDER_REQUEST, ORDER_DCOST, ORDER_ADDPOINT, ORDER_PAYMENTOPTION"
					  + ", ORDER_REIEW, ORDER_CANCELREQUEST, ORDER_CANCELYN, DELIVERY_CODE, PAYMENT_CODE) "
					  + "VALUES('O'||LPAD(ORDERLIST_SEQ.CURRVAL,5,'0'),?,?,SYSDATE" 
					  + ",?,?,?"
					  + ",?,?,?,?,?"
					  + ",?,?,?,?,?"
					  + ",?,?,?,?,?" 
					  + ",DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
			
		for(int i = 0 ; i < orderItem.size() ; i++) {
			PreparedStatement pstmt = null;
			try {
				if(i == 0) {
					query = query1;
				} else {
					query = query2;
				}
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, orderItem.get(i).getItemNo());
				pstmt.setString(2, orderBuyer.get(0).getMemberNo());
				pstmt.setString(3, orderItem.get(i).getOrderItemName());
				pstmt.setString(4, orderItem.get(i).getOrderItemImgName());
				pstmt.setString(5, orderItem.get(i).getOrderItemImgPath());
				pstmt.setInt(6, orderItem.get(i).getOrderItemPrice());
				pstmt.setInt(7, orderItem.get(i).getOrderItemDiscount());
				pstmt.setInt(8, orderItem.get(i).getOrderCount());
				pstmt.setInt(9, orderItem.get(i).getOrderUsePoint());
				pstmt.setString(10, orderBuyer.get(0).getOrderName());
				pstmt.setString(11, orderBuyer.get(0).getOrderPhone1());
				pstmt.setString(12, orderBuyer.get(0).getOrderPhone2());
				pstmt.setString(13, orderBuyer.get(0).getOrderPhone3());
				pstmt.setString(14, orderBuyer.get(0).getOrderPostcode());
				pstmt.setString(15, orderBuyer.get(0).getOrderAddress1());
				pstmt.setString(16, orderBuyer.get(0).getOrderAddress2());
				pstmt.setString(17, orderBuyer.get(0).getOrderRequest());
				
				if(i == 0) {
					pstmt.setInt(18, orderBuyer.get(0).getOrderDCost());
					pstmt.setInt(19, orderBuyer.get(0).getOrderAddPoint());
				} else {
					pstmt.setInt(18, 0);
					pstmt.setInt(19, 0);
				}
				pstmt.setString(20, orderBuyer.get(0).getOrderPaymentOption());
				
				result = pstmt.executeUpdate();
				
				if(result > 0 && chk == true) {
					chk = true;
				} else {
					chk = false;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		
		// System.out.println("주문 완료 끝 : " + chk);
		return chk;
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
	
}
