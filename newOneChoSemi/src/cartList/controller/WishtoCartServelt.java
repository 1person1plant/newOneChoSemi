package cartList.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cartList.model.service.CartService;
import cartList.model.vo.Cart;

/**
 * Servlet implementation class WishtoCartServelt
 */
@WebServlet("/wishtoCart.wi")
public class WishtoCartServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishtoCartServelt() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 카트리스트 조회
		String cartNum = request.getParameter("cartNum");
		String itemId = request.getParameter("itemId");
		System.out.println("WishtoCartServelt : " + cartNum);
		System.out.println("WishtoCartServelt : " + cartNum);
		
		
		ArrayList<Cart> cartList = new CartService().wishtoCartList(cartNum,itemId);

		System.out.println("CartListServlet cartList : " + cartList);
		System.out.println("cartList is empty? : " + cartList.isEmpty());
		
		response.setContentType("application/json;");

		Gson gson = new Gson();
		
		gson.toJson(cartList, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
