package order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cartList.model.service.CartService;
import cartList.model.vo.Cart;
import member.model.service.RankService;
import member.model.vo.Rank;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order.or")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userNo = request.getParameter("userNo");
//		System.out.println("OrderServlet : " + userNo);
		
		String[] cartNoArr = request.getParameterValues("cartNo");
		String[] cartItCoArr = request.getParameterValues("cartItCo");

		System.out.println("cartNoArr[i] : " + cartNoArr[0]);
		System.out.println(Arrays.toString(cartNoArr));
		System.out.println(Arrays.toString(cartItCoArr));
		
		// 카트 정보
		ArrayList<Cart> cartOrderList = new ArrayList<>();
		for(int i = 0 ; i < cartNoArr.length ; i++) {
			cartOrderList.add(new Cart(cartNoArr[i],Integer.valueOf(cartItCoArr[i])));
		}
		
		ArrayList<Cart> cartList = new CartService().cartList(userNo, cartOrderList);
		
		System.out.println("cartOrderList : " + cartOrderList);
		// 랭크 정보
		Rank rankDetail = new RankService().rankDetail(userNo);
//		System.out.println("rankDetail : " + rankDetail);
		
		if(!cartOrderList.isEmpty() && cartOrderList != null && rankDetail != null) {
			request.setAttribute("cartList", cartOrderList);
			request.setAttribute("rankDetail", rankDetail);
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
