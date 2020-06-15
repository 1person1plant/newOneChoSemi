package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cartList.model.service.WishService;
import cartList.model.vo.WishList;

/**
 * Servlet implementation class MyWishListServlet
 */
@WebServlet("/myWishList.my")
public class MyWishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyWishListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberNo = request.getParameter("memberNo");
		System.out.println("넘버는 받아와 지냐?" + memberNo);
		
		ArrayList<WishList> mwl = new WishService().myWishList(memberNo);
		/* System.out.println("servlet"+mwl); */
		
		if(mwl != null) {
			request.setAttribute("mwl", mwl);
			request.getRequestDispatcher("views/myPage/myWishList.jsp").forward(request,response);
		}else {
			request.setAttribute("msg", "실패");
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
