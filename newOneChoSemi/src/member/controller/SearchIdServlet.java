package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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
		
		String memberPhone1 = request.getParameter("phone1");
		String memberPhone2 = request.getParameter("phone2");
		String memberPhone3 = request.getParameter("phone3");
		String memberEmail1 = request.getParameter("email1");
		String memberEmail2 = request.getParameter("email2");
		
		Member member = new Member(memberPhone1, memberPhone2, memberPhone3, memberEmail1, memberEmail2);

		Member searchId_A = new MemberService().searchIdMember(member);
		
		// DB에서 조회된 값이 잘 들어왔는지 확인하기
		if(searchId_A != null) {
			String searchId_change = searchId_A.getMemberId();
			int idLength = searchId_change.length();
			
			// 조회된 아이디 길이에서 반을 자르고 버리기
			String jarm = searchId_change.substring(0, idLength/2);
			
			// 자른 만큼 *을 뒤에 붙이기
			for(int i = idLength/2; i < idLength; i++) {
				jarm += "*";
			}
			
			searchId_A.setMemberId(jarm);
		}
		// 화면단으로 값 보내기
		String result = new Gson().toJson(searchId_A);
		response.getWriter().write(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
