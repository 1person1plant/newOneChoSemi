package order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.model.service.OrderService;
import order.model.vo.Order;

/**
 * Servlet implementation class OrderCancelServlet
 */
@WebServlet("/cancel.re")
public class OrderCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCancelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderNo = request.getParameter("orderNo");
		String itemNo = request.getParameter("itemNo");
		String memberNo = request.getParameter("memberNo");
		System.out.println("orderNo : " + orderNo + "itemNo : " + itemNo + "memberNo : " + memberNo);
		int result = new OrderService().cancelRequest(new Order(orderNo,itemNo,memberNo));
		System.out.println("service>servlet : " + result);
		PrintWriter pw = response.getWriter();
		if(result>0) {
			pw.print("success");
		}else {
			pw.print("fail");
		}
		pw.flush();
		pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
