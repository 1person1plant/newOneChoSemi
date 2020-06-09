package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insertMember.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		Member member = new Member(memberId, memberPwd, memberName, memberPhone1, memberPhone2, memberPhone3, memberEmail1,
									memberEmail2, memberPostcode, memberAddress1, memberAddress2);
		
		int result = new MemberService().insertMember(member);
		
		String page = "";
		if(result > 0) {	// 회원가입이 되었다면
			page = "views/common/successPage_join.jsp";
			request.setAttribute("msg", "회원가입 성공");
		}else{				// 회원가입이 실패했다면
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 가입 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
