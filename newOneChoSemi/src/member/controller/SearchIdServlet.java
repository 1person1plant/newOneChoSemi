package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class SearchIdServlet
 */
@WebServlet("/searchId.me")
public class SearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter msg = response.getWriter();
		
		String memberPhone1 = request.getParameter("memberPhone1");
		String memberPhone2 = request.getParameter("memberPhone2");
		String memberPhone3 = request.getParameter("memberPhone3");
		String memberEmail1 = request.getParameter("memberEmail1");
		String memberEmail2 = request.getParameter("memberEmail2");
		
		Member searchId_A = new MemberService().searchIdMember(new Member(memberPhone1, memberPhone2, memberPhone3, memberEmail1, memberEmail2 ));
		
		if(searchId_A != null) {
			HttpSession session = request.getSession();
			session.setAttribute("searchId_A", searchId_A);
			response.sendRedirect("find_Account.jsp");
//			response.setContentType("text/html; charset=UTF-8"); 
//			msg.println("<script>alert('성공'); location.href='views/member/find_Account.jsp';</script>"); 
//			msg.close();
		} else {
			response.setContentType("text/html; charset=UTF-8"); 
			msg.println("<script>alert('내용과 일치하는 회원정보가 없습니다'); location.href='views/member/find_Account.jsp';</script>"); 
			msg.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
