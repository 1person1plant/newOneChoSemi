package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class IdentificationServlet
 */
@WebServlet("/identy.me")
public class IdentificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdentificationServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("password1");
		System.out.println("아이디 넘어오나"+memberId);
		Member idenUser = new MemberService().idenMember(new Member(memberId,memberPwd));
		System.out.println("servlet"+idenUser);
		if(idenUser != null) {
			request.setAttribute("idenUser", idenUser);
			request.getRequestDispatcher("views/myPage/grade.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "실패");
			request.getRequestDispatcher("views/myPage/identification.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
