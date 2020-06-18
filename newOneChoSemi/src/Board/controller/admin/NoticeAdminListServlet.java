package Board.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.model.service.QnaService;
import Board.model.vo.Notice;

/**
 * Servlet implementation class NoticeAdminListServlet
 */
@WebServlet("/adminList.no")
public class NoticeAdminListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAdminListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		QnaService qs=new QnaService();
		
		//공지사항 조회하자
		ArrayList<Notice> notices=qs.selectAllNotice();
		
		System.out.println(notices);
		
		
		if(!notices.isEmpty()) {
			
			request.setAttribute("notices", notices);
			request.getRequestDispatcher("views/admin/noticeManager.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "공지사항 조회 실패");
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
