package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class WdReasonServlet
 */
@WebServlet("/reason.me")
public class WdReasonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WdReasonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String[] reason = request.getParameterValues("reason");
		String memberReason = "";
		for(int i=0; i<reason.length;i++) {
			memberReason += reason[i] +" ";
		}
		int result = new MemberService().reasonMember(new Member(memberId,memberName,memberReason));
		request.getSession().invalidate();
		if(result>0) {
			request.getRequestDispatcher("views/common/withSuccessPage.jsp").forward(request, response);
			request.setAttribute("msg", "");
		}else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			request.setAttribute("msg", "실패");
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
