package item.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.model.service.ItemService;
import member.model.vo.Member;

/**
 * Servlet implementation class ItemWishDeleteServlet
 */
@WebServlet("/wishDelete.it")
public class ItemWishDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemWishDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemNo = request.getParameter("itemNo");
		PrintWriter out = response.getWriter();
		
		System.out.println("아이템 위시 델트 서블릿");
		int result = 0;

		String memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		System.out.println("wishdeleteservlet : " + itemNo + " , " + memberNo);
		result = new ItemService().wishDelete(itemNo, memberNo);
					
		if(result != 0) {
			out.print("success");
		}
		
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
