package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String kakaoId = request.getParameter("kakaoId");
		String kakaoNm = request.getParameter("kakaoNm");
		
		
		// 1. 카카오에서 준 id가 db에 존재하는지 체크 (joinIdChkMember 아이디 중복체크 메소드 재활용)
		
		// 1-1. 있으면 카카오 로그인
//		new MemberService().kakaoLoginMember(new Member());
		
		// 1-2. 없으면 회원가입 후 로그인
		// 회원가입
//		int result = new MemberService().kakaoinsertMember(new Member());
		// 1-1 로 돌아가기
		
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
