package Board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import Board.model.dao.QnaDao;
import Board.model.vo.Notice;
import Board.model.vo.Qna;

public class QnaService {

	public ArrayList<Qna> selectAllQna() {
		
		Connection conn=getConnection();
		ArrayList<Qna> qnas=new QnaDao().selectAllQna(conn);
		
		close(conn);
		return qnas;
	}

	public int insertQuestion(Qna q) {
		
		Connection conn=getConnection();
		int result=new QnaDao().insertQuestion(conn,q);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public int deleteQuestion(String qNum) {
		
		Connection conn=getConnection();
		int result=new QnaDao().deleteQuestion(conn,qNum);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public int updateAnswer(String qNum, String answer) {
		
		Connection conn=getConnection();
		int result=new QnaDao().updateAnswer(conn,qNum,answer);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public ArrayList<Qna> searchQuestion(Map<String, String> list) {
		
		Connection conn=getConnection();
		ArrayList<Qna> qnas=new QnaDao().searchQuestion(conn, list);
		
		close(conn);
		return qnas;
	}

	public ArrayList<Notice> selectAllNotice() {
		
		Connection conn=getConnection();
		ArrayList<Notice> notices=new QnaDao().selectAllNotice(conn);
		
		close(conn);
		return notices;
	}

	public int updateNotice(Notice n) {
		
		Connection conn=getConnection();
		int result=new QnaDao().updateNotice(conn,n);
		
		close(conn);
		return result;
	}

	public int insertNotice(Notice n) {
		
		Connection conn=getConnection();
		int result=new QnaDao().insertNotice(conn,n);
		
		close(conn);
		return result;
	}

	public int deleteNotice(String noticeNum) {
		
		Connection conn=getConnection();
		int result=new QnaDao().deleteNotice(conn,noticeNum);
		
		close(conn);
		return result;
	}

}
