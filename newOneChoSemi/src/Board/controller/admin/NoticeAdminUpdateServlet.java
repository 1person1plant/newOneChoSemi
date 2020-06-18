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
 * Servlet implementation class NoticeAdminUpdateServlet
 */
@WebServlet("/adminUpdate.no")
public class NoticeAdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAdminUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String title=request.getParameter("Ntitle");
		String notice=request.getParameter("editordata");
		String noticeNum=request.getParameter("noticeNum");
		String writer=request.getParameter("writer");
		
		Notice n=new Notice();
		n.setNoticeNo(noticeNum);
		n.setNoticeTitle(title);
		n.setNoticeContent(notice);
		n.setMemberNo(writer);
		
		System.out.println(n);
		
		QnaService qs=new QnaService();
		int result=qs.updateNotice(n);
		
		if(result>0) {
			System.out.println("공지사항 관리페이지로 이동");
			response.sendRedirect("adminList.no");
		}else {
			
			RequestDispatcher views= request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "공지사항 수정 실패");
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
