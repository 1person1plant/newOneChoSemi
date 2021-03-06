package member.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import member.model.vo.Grade;
import member.model.vo.Member;
import order.model.vo.Order;

public class MemberDao {
	/**
	 * 로그인
	 * @param conn
	 * @param member
	 * @return
	 */
	public Member loginMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member loginUser = null;

		String query = "SELECT MEMBER_NO" + 
							", MEMBER_ADMIN" +
							", MEMBER_ID" + 
							", MEMBER_PWD" + 
							", MEMBER_NAME" + 
							", MEMBER_PHONE1" + 
							", MEMBER_PHONE2" + 
							", MEMBER_PHONE3" + 
							", MEMBER_EMAIL1" + 
							", MEMBER_EMAIL2" + 
							", MEMBER_POSTCODE" + 
							", MEMBER_ADDRESS1" + 
							", MEMBER_ADDRESS2" + 
							", MEMBER_STATUS" + 
							", MEMBER_POINT" + 
							", MEMBER_RANK" + 
						" FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_PWD=? AND MEMBER_STATUS = 'N'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginUser = new Member(rs.getString("MEMBER_NO"),
									   rs.getString("MEMBER_ADMIN"),
									   rs.getString("MEMBER_ID"),
									   rs.getString("MEMBER_PWD"),
									   rs.getString("MEMBER_NAME"),
									   rs.getString("MEMBER_PHONE1"),
									   rs.getString("MEMBER_PHONE2"),
									   rs.getString("MEMBER_PHONE3"),
									   rs.getString("MEMBER_EMAIL1"),
									   rs.getString("MEMBER_EMAIL2"),
									   rs.getString("MEMBER_POSTCODE"),
									   rs.getString("MEMBER_ADDRESS1"),
									   rs.getString("MEMBER_ADDRESS2"),
									   rs.getString("MEMBER_STATUS"),
									   rs.getInt("MEMBER_POINT"),
									   rs.getString("MEMBER_RANK")
									   );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return loginUser;
	}
	
	public int memberUpdate(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE MEMBER SET MEMBER_PWD=?,MEMBER_PHONE1=?,MEMBER_PHONE2=?,MEMBER_PHONE3=?,MEMBER_EMAIL1=?,MEMBER_EMAIL2=?,MEMBER_POSTCODE=?,MEMBER_ADDRESS1=?,MEMBER_ADDRESS2=? WHERE MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberPwd());
			pstmt.setString(2, member.getMemberPhone1());
			pstmt.setString(3, member.getMemberPhone2());
			pstmt.setString(4, member.getMemberPhone3());
			pstmt.setString(5, member.getMemberEmail1());
			pstmt.setString(6, member.getMemberEmail2());
			pstmt.setString(7, member.getMemberPostcode());
			pstmt.setString(8, member.getMemberAddress1());
			pstmt.setString(9, member.getMemberAddress2());
			pstmt.setString(10, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Member idenMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member idenUser = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_PWD=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				idenUser = new Member(rset.getString("MEMBER_NO"),
						   rset.getString("MEMBER_ADMIN"),
						   rset.getString("MEMBER_ID"),
						   rset.getString("MEMBER_PWD"),
						   rset.getString("MEMBER_NAME"),
						   rset.getString("MEMBER_PHONE1"),
						   rset.getString("MEMBER_PHONE2"),
						   rset.getString("MEMBER_PHONE3"),
						   rset.getString("MEMBER_EMAIL1"),
						   rset.getString("MEMBER_EMAIL2"),
						   rset.getString("MEMBER_POSTCODE"),
						   rset.getString("MEMBER_ADDRESS1"),
						   rset.getString("MEMBER_ADDRESS2"),
						   rset.getDate("MEMBER_JOINDATE"),
						   rset.getString("MEMBER_STATUS"),
						   rset.getString("MEMBER_EXIT"),
						   rset.getInt("MEMBER_POINT"),
						   rset.getInt("MEMBER_TOTALPURCHASEAMOUNT"),
						   rset.getString("MEMBER_RANK")
						   );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return idenUser;
	}

	public Member inforMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member(rset.getString("MEMBER_NO"),
						   rset.getString("MEMBER_ADMIN"),
						   rset.getString("MEMBER_ID"),
						   rset.getString("MEMBER_PWD"),
						   rset.getString("MEMBER_NAME"),
						   rset.getString("MEMBER_PHONE1"),
						   rset.getString("MEMBER_PHONE2"),
						   rset.getString("MEMBER_PHONE3"),
						   rset.getString("MEMBER_EMAIL1"),
						   rset.getString("MEMBER_EMAIL2"),
						   rset.getString("MEMBER_POSTCODE"),
						   rset.getString("MEMBER_ADDRESS1"),
						   rset.getString("MEMBER_ADDRESS2"),
						   rset.getDate("MEMBER_JOINDATE"),
						   rset.getString("MEMBER_STATUS"),
						   rset.getString("MEMBER_EXIT"),
						   rset.getInt("MEMBER_POINT"),
						   rset.getInt("MEMBER_TOTALPURCHASEAMOUNT"),
						   rset.getString("MEMBER_RANK")
						   );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return member;
	}

	public int withdrawalMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE MEMBER SET MEMBER_STATUS='Y' WHERE MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
//		System.out.println("탈퇴dao"+result);
		return result;
	}
	
	public int reasonMember(Connection conn, Member memberReason) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE MEMBER SET MEMBER_EXIT=?,MEMBER_STATUS='Y' WHERE MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberReason.getMemberExit()); 
			pstmt.setString(2, memberReason.getMemberId()); 
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// ----------------------------------- 아라
		/**
		 * 카카오 로그인 기능
		 * @param member
		 * @return
		 */
		public Member kakaoLoginMember(Connection conn, Member member) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Member loginUser = null;

			String query = "SELECT MEMBER_NO" + 
								", MEMBER_ADMIN" +
								", MEMBER_ID" + 
								", MEMBER_PWD" + 
								", MEMBER_NAME" + 
								", MEMBER_PHONE1" + 
								", MEMBER_PHONE2" + 
								", MEMBER_PHONE3" + 
								", MEMBER_EMAIL1" + 
								", MEMBER_EMAIL2" + 
								", MEMBER_POSTCODE" + 
								", MEMBER_ADDRESS1" + 
								", MEMBER_ADDRESS2" + 
								", MEMBER_STATUS" + 
								", MEMBER_POINT" + 
								", MEMBER_RANK" + 
							" FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_NAME=? AND MEMBER_STATUS = 'K'";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, member.getMemberId());
				pstmt.setString(2, member.getMemberName());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					loginUser = new Member(rs.getString("MEMBER_NO"),
										   rs.getString("MEMBER_ADMIN"),
										   rs.getString("MEMBER_ID"),
										   rs.getString("MEMBER_PWD"),
										   rs.getString("MEMBER_NAME"),
										   rs.getString("MEMBER_PHONE1"),
										   rs.getString("MEMBER_PHONE2"),
										   rs.getString("MEMBER_PHONE3"),
										   rs.getString("MEMBER_EMAIL1"),
										   rs.getString("MEMBER_EMAIL2"),
										   rs.getString("MEMBER_POSTCODE"),
										   rs.getString("MEMBER_ADDRESS1"),
										   rs.getString("MEMBER_ADDRESS2"),
										   rs.getString("MEMBER_STATUS"),
										   rs.getInt("MEMBER_POINT"),
										   rs.getString("MEMBER_RANK")
										   );
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return loginUser;
		}
		
		/**
		 * 회원가입
		 * @param member 회원가입을 한 회원 정보
		 * @return
		 */
		public int insertMember(Connection conn, Member member) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = "INSERT INTO MEMBER VALUES('M' || lpad(MNO_SEQ.NEXTVAL,5,0),'N', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, 'N', null, 1000, 0, 'R1')";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, member.getMemberId());
				pstmt.setString(2, member.getMemberPwd());
				pstmt.setString(3, member.getMemberName());
				pstmt.setString(4, member.getMemberPhone1());
				pstmt.setString(5, member.getMemberPhone2());
				pstmt.setString(6, member.getMemberPhone3());
				pstmt.setString(7, member.getMemberEmail1());
				pstmt.setString(8, member.getMemberEmail2());
				pstmt.setString(9, member.getMemberPostcode());
				pstmt.setString(10, member.getMemberAddress1());
				pstmt.setString(11, member.getMemberAddress2());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		/**
		 * 카카오 회원가입 
		 * @param member
		 * @return
		 */
		public int kakaoinsertMember(Connection conn, Member member) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = "INSERT INTO MEMBER VALUES('M' || lpad(MNO_SEQ.NEXTVAL,5,0), 'N', ?, null, ?, null, null, null, null, null, null, null, null, SYSDATE, 'K', null, 1000, 0, 'R1')";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, member.getMemberId());
				pstmt.setString(2, member.getMemberName());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		/**
		 * 아이디 중복체크
		 * @param id 회원가입시에 입력한 아이디
		 * <br> Count 쿼리문을 통해서 0이면 중복이 없고 1이면 중복이 있다만 체크
		 * @return
		 */
		public int joinIdChkMember(Connection conn, String userId) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int result = 0;
			
			String query = "SELECT COUNT(*) FROM MEMBER WHERE MEMBER_ID = ?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,userId);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			
			return result;
		}
		
		/**
		 * 아이디 찾기
		 * @param member 입력된 휴대폰 번호+이메일
		 * @return
		 */
		public Member searchIdMember(Connection conn, Member member) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Member searchId_A = null;
//			System.out.println("dao" + searchId_A);

			String query = "SELECT MEMBER_ID FROM MEMBER "
					+ "WHERE MEMBER_PHONE1 = ? AND MEMBER_PHONE2 = ? AND MEMBER_PHONE3 = ? AND MEMBER_EMAIL1 = ? AND MEMBER_EMAIL2 = ?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, member.getMemberPhone1());
				pstmt.setString(2, member.getMemberPhone2());
				pstmt.setString(3, member.getMemberPhone3());
				pstmt.setString(4, member.getMemberEmail1());
				pstmt.setString(5, member.getMemberEmail2());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					searchId_A = new Member( rs.getString("MEMBER_ID"));
				}	
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return searchId_A;
		}
		
		/**
		 * 비밀번호 찾기
		 * @param member 입력된 아이디 +이메일  
		 * @return
		 */
		public String searchPwdMember(Connection conn, Member member) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String searchPwd_A = null;
			
			String query = "SELECT MEMBER_PWD FROM MEMBER "
					+ "WHERE MEMBER_ID = ? AND MEMBER_EMAIL1 = ? AND MEMBER_EMAIL2 = ?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, member.getMemberId());
				pstmt.setString(2, member.getMemberEmail1());
				pstmt.setString(3, member.getMemberEmail2());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					searchPwd_A = rs.getString("MEMBER_PWD");
				}	
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return searchPwd_A;
		}
		
		/**
		 * 임시 비밀번호 발급받은 사용자 패스워드 업데이트
		 * @param changeMember
		 * @return
		 */
		public int pwdUpdate(Connection conn, Member changeMember) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = "UPDATE MEMBER SET MEMBER_PWD = ? WHERE MEMBER_ID = ?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, changeMember.getMemberPwd());
				pstmt.setString(2, changeMember.getMemberId());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}

			return result;
		}
//		------------------------------------------------ 아라
		
		public Grade memberGrade(Connection conn, String memberNo) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Grade grade = null;
			
			String query = "SELECT * FROM GRADECHK WHERE MEMBER_NO=?";
			
			try {
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, memberNo);
				
				rset=pstmt.executeQuery();
				if(rset.next()) {
					grade = new Grade(rset.getString("MEMBER_NO"),
									rset.getString("MEMBER_RANK"),
									rset.getInt("MEMBER_POINT"),
									rset.getInt("MEMBER_TOTALPURCHASEAMOUNT"));
					
					System.out.println("grade dao"+grade);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			
			return grade;
		}
	
		public int orderCompMemberPoint(Connection conn, ArrayList<Order> orderBuyer, int orderpaymentTotal) {
			PreparedStatement pstmt = null;
			int result = 0;
//			System.out.println("memberdao orderCompMemberPoint");
//			System.out.println("맴버 번호 : " + orderBuyer.get(0).getMemberNo());
//			System.out.println("맴버 지출 :  " + orderpaymentTotal);
//			System.out.println("맴버 적립 포인트 :  " + orderBuyer.get(0).getOrderAddPoint());
//			System.out.println("맴버 사용 포인트 :  " + orderBuyer.get(0).getOrderUsePoint());
			
			String query = "UPDATE (SELECT MEMBER_POINT MP, MEMBER_TOTALPURCHASEAMOUNT MT FROM MEMBER WHERE MEMBER_NO = ?) SET MT = MT + ?, MP = MP + ? - ?";
			
//			System.out.println("맴버 포인트 수정 쿼리 : " + query);
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, orderBuyer.get(0).getMemberNo());
				pstmt.setInt(2, orderpaymentTotal);
				pstmt.setInt(3, Integer.valueOf(orderBuyer.get(0).getOrderAddPoint()));
				pstmt.setInt(4, Integer.valueOf(orderBuyer.get(0).getOrderUsePoint()));
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
//			System.out.println("맴버 포인트 결과 : " + result);
			return result;
		}
		
		public int memberRankUpdate(Connection conn, ArrayList<Order> orderBuyer) {
			PreparedStatement pstmt = null;
			int result = 0;

			String query = "UPDATE MEMBER \r\n" + 
					"SET MEMBER_RANK = \r\n" + 
					"    CASE\r\n" + 
					"        WHEN (SELECT MEMBER_TOTALPURCHASEAMOUNT FROM MEMBER WHERE MEMBER_NO = ?)\r\n" + 
					"        BETWEEN (SELECT RANK_POINTMIN FROM RANK WHERE RANK_NO = 'R1') AND (SELECT RANK_POINTMAX FROM RANK WHERE RANK_NO = 'R1')\r\n" + 
					"        THEN 'R1'\r\n" + 
					"        WHEN (SELECT MEMBER_TOTALPURCHASEAMOUNT FROM MEMBER WHERE MEMBER_NO = ?)\r\n" + 
					"        BETWEEN (SELECT RANK_POINTMIN FROM RANK WHERE RANK_NO = 'R2') AND (SELECT RANK_POINTMAX FROM RANK WHERE RANK_NO = 'R2')\r\n" + 
					"        THEN 'R2'\r\n" + 
					"        WHEN (SELECT MEMBER_TOTALPURCHASEAMOUNT FROM MEMBER WHERE MEMBER_NO = ?)\r\n" + 
					"        BETWEEN (SELECT RANK_POINTMIN FROM RANK WHERE RANK_NO = 'R3') AND (SELECT RANK_POINTMAX FROM RANK WHERE RANK_NO = 'R3')\r\n" + 
					"        THEN 'R3'\r\n" + 
					"        WHEN (SELECT MEMBER_TOTALPURCHASEAMOUNT FROM MEMBER WHERE MEMBER_NO = ?)\r\n" + 
					"        BETWEEN (SELECT RANK_POINTMIN FROM RANK WHERE RANK_NO = 'R4') AND (SELECT RANK_POINTMAX FROM RANK WHERE RANK_NO = 'R5')\r\n" + 
					"        THEN 'R4'\r\n" + 
					"        WHEN (SELECT MEMBER_TOTALPURCHASEAMOUNT FROM MEMBER WHERE MEMBER_NO = ?)\r\n" + 
					"        BETWEEN (SELECT RANK_POINTMIN FROM RANK WHERE RANK_NO = 'R5') AND (SELECT RANK_POINTMAX FROM RANK WHERE RANK_NO = 'R5')\r\n" + 
					"        THEN 'R5'\r\n" + 
					"    END\r\n" + 
					"WHERE MEMBER_NO = ?";

			
//			System.out.println("맴버 번호 " + orderBuyer.get(0).getMemberNo());
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, orderBuyer.get(0).getMemberNo());
				pstmt.setString(2, orderBuyer.get(0).getMemberNo());
				pstmt.setString(3, orderBuyer.get(0).getMemberNo());
				pstmt.setString(4, orderBuyer.get(0).getMemberNo());
				pstmt.setString(5, orderBuyer.get(0).getMemberNo());
				pstmt.setString(6, orderBuyer.get(0).getMemberNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
//			System.out.println("등급업 했나? ");
		
			return result;
		}

		public Member loginSessionUpdateMember(Connection conn, String memberNo) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Member loginUser = null;

			String query = "SELECT MEMBER_NO, MEMBER_ADMIN, MEMBER_ID, MEMBER_PWD, MEMBER_NAME, MEMBER_PHONE1, MEMBER_PHONE2, MEMBER_PHONE3, MEMBER_EMAIL1, MEMBER_EMAIL2, MEMBER_POSTCODE, MEMBER_ADDRESS1, MEMBER_ADDRESS2, MEMBER_STATUS, MEMBER_POINT, MEMBER_RANK FROM MEMBER WHERE MEMBER_NO = ?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, memberNo);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					loginUser = new Member(rs.getString("MEMBER_NO"),
										   rs.getString("MEMBER_ADMIN"),
										   rs.getString("MEMBER_ID"),
										   rs.getString("MEMBER_PWD"),
										   rs.getString("MEMBER_NAME"),
										   rs.getString("MEMBER_PHONE1"),
										   rs.getString("MEMBER_PHONE2"),
										   rs.getString("MEMBER_PHONE3"),
										   rs.getString("MEMBER_EMAIL1"),
										   rs.getString("MEMBER_EMAIL2"),
										   rs.getString("MEMBER_POSTCODE"),
										   rs.getString("MEMBER_ADDRESS1"),
										   rs.getString("MEMBER_ADDRESS2"),
										   rs.getString("MEMBER_STATUS"),
										   rs.getInt("MEMBER_POINT"),
										   rs.getString("MEMBER_RANK")
										   );
				}
	//			System.out.println("MemberDao : " + loginUser);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return loginUser;
		}

}
