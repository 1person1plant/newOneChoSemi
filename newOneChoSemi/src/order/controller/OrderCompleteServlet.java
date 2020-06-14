package order.controller;

import java.io.IOException;
import java.util.ArrayList;

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
		String userNo = request.getParameter("comp_userNo");

		String[] comp_iNo = request.getParameterValues("comp_iNo");
		String[] comp_iName = request.getParameterValues("comp_iName");
		String[] comp_imgName = request.getParameterValues("comp_imgName");
		String[] comp_imgPath = request.getParameterValues("comp_imgPath");
		String[] comp_iCount = request.getParameterValues("comp_iCount");
		String[] comp_iPrice = request.getParameterValues("comp_iPrice");
		String[] comp_iDiscount = request.getParameterValues("comp_iDiscount");
		
		String comp_rName = request.getParameter("comp_rName");
		String comp_rPhone1 = request.getParameter("comp_rPhone1");
		String comp_rPhone2 = request.getParameter("comp_rPhone2");
		String comp_rPhone3 = request.getParameter("comp_rPhone3");
		String comp_rPostcode = request.getParameter("comp_rPostcode");
		String comp_rAddress1 = request.getParameter("comp_rAddress1");
		String comp_rAddress2 = request.getParameter("comp_rAddress2");
		String comp_rMemo = request.getParameter("comp_rMemo");
		
		String comp_paymentPrice = request.getParameter("comp_paymentPrice");
		String comp_paymentDelivery = request.getParameter("comp_paymentDelivery");
		String comp_paymentDiscount = request.getParameter("comp_paymentDiscount");
		String comp_paymentPoint = request.getParameter("comp_paymentPoint");
		String comp_paymentUserPoint = request.getParameter("comp_paymentUserPoint");
		String comp_paymentAddPoint = request.getParameter("comp_paymentAddPoint");
		String comp_paymentTotal = request.getParameter("comp_paymentTotal");
		String comp_paymentOption = request.getParameter("comp_paymentOption");
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
