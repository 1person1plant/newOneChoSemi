package member.model.service;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;

public class MemberService {

	public Member loginMember(Member member) {
		Connection conn = null;
		conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, member);
		
		close(conn);
		return loginUser;
	}

}
