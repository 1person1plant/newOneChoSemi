package Board.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import static common.JDBCTemplate.*;

import Board.model.vo.Notice;
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

	public int updateAnswer(Connection conn, String qNum, String answer) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="UPDATE QNA SET QNA_ANSWER=?, QNA_YN='Y' WHERE QNA_NO=?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, answer);
			pstmt.setString(2, qNum);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Qna> searchQuestion(Connection conn, Map<String, String> list) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Qna> qnas=new ArrayList<>();
		
		String searchDate=list.get("searchDate");
		String date1=list.get("date1");
		String date2=list.get("date2");
		String findAnswer=list.get("findAnswer");
		String category=list.get("category");
		
		String query="SELECT * FROM V_QNA";
		
		int count=0;
		if(searchDate!="") {
			
			if(count==0) {
				query+=" WHERE ";
				query+="TO_DATE(TO_CHAR("+searchDate+",'YYYY-MM-DD')) BETWEEN TO_DATE('"+date1+"','YYYY-MM-DD') AND TO_DATE('"+date2+"','YYYY-MM-DD')";
				
			}
			
			count++;
			
		}
		
		if(findAnswer!=null) {
			
			if(count==0) {
				query+=" WHERE ";
				query+="QNA_YN="+"'"+findAnswer+"'";
			}else {
				query+=" AND ";
				query+="QNA_YN="+"'"+findAnswer+"'";
			}
			
			count++;
			
		}
		
		if(category!="") {
			
			if(count==0) {
				query+=" WHERE ";
				query+="ITEM_CATEGORY="+"'"+category+"'";
			}else {
				query+=" AND ";
				query+="ITEM_CATEGORY="+"'"+category+"'";
				
			}
			
			count++;
			
		}
		
		System.out.println(query);
		
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

	public ArrayList<Notice> selectAllNotice(Connection conn) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Notice> notices=new ArrayList<>();
		
		String query="SELECT * FROM V_NOTICE";
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				Notice n=new Notice(rset.getString("NOTICE_NO"),rset.getString("MEMBER_ID"),rset.getString("NOTICE_TITLE"),rset.getDate("NOTICE_CDATE")
						,rset.getString("NOTICE_CONTENT"),rset.getString("NOTICE_IMAGENAME"),rset.getString("NOTICE_IMAGEPATH"));
				
				
				notices.add(n);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return notices;
	}

	public int updateNotice(Connection conn, Notice n) {
		
		PreparedStatement pstmt=null;
		int result=0;
		String query="UPDATE NOTICE SET MEMBER_NO=?, NOTICE_TITLE=?, NOTICE_CDATE=SYSDATE, NOTICE_CONTENT=? WHERE NOTICE_NO=?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, n.getMemberNo());
			pstmt.setString(2, n.getNoticeTitle());
			pstmt.setString(3, n.getNoticeContent());
			pstmt.setString(4, n.getNoticeNo());
			
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int insertNotice(Connection conn, Notice n) {
		
		PreparedStatement pstmt=null;
		int result=0;
		String query="INSERT INTO NOTICE VALUES('N'||LPAD(NOTICE_SEQ.NEXTVAL,5,'0'),?,?,SYSDATE,?,null,null)";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, n.getMemberNo());
			pstmt.setString(2, n.getNoticeTitle());
			pstmt.setString(3, n.getNoticeContent());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int deleteNotice(Connection conn, String noticeNum) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="DELETE FROM NOTICE WHERE NOTICE_NO=?";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, noticeNum);
			
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
