package order.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.model.service.admin.AdminOrderService;
import order.model.vo.Order;

/**
 * Servlet implementation class OrderAdminUpdateServlet
 */
@WebServlet("/orderUpdate.or")
public class OrderAdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderAdminUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] ids=request.getParameterValues("id");
		String[] payment=request.getParameterValues("payment");
		String[] delivery=request.getParameterValues("delivery");
		String[] items=request.getParameterValues("item");
		
		ArrayList<Order> orders=new ArrayList();
		
		for(int i=0;i<ids.length;i++) {
			
			System.out.println("ids:"+ids[i]);
			System.out.println("payment:"+payment[i]);
			System.out.println("delivery:"+delivery[i]);
			System.out.println("item:"+items[i]);
			
			
			Order o=new Order();
			o.setOrderNo(ids[i]);
			o.setItemNo(items[i]);
			o.setPaymentCode(payment[i]);
			o.setDeliveryCode(delivery[i]);
			
			orders.add(o);
			
			
		}
		
		
		//주문 업데이트 하러 가즈아
		int result=new AdminOrderService().updateOrder(orders);
		
		if(result>0) {
			
			response.sendRedirect("adminList.or");
			
		}else {
			
			RequestDispatcher views= request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "주문 수정 실패");
			views.forward(request, response);
			
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
