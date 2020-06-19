package jsp.visit.model;
 
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;
 
/**
 * Visit 테이블의 DAO<br>
 * 방문자 관련 처리를 한다.
 */
public class VisitCountDAO 
{
    private static VisitCountDAO instance;
    
    // 싱글톤 패턴
    private VisitCountDAO(){}
    public static VisitCountDAO getInstance(){
        if(instance==null)
            instance=new VisitCountDAO();
        return instance;
    }
    
    /**
     * 총방문자수를 증가시킨다.
     */
    public void setTotalCount() {
    	Connection conn = getConnection();
        PreparedStatement pstmt = null;
        int result = 0;

        System.out.println("총 방문자 수 증가");
            
        // 쿼리생성
        // 총 방문자수를 증가시키기 위해 테이블에 현재 날짜 값을 추가시킨다.
        String query = "INSERT INTO VISIT (V_DATE) VALUES (SYSDATE)";
        
        try {
			pstmt = conn.prepareStatement(query);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
                        
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

    } // end setTotalCount()
    
    /**
     * 총 방문자수를 가져온다.
     * @return totalCount : 총 방문자 수
     */
    public int getTotalCount(){
    	Connection conn = getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int totalCount = 0;
        
        System.out.println("총 방문자 수 조회");
        
        try {
            
            // 테이블의 테이터 수를 가져온다.
            // 데이터 수 = 총 방문자 수
            String query = "SELECT COUNT(*) FROM VISIT";
            
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            
            // 방문자 수를 변수에 담는다.
            if (rs.next()) { 
                totalCount = rs.getInt(1);
            }
            System.out.println("dao 총 방문자수 : " + totalCount);

            
        } catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		close(conn);
        return totalCount;
    } // end getTotalCount()
    
    /**
     * 오늘 방문자 수를 가져온다.
     * @return todayCount : 오늘 방문자
     */
    public int getTodayCount(){
    	Connection conn = getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int todayCount = 0;

        System.out.println("오늘 방문자 수  조회");
        
        try {
        	String query = "SELECT COUNT(*) FROM VISIT " + 
        				   "WHERE TO_DATE(V_DATE, 'YYYY-MM-DD') = TO_DATE(sysdate, 'YYYY-MM-DD')";
            
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            
            // 방문자 수를 변수에 담는다.
            if (rs.next()) {
                todayCount = rs.getInt(1);
        	}
            System.out.println("dao 오늘 방문자수 : " + todayCount);
            
        } catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		close(conn);
        return todayCount;
    }// end getTodayCount()
}