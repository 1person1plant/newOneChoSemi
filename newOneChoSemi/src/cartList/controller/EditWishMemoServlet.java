package cartList.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cartList.model.service.WishService;
import cartList.model.vo.WishList;

/**
 * Servlet implementation class EditWishMemoServlet
 */
@WebServlet("/editWMemo.wi")
public class EditWishMemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditWishMemoServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wishNo = request.getParameter("wishNo");
		String content = request.getParameter("content");
		
		WishList wi = new WishList(wishNo, content); 
		
//		System.out.println("EditWishMemoServlet : " + wishNo + ", " + content);
		
		int result = new WishService().updateWMemo(wi);
		
		PrintWriter out = response.getWriter();
		
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
