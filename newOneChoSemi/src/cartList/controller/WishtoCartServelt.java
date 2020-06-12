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
//		System.out.println("CartListServlet : " + userNo);
		
		
		ArrayList<Cart> cartList = new CartService().wishtoCartList(cartNum);

//		System.out.println("CartListServlet cartList : " + cartList);
//		System.out.println("cartList is empty? : " + cartList.isEmpty());
//		System.out.println("CartListServlet wishList : " + wishList);
//		System.out.println("wishList is empty? : " + wishList.isEmpty());
		
		response.setContentType("application/json;");	// json을 보낸다
		
		// date 출력 형식을 지정함
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
