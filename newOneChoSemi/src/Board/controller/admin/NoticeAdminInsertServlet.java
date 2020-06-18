package Board.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.model.service.QnaService;
import Board.model.vo.Notice;

/**
 * Servlet implementation class NoticeAdminInsertServlet
 */
@WebServlet("/insert.no")
public class NoticeAdminInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAdminInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String title=request.getParameter("newNoticeTitle");
		String notice=request.getParameter("Neditordata");
		String writer=request.getParameter("noticeWriter");
		
		Notice n=new Notice();
		n.setNoticeTitle(title);
		n.setNoticeContent(notice);
		n.setMemberNo(writer);
		
		System.out.println("공지사항 작성 전:"+n);
		
		QnaService qs=new QnaService();
		int result=qs.insertNotice(n);
		
		if(result>0) {
			System.out.println("공지사항 조회로 이동!");
			response.sendRedirect("adminList.no");
		}else {
			RequestDispatcher views= request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "공지사항 등록 실패");
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
