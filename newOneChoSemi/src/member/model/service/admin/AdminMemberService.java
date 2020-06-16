package member.model.service.admin;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import member.model.dao.admin.AdminMemberDao;
import member.model.vo.admin.AdminMember;
import static common.JDBCTemplate.*;

public class AdminMemberService {

	public ArrayList<AdminMember> selectAllMember() {
		
		Connection conn=getConnection();
		ArrayList<AdminMember> members=new AdminMemberDao().selectAllMember(conn);
		
		close(conn);
		return members;
	}

	public int updateMember(String memberNo, String rank, int point) {
		
		Connection conn=getConnection();
		int result=new AdminMemberDao().updateMember(conn,memberNo,rank,point);
		
		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int grantAdmin(String admin, String memNo) {
		
		Connection conn=getConnection();
		int result=new AdminMemberDao().grantAdmin(conn,admin,memNo);
		
		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<AdminMember> searchMember(Map<String, String> list) {
		
		Connection conn=getConnection();
		ArrayList<AdminMember> members=new AdminMemberDao().searchMember(conn,list);
		
		
		close(conn);
		return members;
	}

}
