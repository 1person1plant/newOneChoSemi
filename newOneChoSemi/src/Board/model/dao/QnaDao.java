package Board.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import Board.model.vo.Qna;

public class QnaDao {

	public ArrayList<Qna> selectAllQna(Connection conn) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Qna> qnas=new ArrayList<>();
		
		String query="SELECT * FROM V_QNA";
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				
				Qna qna=new Qna(rset.getString("QNA_NO"),rset.getString("MEMBER_ID"),rset.getString("QNA_TITLE"),rset.getDate("QNA_CDATE"),
						rset.getString("QNA_CONTENT"),rset.getString("QNA_ANSWER"),rset.getString("QNA_CATEGORY"),rset.getString("QNA_PASSWORD"),
						rset.getString("QNA_YN"),rset.getString("QNA_IMAGENAME"),rset.getString("QNA_IMAGEPATH"));
				
				qnas.add(qna);
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return qnas;
	}

	public int insertQuestion(Connection conn, Qna q) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="INSERT INTO QNA VALUES('Q'||LPAD(QNA_SEQ.NEXTVAL,5,'0'),?,?,SYSDATE,?,NULL,?,?,'N',NULL,NULL)";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, q.getMemberId());
			pstmt.setString(2, q.getQnaTitle());
			pstmt.setString(3, q.getQnaContent());
			pstmt.setString(4, q.getQnaCategory());
			pstmt.setString(5, q.getQnaPassword());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int deleteQuestion(Connection conn, String qNum) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="DELETE FROM QNA WHERE QNA_NO=?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, qNum);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
