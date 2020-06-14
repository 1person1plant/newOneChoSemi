package order.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.model.service.admin.AdminOrderService;
import order.model.vo.admin.AdminOrder;

/**
 * Servlet implementation class OrderAdminSearchServlet
 */
@WebServlet("/search.or")
public class OrderAdminSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderAdminSearchServlet() {
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
		String delivery=request.getParameter("searchDelivery");
		String payment=request.getParameter("searchPayment");
		String cancel=request.getParameter("searchCancel");
		
		Map<String,String> list=new HashMap<>();
		list.put("searchDate", searchDate);
		list.put("date1", date1);
		list.put("date2", date2);
		list.put("delivery",delivery);
		list.put("payment",payment);
		list.put("cancel",cancel);
		
		System.out.println(list);
		
		//검색하러 가자
		AdminOrderService os=new AdminOrderService();
		ArrayList<AdminOrder> orders=os.searchOrders(list);
		
		if(orders!=null) {
			
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("views/admin/orderManager.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "주문 검색 실패");
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
