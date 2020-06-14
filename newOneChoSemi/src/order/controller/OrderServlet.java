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
		
		// 카트 페이지에서 가져온 구매 상품 정보
		// 카트번호
		String[] cartNoArr = request.getParameterValues("cartNo");
		// 카트 상품 수량
		String[] cartItCoArr = request.getParameterValues("cartItCo");

		// cart.jps cart 폼태그 값 확인용
//		System.out.println(Arrays.toString(cartNoArr));
//		System.out.println(Arrays.toString(cartItCoArr));
	
		// 카트 정보
		ArrayList<Cart> cartOrderList = new ArrayList<>();
		for(int i = 0 ; i < cartNoArr.length ; i++) {
			// cartOrderList 카트 번호와 상품 수량 저장
			cartOrderList.add(new Cart(cartNoArr[i], Integer.valueOf(cartItCoArr[i])));
		}
//		System.out.println("OrderServlet cartOrderList : " + cartOrderList);

		// 구매할 카트 정보 업데이트하고 구매할 카트만 가져오기
		ArrayList<Cart> cartList = new CartService().cartOrderList(userNo, cartOrderList);
		
//		System.out.println("OrderServlet 주문페이지 출력 전 cartList : " + cartList);
//		System.out.println("OrderServlet 주문페이지 출력 전 cartList.size() : " + cartList.size());

		// 랭크 정보
		Rank rankDetail = new RankService().rankDetail(userNo);
//		System.out.println("rankDetail : " + rankDetail);
		
		if(!cartList.isEmpty() && cartList != null && rankDetail != null) {
			request.setAttribute("cartList", cartList);
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
