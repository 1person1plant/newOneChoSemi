package review.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.xml.internal.ws.api.message.Attachment;

import member.model.vo.Member;

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
		
		int maxSize = 1024 * 1024 * 10;		
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "review_uploadFiles/";		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		
		int score = Integer.valueOf(multiRequest.getParameter("score"));
		String content = multiRequest.getParameter("content");
		String memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo().toString();
		
		System.out.println("score: " + score + "content: " + content + "memberNo " + memberNo);
		
		ArrayList<String> saveFiles = new ArrayList<>();
		ArrayList<String> originFiles = new ArrayList<>();
		
		Enumeration<String> files = multiRequest.getFileNames();
		
		while(files.hasMoreElements()) {
			
			String name = files.nextElement();
			
			if(multiRequest.getFilesystemName(name) != null) {
				saveFiles.add(multiRequest.getFilesystemName(name));			
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
		}
		
		System.out.println("saveFiles: "+ saveFiles);
		System.out.println("originFiles: "+originFiles);
		
//		// 4. DB에 보낼 Board와 Attachment객체 생성
//		Board b = new Board();
//		b.setbTitle(title);
//		b.setbContent(content);
//		b.setbWriter(UserNo);
//		
//		ArrayList<Attachment> fileList = new ArrayList<Attachment>();
//		// 전송 순서 역순으로 파일이 list에 저장되었기 때문에 반복문을 통해 다시 역순을 수행
//		for(int i = originFiles.size()-1 ; i >= 0 ; i--) {
//			Attachment at = new Attachment();
//			at.setFilePath(savePath);
//			at.setOriginName(originFiles.get(i));
//			at.setChangeName(saveFiles.get(i));
//			
//			if(i== originFiles.size()-1) {
//				at.setFileLevel(0);
//			}else {
//				at.setFileLevel(1);
//			}
//			fileList.add(at);
//		}
//		
//		int result = new BoardService().insertThumbnail(b,fileList);
//		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
