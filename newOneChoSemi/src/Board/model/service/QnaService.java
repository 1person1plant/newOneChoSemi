package Board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import Board.model.dao.QnaDao;
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

}
