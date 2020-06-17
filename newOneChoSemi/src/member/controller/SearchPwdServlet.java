package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.model.service.MemberService;
import member.model.utils.MailService;
import member.model.vo.Member;

/**
 * Servlet implementation class SearchPwdServlet
 */
@WebServlet("/searchPwd.me")
public class SearchPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwdServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId_A = request.getParameter("memberId_A");
		String memberEmail1_P = request.getParameter("memberEmail1_P"); 
		String memberEmail2_P = request.getParameter("memberEmail2_P");
		
		Member member = new Member();
		member.setMemberId(memberId_A);
		member.setMemberEmail1(memberEmail1_P);
		member.setMemberEmail2(memberEmail2_P);
		
		String searchPwd_A = new MemberService().searchPwdMember(member);
		
		if(searchPwd_A != null) {
			// 메일 전송
			MailService m = new MailService();
			
			try {
				m.sendMail("dkfk7845@naver.com", "임시비밀번호"); // 비밀번호 찾을 사용자의 이메일, 임시 비밀번호
			} catch (Exception e) { 
				e.printStackTrace();
				response.getWriter().write("메일실패");
			}	
		}
		
		// 화면단으로 값 보내기
		String result = new Gson().toJson(searchPwd_A);

		response.getWriter().write(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
