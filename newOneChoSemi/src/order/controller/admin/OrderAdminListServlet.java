package order.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.model.service.admin.AdminOrderService;
import order.model.vo.admin.AdminOrder;

/**
 * Servlet implementation class OrderAdminListServlet
 */
@WebServlet("/adminList.or")
public class OrderAdminListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderAdminListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		AdminOrderService os=new AdminOrderService();
		
		//주문 리스트 가져오기
		ArrayList<AdminOrder> orders=os.selectAllOrders();
		
		if(!orders.isEmpty()) {
			
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("views/admin/orderManager.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "주문 조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
