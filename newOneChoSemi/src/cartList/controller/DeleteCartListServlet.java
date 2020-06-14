package cartList.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cartList.model.service.CartService;
import cartList.model.vo.Cart;

/**
 * Servlet implementation class CartListDeleteServlet
 */
@WebServlet("/deleteCartList.ca")
public class DeleteCartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCartListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] cartArr = request.getParameterValues("cartArr[]");

		ArrayList<Cart> deleteCart = new ArrayList<>();
		
		for(int i = 0 ; i < cartArr.length ; i++) {
			deleteCart.add(new Cart(cartArr[i]));
		}
		
		boolean result = new CartService().deleteCartList(deleteCart);
		
		PrintWriter out = response.getWriter();
//		System.out.println("개별 항목 삭제 : " + result);
		
		if(result) {
			out.print("permit");
		} else {
			out.print("fail");
		}
		
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
