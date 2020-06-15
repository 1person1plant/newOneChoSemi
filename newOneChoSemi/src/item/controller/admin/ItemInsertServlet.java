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
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class ItemInsertServlet
 */
@WebServlet("/insert.it")
public class ItemInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		
		
		String name=multiRequest.getParameter("itemName");
		String category=multiRequest.getParameter("category");
		String keyword=multiRequest.getParameter("keyword");
		int price=Integer.valueOf(multiRequest.getParameter("price"));
		int discount=Integer.valueOf(multiRequest.getParameter("discount"));
		int stock=Integer.valueOf(multiRequest.getParameter("stock"));
		String display=multiRequest.getParameter("display");
		String info=multiRequest.getParameter("itemInfo");
		int max=Integer.valueOf(multiRequest.getParameter("maxbuy"));
		
		
		Item item=new Item(name,category,keyword,price,discount,stock,display,info,max);
		
		
		ArrayList<String> saveFiles=new ArrayList();
		Enumeration<String> files=multiRequest.getFileNames();
		while(files.hasMoreElements()) {
			String fileName=files.nextElement();
			
			//고객이 다운로드 받을 것도 아니니까 변환된 파일명으로 DB에 저장하자
			if(multiRequest.getFilesystemName(fileName)!=null) {
				saveFiles.add(multiRequest.getFilesystemName(fileName));
			}
		}
		
		
		//값넣기
		ItemImage im=null;
		
			im=new ItemImage();
			im.setItemNo(item.getItemNo());
			im.setmPath(savePath);
			im.setsPath(savePath);
			im.setmImgName(saveFiles.get(0));
			im.setsImgName(saveFiles.get(1));
			im.setmCategory(1);
			im.setsCategory(2);
			
		
		
		ItemService is=new ItemService();
		
		//상품등록 메소드
		int result1=is.insertItem(item);
		
		//상품 이미지 등록 메소드
		int result2=is.insertImage(im);
		
		//imageTable insert 메소드
		int result3=is.insertItemImage();
		
		if(result1>0&&result2>0&&result3>0) {
			System.out.println("상품 조회 페이지로 이동!");
			response.sendRedirect("list.it");
		}else {			
			RequestDispatcher views= request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "상품 등록 실패");
			views.forward(request, response);
			
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
