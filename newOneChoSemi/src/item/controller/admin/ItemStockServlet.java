package item.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.model.service.ItemService;
import item.model.vo.Item;
import item.model.vo.ItemImage;

/**
 * Servlet implementation class ItemStockServlet
 */
@WebServlet("/stock.it")
public class ItemStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemStockServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		ItemService is=new ItemService();
		//아이템리스트 가지러가기
		ArrayList<Item> items=is.selectAllItems();
		//이미지 가지러가기
		ArrayList<ItemImage> images=is.selectItemImg();
		
		
		
		if(!items.isEmpty()&&!images.isEmpty()) {
			
			request.setAttribute("items", items);
			request.setAttribute("images", images);
			request.getRequestDispatcher("views/admin/stockManager.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "상품 조회 실패");
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
