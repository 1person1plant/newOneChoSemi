package member.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {

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

	

}
