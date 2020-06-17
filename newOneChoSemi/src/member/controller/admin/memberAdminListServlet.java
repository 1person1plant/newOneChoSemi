package member.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class memberAdminListServlet
 */
@WebServlet("/adminList.me")
public class memberAdminListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberAdminListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		AdminMemberService ms=new AdminMemberService();
		
		//멤버 리스트를 가져오자
		ArrayList<AdminMember> members=ms.selectAllMember();
		
		//주문리스트를 가져오자
		AdminOrderService os=new AdminOrderService();
		ArrayList<AdminOrder> orders=os.selectAllOrders();
		
		if(!members.isEmpty()&&!orders.isEmpty()) {
			
			request.setAttribute("members", members);
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("views/admin/memberManager.jsp").forward(request, response);
		}else {
			
			request.setAttribute("msg", "회원 조회 실패");
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
