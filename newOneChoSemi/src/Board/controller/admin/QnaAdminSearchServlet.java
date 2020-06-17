package Board.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.model.service.QnaService;
import Board.model.vo.Qna;

/**
 * Servlet implementation class QnaAdminSearchServlet
 */
@WebServlet("/adminSearch.qna")
public class QnaAdminSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaAdminSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String searchDate=request.getParameter("searchDate");
		String date1=request.getParameter("date1");
		String date2=request.getParameter("date2");
		String findAnswer=request.getParameter("findAnswer");
		String category=request.getParameter("category");
		
		Map<String,String> list=new HashMap<>();
		list.put("searchDate", searchDate);
		list.put("date1", date1);
		list.put("date2", date2);
		list.put("findAnswer", findAnswer);
		list.put("category", category);
		
		System.out.println(list);
		
		
		QnaService qs=new QnaService();
		ArrayList<Qna> qnas=qs.searchQuestion(list);
		
		if(qnas!=null) {
			
			System.out.println("질문 관리 페이지로 이동");
			request.setAttribute("qnas", qnas);
			request.getRequestDispatcher("views/admin/qnaManager.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "질문 검색 실패");
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
