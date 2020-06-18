package item.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import item.model.service.ItemService;
import item.model.vo.Item;
import item.model.vo.ItemImage;

/**
 * Servlet implementation class ItemUpdateServlet
 */
@WebServlet("/update.it")
public class ItemUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemUpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		int maxSize=1024*1024*10;
		String root=request.getSession().getServletContext().getRealPath("/");
		String savePath=root+"items_uploadFiles/";
		MultipartRequest multiRequest=new MultipartRequest(request,savePath,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		
		
		//아이템의 수정값 받아오기
		String itemNum=multiRequest.getParameter("productNum");
		String name=multiRequest.getParameter("modifyName");
		String exhibit=multiRequest.getParameter("modifyExhibitText");
		String display="";
		switch(exhibit) {
		case "전시중": display="Y"; break;
		case "전시중지":display="N"; break;
		}
		
		
		int price=Integer.valueOf(multiRequest.getParameter("modifyPrice"));
		int discount=Integer.valueOf(multiRequest.getParameter("modifyDiscount"));
		String category=multiRequest.getParameter("modifyCategoryText");
		
		
		String keyword=multiRequest.getParameter("modifyKeywordText");
		String newKeyword="";
		switch(keyword) {
		case "산소뿜뿜":newKeyword="K1";break;
		case "반려동물 친화":newKeyword="K2";break;
		case "산소&반려동물 친화":newKeyword="K3";break;
		}
		
		
		String info=multiRequest.getParameter("modifyInfo");
		
		Item item=new Item(itemNum,name,category,newKeyword,price,discount,display,info);
		
		System.out.println("상품수정:"+item);
		
		//이미지 가져오기
		
		
		//메인이미지, 서브이미지 구분하기 위해 히든태그의 값을 가져온다.
		String main=multiRequest.getParameter("hiddenMain");
		String sub=multiRequest.getParameter("hiddenSub");
		
		System.out.println(main);
		System.out.println(sub);
		
		
		ArrayList<String> saveFiles=new ArrayList<>();
		Enumeration<String> files=multiRequest.getFileNames();
		while(files.hasMoreElements()) {
			String filename=files.nextElement();
			
			if(multiRequest.getFilesystemName(filename)!=null) {
				saveFiles.add(multiRequest.getFilesystemName(filename));
			}	
		}
		
		ItemImage im=null;
		
		//2장 다 들어있을 때
		if(!main.equals("none")&&!sub.equals("none")) {
		
		im=new ItemImage();
		im.setmPath(savePath);
		im.setsPath(savePath);
		
		
		im.setmImgName(saveFiles.get(0));
		im.setsImgName(saveFiles.get(1));
		
		
		im.setmCategory(1);
		im.setsCategory(2);
		
		System.out.println("상품수정이미지:"+im);
		}else if(!main.equals("none")) { //사진이 메인만 들어있을 때,
			
			im=new ItemImage();
			im.setmPath(savePath);
			im.setmImgName(saveFiles.get(0));
			im.setmCategory(1);
			
		}else if(!sub.equals("none")) {//사진이 서브만 들어있을 때,
			
			im=new ItemImage();
			im.setsPath(savePath);
			im.setsImgName(saveFiles.get(0));
			im.setmCategory(2);
		}else {
			System.out.println("파일을 업로드 하지 않았다.");
		}
		
		//서비스로 넘길 준비
		ItemService is=new ItemService();
		
		//상품수정 메소드
		int result1=is.updateItem(item);
		
		//2장 다 넘어왔을 경우
		int result2=0;
		int result3=0;
		int result4=0;
		
		//1장 넘어왔을 경우(메인)
		int result5=0;
		int result6=0;
		
		//1장 넘어왔을 경우(서브)
		int result7=0;
		int result8=0;
		
		
		//상품이미지 수정 메소드
		
		//넘어온 파일이 있을 경우에 메소드를 실행한다.
		if(!main.equals("none")&&!sub.equals("none")) {
			
			System.out.println("실행이 되는가?");
			
			result2=is.insertImage(im);
			result3=is.updateMainImage(item);
			result4=is.updateSubImage(item);
		}else if(!main.equals("none")) {
			
			result5=is.insertOneMain(im);
			result6=is.updateOneMain(item);
			
		}else if(!sub.equals("none")) {
			
			result7=is.insertOneSub(im);
			result8=is.updateOneSub(item);
			
		}else {
			System.out.println("들어온 게 없으니 넘길 것도 없다");
		}
		
		
		
		
		if(result1>0) {
			System.out.println("상품 조회 페이지로 이동!");
			response.sendRedirect("list.it");
		}else {
			
			RequestDispatcher views= request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "상품 수정 실패");
			views.forward(request, response);
			
		}
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
