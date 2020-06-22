package member.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.admin.AdminMemberService;
import member.model.vo.admin.AdminMember;
import order.model.service.admin.AdminOrderService;
import order.model.vo.admin.AdminOrder;

/**
 * Servlet implementation class memberAdminSearchServlet
 */
@WebServlet("/adminSearch.me")
public class memberAdminSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberAdminSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String searchDate=request.getParameter("searchDate");
		String date1=request.getParameter("date1");
		String date2=request.getParameter("date2");
		String active=request.getParameter("active");
		String type=request.getParameter("memberType");
		
		Map<String,String> list=new HashMap<>();
		list.put("searchDate", searchDate);
		list.put("date1", date1);
		list.put("date2", date2);
		list.put("active",active);
		list.put("type",type);
		
		System.out.println(list);
		
		//검색하러 가자
		AdminMemberService ms=new AdminMemberService();
		ArrayList<AdminMember> members=ms.searchMember(list);
		
		System.out.println("검색 결과 멤버:"+members);
		
		//주문내역도 가져가야 함~
		AdminOrderService os=new AdminOrderService();
		ArrayList<AdminOrder> orders=os.selectAllOrders();
		
		if(members!=null) {
			
			request.setAttribute("members", members);
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("views/admin/memberManager.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "멤버 검색 실패");
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
