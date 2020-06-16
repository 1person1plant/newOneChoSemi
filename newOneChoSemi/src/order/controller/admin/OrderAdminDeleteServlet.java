package order.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.model.service.admin.AdminOrderService;

/**
 * Servlet implementation class OrderAdminDeleteServlet
 */
@WebServlet("/orderDelete.or")
public class OrderAdminDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderAdminDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String orderNum=request.getParameter("orderNum");
		String itemNum=request.getParameter("itemNum");
		
		System.out.println("주문번호"+orderNum);
		System.out.println("상품번호"+itemNum);
		
		//주문취소 컬럼을 업데이트 하러 가자
		int result=new AdminOrderService().deleteOrder(orderNum,itemNum);
		
		if(result>0) {
			System.out.println("주문조회 페이지로 이동!");
			response.sendRedirect("adminList.or");
		}else {
			
			RequestDispatcher views= request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "주문 삭제 실패");
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
