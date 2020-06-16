package Board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Board.model.service.QnaService;
import Board.model.vo.Qna;

/**
 * Servlet implementation class QnaInsertServlet
 */
@WebServlet("/insert.qna")
public class QnaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		String category=request.getParameter("category");
		String title=request.getParameter("title");
		String password=request.getParameter("password");
		String content=request.getParameter("editordata");
		String memberNo=request.getParameter("qnaMemberNo");
		
		
		Qna q=null;
		q=new Qna();
		q.setQnaCategory(category);
		q.setQnaTitle(title);
		q.setQnaPassword(password);
		q.setQnaContent(content);
		q.setMemberId(memberNo);
		
		System.out.println(q);
		
		QnaService qs=new QnaService();
		int result=qs.insertQuestion(q);
		
		if(result>0) {
			System.out.println("질문 조회로 이동!");
			response.sendRedirect("list.qna");
		}else {
			
			RequestDispatcher views= request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "질문 등록 실패");
			views.forward(request, response);
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
