package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import member.model.dao.RankDao;
import member.model.vo.Rank;

public class RankService {
	
	public Rank rankDetail(String userNo) {
		Connection conn = null;
		conn = getConnection();

		System.out.println("여기옴?dao");
		Rank rankDetail = new RankDao().rankDetail(conn, userNo);
		
		close(conn);
		return rankDetail;
	}

}
