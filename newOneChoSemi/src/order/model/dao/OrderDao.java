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
			// TODO Auto-generated catch block
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
											rset.getString("MEMBER_NO"));
				
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
		PreparedStatement pstmt = null;
		int result = 0;
		boolean chk = true;

		// 첫상품 쿼리
		String query1 = "INSERT INTO ODERDERLIST "
					  + "VALUES('O'||LPAD(ORDERLIST_SEQ.NEXTVAL,5,'0'),?,?,SYSDATE"
					  + ",?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?"
					  + ",DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
		// 두번째 이후 쿼리
		String query2 = "INSERT INTO ODERDERLIST "
					  + "VALUES('O'||LPAD(ORDERLIST_SEQ.QURRVAL,5,'0'),?,?,SYSDATE"
				      + ",?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,null,null,?"
				      + ",DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";

		for(int i = 0 ; i < orderItem.size() ; i++) {
			
			try {
				if(i == 0) {
					pstmt = conn.prepareStatement(query1);
				} else {
					pstmt = conn.prepareStatement(query2);
				}
				
				pstmt.setString(1, orderItem.get(i).getItemNo());
				pstmt.setString(2, orderBuyer.get(i).getMemberNo());
				pstmt.setString(3, orderItem.get(i).getOrderItemName());
				pstmt.setString(4, orderItem.get(i).getOrderItemImgName());
				pstmt.setString(5, orderItem.get(i).getOrderItemImgPath());
				pstmt.setInt(6, orderItem.get(i).getOrderItemPrice());
				pstmt.setInt(7, orderItem.get(i).getOrderItemDiscount());
				pstmt.setInt(8, orderItem.get(i).getOrderCount());
				pstmt.setInt(9, orderItem.get(i).getOrderUsePoint());
				pstmt.setString(10, orderBuyer.get(i).getOrderName());
				pstmt.setString(11, orderBuyer.get(i).getOrderPhone1());
				pstmt.setString(12, orderBuyer.get(i).getOrderPhone2());
				pstmt.setString(13, orderBuyer.get(i).getOrderPhone3());
				pstmt.setString(14, orderBuyer.get(i).getOrderPostcode());
				pstmt.setString(15, orderBuyer.get(i).getOrderAddress1());
				pstmt.setString(16, orderBuyer.get(i).getOrderAddress2());
				pstmt.setString(17, orderBuyer.get(i).getOrderRequest());
				
				if(i == 0) {
					pstmt.setInt(18, orderBuyer.get(i).getOrderDCost());
					pstmt.setInt(19, orderBuyer.get(i).getOrderAddPoint());
				} else {
					pstmt.setInt(18, 0);
					pstmt.setInt(19, 0);

				}
				
				
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
		
		return chk;
	}

}
