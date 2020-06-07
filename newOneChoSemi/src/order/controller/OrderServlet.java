package order.controller;

import java.io.IOException;
import java.util.ArrayList;

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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userNo = request.getParameter("userNo");
		System.out.println("OrderServlet : " + userNo);
//		String cartNo1 = request.getParameter("cartNo1");
//		String cartCount1 = request.getParameter("cartCount1");
//		String cartNo2 = request.getParameter("cartNo2");
//		String cartCount2 = request.getParameter("cartCount2");
//		System.out.println("cartNo1 : " + cartNo1);
//		System.out.println("cartCount1 : " + cartCount1);
//		System.out.println("cartNo2 : " + cartNo2);
//		System.out.println("cartCount2 : " + cartCount2);
		

		System.out.println("여기옴? sev1");
		// 멤버 정보는 세션에
		
		// 카트 정보
		ArrayList<Cart> cartList = new CartService().cartList(userNo);
		System.out.println("cartList.size() : " + cartList.size());
		for(int i = 0 ; i < cartList.size() ; i++) {
			String cartNo = request.getParameter("cartNo" + i);
//			if(request.getParameter("cartCount" + i) != null || request.getParameter("cartCount" + i) != "") {
//				int cartCount = Integer.valueOf(request.getParameter("cartCount" + i).trim());
//			}
			System.out.println("cartNo : " + cartNo);
			if(cartNo != "on") {
				cartList.remove(i);
			} else {
//				Cart temp = cartList.get(i);
//				temp.setCartListCount(cartCount);
//				cartList.set(i, temp);
			}
			System.out.println("cartList : " + cartList);
		}

		System.out.println("여기옴? sev2");
		
		// 랭크 정보
		Rank rankDetail = new RankService().rankDetail(userNo);
		System.out.println("rankDetail : " + rankDetail);
		
		if(cartList != null && rankDetail != null) {
			request.setAttribute("cartList", cartList);
			request.setAttribute("rankDetail", rankDetail);
			request.getRequestDispatcher("views/cart/order.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "주문 실패!");
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
