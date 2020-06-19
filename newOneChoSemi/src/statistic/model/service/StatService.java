package statistic.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import statistic.model.dao.StatDao;
import statistic.model.vo.Statistic;

public class StatService {

	public ArrayList<Statistic> selectSales() {
		
		Connection conn=getConnection();
		
		ArrayList<Statistic> sales=new StatDao().selectSales(conn);
		
		
		close(conn);
		return sales;
	}

	public Statistic selectStatistic() {
		
		Connection conn=getConnection();
		
		Statistic stat=new StatDao().selectStatistic(conn);
		
		close(conn);
		return stat;
	}

}
