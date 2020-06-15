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
 * Servlet implementation class KakaoLoginServlet
 */
@WebServlet("/KakaoLoginServlet")
public class KakaoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberName = request.getParameter("kakaoNm"); // 카카오 닉네임
		String userId = request.getParameter("kakaoId"); // 카카오 고유ID
		
		Member member = new Member();
		member.setMemberId(userId);
		member.setMemberName(memberName);
		
		// 1. 카카오에서 준 id가 db에 존재하는지 체크 (joinIdChkMember 아이디 중복체크 메소드 재활용)
		int result = new MemberService().joinIdChkMember(userId);
		
		if (result == 0) { // 존재하지 않으면
			
			int result_joinK = new MemberService().kakaoinsertMember(member);
			
		}else { // 존재하면 
			
			Member kakaoUser = new MemberService().kakaoLoginMember(member);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("kakaoUser", kakaoUser);

			response.sendRedirect("index.jsp");
			
		}
		
		
		
		
		// 1-1. 있으면 카카오 로그인
		
//		Member kakaoUser = new MemberService().kakaoLoginMember(member);
		
		// 1-2. 없으면 회원가입
		
//		int result_joinK = new MemberService().kakaoinsertMember(member);
		
		
//		request.getSession().setAttribute("", );
//		response.sendRedirect("main.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
