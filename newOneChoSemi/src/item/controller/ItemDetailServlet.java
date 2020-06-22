package item.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.model.service.ItemService;
import item.model.vo.Item;
import item.model.vo.Pagination;
import member.model.service.MyWishListService;
import member.model.vo.Member;
import order.model.vo.Order;
import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class itemDetailServlet
 */
@WebServlet("/itemDetail.it")
public class ItemDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String itemNo = request.getParameter("itemNo");
		ReviewService rvService = new ReviewService();
		RequestDispatcher view = null;
		view = request.getRequestDispatcher("views/item/itemDetail.jsp");
		
		ArrayList<Review> myReviewList = new ArrayList<>();
		
		int wishCheck = 0;   
		        
		Order order = new Order();
		Review loadReview = new Review();
		
		// REVIEW PAGINATION //
		int otherReviewCount = new ReviewService().otherReviewCount(itemNo);
		int currentPage;
		int howManyAtOnce;
		int ultimatePage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.valueOf(request.getParameter("currentPage"));			
		}
		
		howManyAtOnce = 5;
		ultimatePage = (int)((double)otherReviewCount/howManyAtOnce + 0.9);
		startPage = (((int)((double)currentPage/howManyAtOnce + 0.9))-1) * howManyAtOnce + 1;
		endPage = startPage + howManyAtOnce - 1;
		
		if(ultimatePage < endPage) {
			endPage = ultimatePage;
		}
		
		Pagination pagination = new Pagination(currentPage, otherReviewCount, howManyAtOnce, ultimatePage, startPage, endPage);
		
		ArrayList<Review> otherReviewList = rvService.otherReviewList(itemNo, currentPage, howManyAtOnce);
		// REVIEW PAGINATION //		
		
		if(((Member)request.getSession().getAttribute("loginUser")) == null) {
			myReviewList = new ArrayList<>();
		}else {
			String memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
			myReviewList = new ReviewService().myReviewList(itemNo, memberNo);
			wishCheck = new MyWishListService().wishCheck(itemNo, memberNo);
			order = new ReviewService().orderCheck(itemNo, memberNo);
			System.out.println(wishCheck);
		}
		
		Item itemDetail = new ItemService().selectItemDetail(itemNo);
		
		request.setAttribute("itemDetail", itemDetail);
		request.setAttribute("myReviewList", myReviewList);
		request.setAttribute("otherReviewList", otherReviewList);
		request.setAttribute("otherReviewCount", otherReviewCount);
		request.setAttribute("orderCheck", order);
		request.setAttribute("wishCheck", wishCheck);
		request.setAttribute("pagination", pagination);
		
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
