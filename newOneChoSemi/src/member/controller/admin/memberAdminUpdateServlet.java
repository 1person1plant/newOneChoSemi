package member.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.admin.AdminMemberService;
import member.model.vo.admin.AdminMember;

/**
 * Servlet implementation class memberAdminUpdateServlet
 */
@WebServlet("/adminUpdate.me")
public class memberAdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberAdminUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memberNo=request.getParameter("moMemNum");
		String rankName=request.getParameter("moMemRank");
		String rank="";
		switch(rankName) {
		
		case"씨앗": rank="R1"; break;
		case"새싹": rank="R2"; break;
		case"가지": rank="R3"; break;
		case"열매": rank="R4"; break;
		case"나무": rank="R5"; break;
		
		}
		
		int point=Integer.valueOf(request.getParameter("moMemPoint"));
		
		
		System.out.println(rank);
		System.out.println(point);
		
		
		AdminMemberService ms=new AdminMemberService();
		int result=ms.updateMember(memberNo,rank,point);
		
		if(result>0) {
			
			response.sendRedirect("adminList.me");
			
			
		}else {
			
			request.setAttribute("msg", "회원 업데이트 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		
			
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
