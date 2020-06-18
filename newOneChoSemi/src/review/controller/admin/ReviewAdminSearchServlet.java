package review.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.admin.AdminReviewService;
import review.model.vo.admin.AdReview;

/**
 * Servlet implementation class ReviewAdminSearchServlet
 */
@WebServlet("/adminSearch.re")
public class ReviewAdminSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewAdminSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String searchDate=request.getParameter("searchDate");
		String date1=request.getParameter("date1");
		String date2=request.getParameter("date2");
		String rate=request.getParameter("rate");
		
		Map<String,String> list=new HashMap<>();
		list.put("searchDate", searchDate);
		list.put("date1", date1);
		list.put("date2", date2);
		list.put("rate", rate);
		
		AdminReviewService rs=new AdminReviewService();
		ArrayList<AdReview> reviews=rs.searchReview(list);
		
		if(reviews!=null) {
			
			System.out.println("리뷰 관리 페이지로 이동");
			request.setAttribute("reviews", reviews);
			request.getRequestDispatcher("views/admin/reviewManager.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "리뷰 검색 실패");
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
