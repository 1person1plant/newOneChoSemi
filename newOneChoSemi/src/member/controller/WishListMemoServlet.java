package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MyWishListService;
import member.model.vo.MyWishList;

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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemNo = request.getParameter("itemNo");
		String wishNo = request.getParameter("wishNo");
		String wishMemo = request.getParameter("wishMemo");
		String memberNo = request.getParameter("memberNo");
		int result = new MyWishListService().memoUpdate(new MyWishList(itemNo,wishNo,wishMemo,memberNo));
		System.out.println("servlet" + result);
		if(result>0) {
			request.setAttribute("msg", "성공");
			request.getRequestDispatcher("views/myPage/wishList.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "실패");
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
