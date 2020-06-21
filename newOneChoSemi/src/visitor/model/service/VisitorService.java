package visitor.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import visitor.model.dao.VisitorDao;

public class VisitorService {

	public int addIp(String ip, String id) {
		
		Connection conn=getConnection();
		
		int result=new VisitorDao().addIp(conn,ip,id);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
