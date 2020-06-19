package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/update.inf")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("memberName");
		String memberPhone1 = request.getParameter("memberPhone1");
		String memberPhone2 = request.getParameter("memberPhone2");
		String memberPhone3 = request.getParameter("memberPhone3");
		String memberEmail1 = request.getParameter("memberEmail1");
		String memberEmail2 = request.getParameter("memberEmail2");
		String memberPostcode = request.getParameter("memberPostcode");
		String memberAddress1 = request.getParameter("memberAddress1");
		String memberAddress2 = request.getParameter("memberAddress2");
		int result = new MemberService().memberUpdate(new Member(memberId,memberPwd,memberName,memberPhone1,memberPhone2,memberPhone3,memberEmail1,memberEmail2,memberPostcode,memberAddress1,memberAddress2));
		Member member = new Member(memberId,memberPwd);
		Member loginUser = new MemberService().loginMember(member);
	
		
		
		if(result>0) {
			if(loginUser!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
			
				response.sendRedirect("grade.me?memberNo="+loginUser.getMemberNo());
			}else {
				request.setAttribute("msg", "member값 조회 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response);
			}
		}else {
			request.setAttribute("msg", "Update실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
