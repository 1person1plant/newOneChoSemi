package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("memberId");
		String pwd = request.getParameter("memberPwd");
		
		Member member = new Member(id, pwd);
		
		System.out.println("LoginServlet 아이디/비번 : " + id + " / " + pwd);
		
		Member loginUser = new MemberService().loginMember(member);
		
		if(loginUser != null) {
			HttpSession session = request.getSession();
			
			String adminChk = loginUser.getMemberAdmin();
			System.out.println("serv "+ adminChk);
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("admin", adminChk);
			
			response.sendRedirect("index.jsp");
			
		} else {
			request.setAttribute("msg", "로그인 실패");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
