package Board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.model.service.QnaService;
import Board.model.vo.Notice;
import Board.model.vo.Qna;

/**
 * Servlet implementation class QnaListServlet
 */
@WebServlet("/list.qna")
public class QnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//질문을 조회하러 가자~
		
		QnaService qs=new QnaService();
		ArrayList<Qna> qnas=qs.selectAllQna();
		
		//공지사항 조회하자
		ArrayList<Notice> notices=qs.selectAllNotice();
				
		System.out.println(notices);
		
		
		
		if(qnas!=null&&notices!=null) {
			
			request.setAttribute("notices", notices);
			request.setAttribute("qnas", qnas);
			request.getRequestDispatcher("views/admin/qna.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "질문 조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
