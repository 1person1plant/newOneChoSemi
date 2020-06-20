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

import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/update.rv")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 리뷰 수정하러  가는 코드		
		RequestDispatcher view = null;
				
		int maxSize = 1024 * 1024 * 10;		
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "review_uploadFiles/";	
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				
		String updateReviewNo = multiRequest.getParameter("updateReviewNo");
		int updateReviewScore = Integer.valueOf(multiRequest.getParameter("updateReviewScore"));
		String updateReviewContent = multiRequest.getParameter("updateReviewContent");
		String updateReviewPhoto = multiRequest.getParameter("updateReviewPhoto");
		String itemNo = multiRequest.getParameter("updateItemInfo");
		String realPath = "review_uploadFiles";
				
		ArrayList<String> saveFiles = new ArrayList<>();
		Enumeration<String> files = multiRequest.getFileNames();
				
		while(files.hasMoreElements()) {
					
			String name = files.nextElement();
					
			if(multiRequest.getFilesystemName(name) != null) {
				saveFiles.add(multiRequest.getFilesystemName(name));			
			}
		}
				
		Review updateRv = new Review();
		
		if(saveFiles.size() == 0) {
			updateRv.setReviewNo(updateReviewNo);
			updateRv.setReviewRate(updateReviewScore);
			updateRv.setReviewContent(updateReviewContent);
		}else {				
			updateRv.setReviewNo(updateReviewNo);
			updateRv.setReviewRate(updateReviewScore);
			updateRv.setReviewContent(updateReviewContent);
			updateRv.setReviewImgName(saveFiles.get(0));
		}
				
		// 리뷰 업데이트 하러 가기		
		int reviewUpdate = new ReviewService().reviewUpdate(updateRv);
			
		if(reviewUpdate == 1) {
			response.sendRedirect("itemDetail.it?itemNo=" + itemNo);
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
