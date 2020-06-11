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
 * Servlet implementation class ItemStockSearchServlet
 */
@WebServlet("/stockSearch.it")
public class ItemStockSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemStockSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String minStock=request.getParameter("minStock");
		String maxStock=request.getParameter("maxStock");
		String display=request.getParameter("display");
		String pName=request.getParameter("pName");
		String category=request.getParameter("category");
		
		Map<String,String> list=new HashMap<>();
		list.put("minStock", minStock);
		list.put("maxStock", maxStock);
		list.put("display",display);
		list.put("pName",pName);
		list.put("category",category);
		
		System.out.println(list);
		
		//검색 조건을 넘기자
		ItemService is=new ItemService();
		ArrayList<Item> items=is.searchStock(list);
		
		//이미지 가져오기..쓰게 될 수도 있으니까 
		ArrayList<ItemImage> images=is.selectItemImg();
		
		if(items!=null) {
			System.out.println("화면으로 보내기!");
			request.setAttribute("items", items);
			request.setAttribute("images", images);
			request.getRequestDispatcher("views/admin/stockManager.jsp").forward(request, response);
			
			
		}else {
			
			request.setAttribute("msg", "재고 조회 실패");
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
