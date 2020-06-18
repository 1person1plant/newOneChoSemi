package item.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.model.service.ItemService;
import item.model.vo.Item;
import member.model.service.MyWishListService;
import member.model.vo.Member;
import member.model.vo.MyWishList;
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
		ArrayList<Review> myReviewList = new ArrayList<>();
		ArrayList<Review> otherReviewList = new ReviewService().otherReviewList(itemNo);
		int wishCheck = 0;
		Order order = new Order();
		
		if(((Member)request.getSession().getAttribute("loginUser")) == null) {
			myReviewList = new ArrayList<>();
		}else {
			String memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
			myReviewList = new ReviewService().myReviewList(itemNo, memberNo);
			wishCheck = new MyWishListService().wishCheck(itemNo, memberNo);
			order = new ReviewService().orderCheck(itemNo, memberNo);
		}
		
		Item itemDetail = new ItemService().selectItemDetail(itemNo);
		
		request.setAttribute("itemDetail", itemDetail);
		request.setAttribute("myReviewList", myReviewList);
		request.setAttribute("otherReviewList", otherReviewList);
		request.setAttribute("orderCheck", order);
		request.setAttribute("wishCheck", wishCheck);
		request.getRequestDispatcher("views/item/itemDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
