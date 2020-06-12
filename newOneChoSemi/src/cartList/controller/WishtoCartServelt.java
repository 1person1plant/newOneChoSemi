package cartList.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
		String wishNum = request.getParameter("wishNum");
		String itemId = request.getParameter("itemId");
		String userNo = request.getParameter("userNo");
		System.out.println("WishtoCartServelt : " + wishNum + " : " + itemId  + " : " + userNo);
		ArrayList<Cart> cartList = new ArrayList<>();
		PrintWriter out = response.getWriter();
		
		boolean result = new CartService().cartContainChk(userNo,itemId);

		System.out.println("WishtoCartServelt : " + result);
		
		if(!result) {
			cartList = new CartService().wishtoCartList(wishNum,itemId,userNo);
	
			System.out.println("cartList is empty? : " + cartList.isEmpty());
			System.out.println("CartListServlet cartList : " + cartList);
			
			if(cartList.isEmpty()) {
				out.print("fail");		
				out.flush();
				out.close();
			} else {
				response.setContentType("application/json;");
				
				Gson gson = new Gson();
				gson.toJson(cartList, response.getWriter());
			}
		} else {
			out.print("duplication");		
			out.flush();
			out.close();
		}
		
		if(cartList.isEmpty()) {
			out.print("fail");		
			out.flush();
			out.close();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
