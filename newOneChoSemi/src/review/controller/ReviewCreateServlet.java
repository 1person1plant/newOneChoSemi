package review.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.vo.Member;
import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class ReviewCreateServlet
 */
@WebServlet("/create.rv")
public class ReviewCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		RequestDispatcher view = null;
		
		int maxSize = 1024 * 1024 * 10;		
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "review_uploadFiles/";	
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		int score = Integer.valueOf(multiRequest.getParameter("score"));
		String content = multiRequest.getParameter("content");
		String orderInfo = multiRequest.getParameter("orderInfo");
		String realPath = "review_uploadFiles";
		
		String orderNo = orderInfo.split(",")[0];
		String itemNo = orderInfo.split(",")[1];
		
		ArrayList<String> saveFiles = new ArrayList<>();
		Enumeration<String> files = multiRequest.getFileNames();
		
		while(files.hasMoreElements()) {
			
			String name = files.nextElement();
			
			if(multiRequest.getFilesystemName(name) != null) {
				saveFiles.add(multiRequest.getFilesystemName(name));			
			}
		}
		
		Review rv = new Review();
		
		if(saveFiles.size() == 0) {
			rv.setOrderNo(orderNo);
			rv.setItemNo(itemNo);
			rv.setMemberNo(memberNo);
			rv.setReviewRate(score);
			rv.setReviewContent(content);
		}else {
			rv.setOrderNo(orderNo);
			rv.setItemNo(itemNo);
			rv.setMemberNo(memberNo);
			rv.setReviewRate(score);
			rv.setReviewContent(content);
			rv.setReviewImgName(saveFiles.get(0));
			rv.setReviewImgPath(realPath);
		}
		
		int reviewReady = new ReviewService().reviewReady(orderNo, itemNo);
			
		if(reviewReady == 1) {		
			
			int reviewCreate = new ReviewService().reviewCreate(rv);
				
			if(reviewCreate == 1) {
				response.sendRedirect("itemDetail.it?itemNo=" + itemNo);
			}
			
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
