package statistic.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import statistic.model.vo.Statistic;

public class StatDao {

	public ArrayList<Statistic> selectSales(Connection conn) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Statistic> sales=new ArrayList<>();
		
		String query="SELECT * FROM V_SALE_MONTHLY";
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				Statistic s=new Statistic(rset.getString("ORDER_DATE"),rset.getInt("sales"));
				
				sales.add(s);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return sales;
	}

	public Statistic selectStatistic(Connection conn) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Statistic stat=null;
		
		String query="SELECT * FROM V_STATISTIC";
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				
				
				stat=new Statistic(rset.getInt("newVisit"),rset.getInt("dBefore"),rset.getInt("cancel"),rset.getInt("newOrder"),
						rset.getInt("newMember"),rset.getInt("allMember"),rset.getInt("newSale"),rset.getInt("weekSale"),
						rset.getInt("amonthSale"),rset.getInt("newQna"),rset.getInt("unAnsw"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return stat;
	}

}
