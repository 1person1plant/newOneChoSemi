package order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.model.service.OrderService;
import order.model.vo.Order;

/**
 * Servlet implementation class OrderCompleteServlet
 */
@WebServlet("/orderComp.or")
public class OrderCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCompleteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] itemNo = request.getParameterValues("comp_iNo");
		String[] orderItemName = request.getParameterValues("comp_iName");
		String[] orderItemImgName = request.getParameterValues("comp_imgName");
		String[] orderItemImgPath = request.getParameterValues("comp_imgPath");
		String[] orderItemPrice = request.getParameterValues("comp_iPrice");
		String[] orderItemDiscount = request.getParameterValues("comp_iDiscount");
		String[] orderCount = request.getParameterValues("comp_iCount");
		
		// order.jsp 상품 정보
		System.out.println(Arrays.toString(itemNo));
		System.out.println(Arrays.toString(orderItemName));
		System.out.println(Arrays.toString(orderItemImgName));
		System.out.println(Arrays.toString(orderItemImgPath));
		System.out.println(Arrays.toString(orderItemPrice));
		System.out.println(Arrays.toString(orderItemDiscount));
		System.out.println(Arrays.toString(orderCount));
		
		String memberNo = request.getParameter("comp_userNo");
		int orderUsePoint = 0;
		if(request.getParameter("comp_paymentPoint") != null || request.getParameter("comp_paymentPoint") != "") {
			orderUsePoint = Integer.valueOf(request.getParameter("comp_paymentPoint"));
		}
		String orderName = request.getParameter("comp_rName");
		String orderPhone1 = request.getParameter("comp_rPhone1");
		String orderPhone2 = request.getParameter("comp_rPhone2");
		String orderPhone3 = request.getParameter("comp_rPhone3");
		String orderPostcode = request.getParameter("comp_rPostcode");
		String orderAddress1 = request.getParameter("comp_rAddress1");
		String orderAddress2 = request.getParameter("comp_rAddress2");
		String orderRequest = request.getParameter("comp_rMemo");
		int orderDCost = 0;
		if(request.getParameter("comp_paymentDelivery") != null || request.getParameter("comp_paymentDelivery") != "") {
			orderDCost = Integer.valueOf(request.getParameter("comp_paymentDelivery"));
		}
		int orderAddPoint = 0;
		if(request.getParameter("comp_paymentAddPoint") != null ||  request.getParameter("comp_paymentAddPoint") != "") {
			orderAddPoint = Integer.valueOf(request.getParameter("comp_paymentAddPoint"));
		}
		String orderPaymentOption = request.getParameter("comp_paymentOption");

		// 구매자 정보
		System.out.println("memberNo : " + memberNo);
		System.out.println("orderUsePoint : " + orderUsePoint);
		System.out.println("orderName : " + orderName);
		System.out.println("orderPhone1 : " + orderPhone1);
		System.out.println("orderPhone2 : " + orderPhone2);
		System.out.println("orderPhone3 : " + orderPhone3);
		System.out.println("orderPostcode : " + orderPostcode);
		System.out.println("orderAddress1 : " + orderAddress1);
		System.out.println("orderAddress2 : " + orderAddress2);
		System.out.println("orderRequest : " + orderRequest);
		System.out.println("orderDCost : " + orderDCost);
		System.out.println("orderAddPoint : " + orderAddPoint);
		System.out.println("orderPaymentOption : " + orderPaymentOption);
		
		ArrayList<Order> orderItem = new ArrayList<>();
		for(int i = 0 ; i < itemNo.length ; i++) {
			orderItem.add(new Order(itemNo[i], orderItemName[i], orderItemImgName[i], orderItemImgPath[i], Integer.valueOf(orderItemPrice[i]), Integer.valueOf(orderItemDiscount[i]), Integer.valueOf(orderCount[i])));
		}
		System.out.println("orderTemp : " + orderItem);
		
		ArrayList<Order> orderBuyer = new ArrayList<>(); 
		orderBuyer.add(new Order(memberNo, Integer.valueOf(orderUsePoint), orderName, orderPhone1, orderPhone2, orderPhone3, orderPostcode, orderAddress1, orderAddress2, orderRequest, orderDCost, orderAddPoint, orderPaymentOption));

		System.out.println("orderBuyer : " + orderBuyer);
		
		boolean result = new OrderService().insertOrderList(orderItem, orderBuyer);
		
		if(result) {
			request.setAttribute("orderItem", orderItem);
			request.setAttribute("orderBuyer", orderBuyer);
			request.getRequestDispatcher("views/cart/order.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "주문 실패!");
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
