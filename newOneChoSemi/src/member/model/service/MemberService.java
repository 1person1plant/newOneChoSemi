package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDao;
import member.model.vo.Grade;
import member.model.vo.Member;
import order.model.vo.Order;
import member.model.vo.MyWishList;

public class MemberService {
	/**
	 * loginMember 로그인기능
	 * @param member 로그인한 회원 정보
	 * @return
	 */
	public Member loginMember(Member member) {
		Connection conn = null;
		conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, member);
		
		close(conn);
		return loginUser;
	}

	public int memberUpdate(Member member) {
		Connection conn = null;
		conn = getConnection();
		
		int result = new MemberDao().memberUpdate(conn, member);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public Member idenMember(Member member) {
		Connection conn = getConnection();
		Member idenUser = new MemberDao().idenMember(conn, member);
		System.out.println("service"+idenUser);
		close(conn);
		return idenUser;
	}

	public Member inforMember(String memberId) {
		Connection conn = getConnection();
		Member member = new MemberDao().inforMember(conn, memberId);
		close(conn);
		return member;
	}

	public int withdrawalMember(String memberId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().withdrawalMember(conn,memberId);
//		System.out.println("탈퇴 service"+ result);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int reasonMember(Member memberReason) {
		Connection conn = getConnection();
		
		int result = new MemberDao().reasonMember(conn, memberReason);
		
		if(result>0) {
			commit(conn);
		}else {
			close(conn);
		}
		close(conn);
		return result;
	}
	
	// ------------------------------------ 아라
	/**
	 * 카카오 로그인 기능
	 * @param member
	 * @return
	 */
	public Member kakaoLoginMember(Member member) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().kakaoLoginMember(conn, member);
		
		close(conn);
		return loginUser;
	}

	/**
	 * 회원가입
	 * @param member 회원가입을 한 회원 정보
	 * @return
	 */
	public int insertMember(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn,member);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	/**
	 * 카카오 회원가입 
	 * @param memberName 
	 * @param userId 
	 * @param member
	 * @return
	 */
	public int kakaoinsertMember(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDao().kakaoinsertMember(conn,member);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	/**
	 * 아이디 중복체크
	 * @param id 회원가입시에 입력한 아이디
	 * <br> Count 쿼리문을 통해서 0이면 중복이 없고 1이면 중복이 있다만 체크
	 * @return
	 */
	public int joinIdChkMember(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().joinIdChkMember(conn, userId);
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 아이디 찾기
	 * @param memberAddress2 
	 * @param memberAddress1 
	 * @param memberPhone3 
	 * @param memberPhone2 
	 * @param searchId_A 입력된 휴대폰 번호+이메일
	 * @return 
	 */
	public Member searchIdMember(Member member) {
		Connection conn = getConnection();
		
		Member searchId_A = new MemberDao().searchIdMember(conn, member);
		
		close(conn);
		return searchId_A;
	}
	
	/**
	 * 비밀번호 찾기
	 * @param member 입력된 아이디 +이메일 
	 * @return
	 */
	public String searchPwdMember(Member member) {
		Connection conn = getConnection();
		
		String searchPwd_A = new MemberDao().searchPwdMember(conn, member);

		close(conn);
		return searchPwd_A;
	}
	
	/**
	 * 임시 비밀번호 발급받은 사용자 패스워드 업데이트
	 * @param changeMember
	 * @return
	 */
	public int pwdUpdate(Member changeMember) {
		Connection conn = getConnection();
		
		int result = new MemberDao().pwdUpdate(conn, changeMember);

		close(conn);
		return result;
	}
//	------------------------------------------------ 아라
	
	public Grade memberGrade(String memberNo) {
		Connection conn = getConnection();
		Grade grade = new MemberDao().memberGrade(conn,memberNo);
		System.out.println("dao>service : " + grade);
		close(conn);
		return grade;
	}

	public int orderCompMemberPoint(ArrayList<Order> orderBuyer, int orderpaymentTotal) {
		Connection conn = getConnection();
		int result = new MemberDao().orderCompMemberPoint(conn, orderBuyer, orderpaymentTotal);
		
		close(conn);
		return result;
	}

	public void memberRankUpdate(ArrayList<Order> orderBuyer) {
		Connection conn = getConnection();
		new MemberDao().memberRankUpdate(conn, orderBuyer);
		
		close(conn);
	}

	public Member loginSessionUpdateMember(String memberNo) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginSessionUpdateMember(conn, memberNo);
		
		close(conn);
		return loginUser;
	}


}
