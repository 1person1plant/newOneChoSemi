package review.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.admin.AdminReviewService;
import review.model.vo.Review;
import review.model.vo.admin.AdReview;

/**
 * Servlet implementation class ReviewAdminListServlet
 */
@WebServlet("/adminList.re")
public class ReviewAdminListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewAdminListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//review 조회하자
		AdminReviewService rs=new AdminReviewService();
		ArrayList<AdReview> reviews=rs.selectAllReview();
		
		if(!reviews.isEmpty()) {
			
			request.setAttribute("reviews", reviews);
			request.getRequestDispatcher("views/admin/reviewManager.jsp").forward(request, response);
		}else {
			
			request.setAttribute("msg", "리뷰 조회 실패");
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
