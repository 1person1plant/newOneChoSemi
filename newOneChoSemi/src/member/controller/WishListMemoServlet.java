package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MyWishListService;
import member.model.vo.MyWishList;
import member.model.vo.RealWishList;


/**
 * Servlet implementation class WishListMemoServlet
 */
@WebServlet("/wishmemo.up")
public class WishListMemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishListMemoServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wishNo = request.getParameter("wishNo");
		String itemNo = request.getParameter("itemNo");
		String memberNo = request.getParameter("memberNo");
		String wishMemo = request.getParameter("wishMemo");
		System.out.println("wishNo : "+wishNo + "memberNo : "+memberNo + "wishMemo : " + wishMemo + "itemNo : " + itemNo);
		int result = new MyWishListService().memoUpdate(new RealWishList(wishNo,itemNo,memberNo,wishMemo));
		
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

