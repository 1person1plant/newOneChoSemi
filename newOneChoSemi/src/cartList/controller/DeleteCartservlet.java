package cartList.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cartList.model.service.CartService;

/**
 * Servlet implementation class DeleteCartservlet
 */
@WebServlet("/deleteCart.ca")
public class DeleteCartservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCartservlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cartNo = request.getParameter("cartNo");
		
		int result = new CartService().deleteCart(cartNo);
		
		PrintWriter out = response.getWriter();
//		System.out.println("개별 항목 삭제 : " + result);
		
		if(result > 0) {
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
