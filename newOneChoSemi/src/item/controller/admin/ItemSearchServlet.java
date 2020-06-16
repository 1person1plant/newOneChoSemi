package item.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.model.service.ItemService;
import item.model.vo.Item;
import item.model.vo.ItemImage;

/**
 * Servlet implementation class ItemSearchServlet
 */
@WebServlet("/search.it")
public class ItemSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemSearchServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String searchDate=request.getParameter("searchDate");
		String date1=request.getParameter("date1");
		String date2=request.getParameter("date2");
		String display=request.getParameter("display");
		String name=request.getParameter("pName");
		String category=request.getParameter("category");
		
		
		Map<String,String> list=new HashMap<>();
		list.put("searchDate", searchDate);
		list.put("date1", date1);
		list.put("date2", date2);
		list.put("display", display);
		list.put("name", name);
		list.put("category", category);
		
		System.out.println(list);
		
		//값을 넘겨서..특정 값만 검색하도록 하자
		
		ItemService is=new ItemService();
		
		ArrayList<Item> items=is.searchItems(list);
		
		//이미지 가져오기
		ArrayList<ItemImage> images=is.selectItemImg();
		
		System.out.println(items);
		
		if(items!=null) {
			
			System.out.println("화면으로 보내기!");
			request.setAttribute("items", items);
			request.setAttribute("images", images);
			request.getRequestDispatcher("views/admin/itemManager.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "상품 검색 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
			
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
