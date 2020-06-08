package cartList.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cartList.model.service.CartService;
import cartList.model.vo.Cart;

/**
 * Servlet implementation class CartListServlet
 */
@WebServlet("/cart.ca")
public class CartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 카트리스트 조회
		String userNo = request.getParameter("userNo");
		System.out.println("CartListServlet : " + userNo);
		
		ArrayList<Cart> cartList = new CartService().cartList(userNo);

//		System.out.println("CartListServlet cartList : " + cartList);
//		System.out.println("cartList is empty? : " + cartList.isEmpty());
		if(cartList != null) {
			request.setAttribute("cartList", cartList);
			request.getRequestDispatcher("views/cart/cart.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "카트 조회 실패!");
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
