package review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewStatusServlet
 */
@WebServlet("/status.rv")
public class ReviewStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String itemNo = request.getParameter("itemNo");
		PrintWriter out = response.getWriter();
				
		int result = 0;

		if(((Member)request.getSession().getAttribute("loginUser")) == null) {
			result = -1;
		}else {
			String memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
			result = new ReviewService().statusCheck(itemNo, memberNo);
		}
					
		if(result==-1) {
			out.print("plzLogin");
		}else if(result==0){
			out.print("nothing");
		}else {
			out.print("something");
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
