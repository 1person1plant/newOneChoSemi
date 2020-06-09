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
import item.model.vo.ItemImage;

/**
 * Servlet implementation class ItemListServlet
 */
@WebServlet("/list.it")
public class ItemListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//아이템리스트 가지러가기
		ItemService is=new ItemService();
		ArrayList<Item> items=is.selectAllItems();
		ArrayList<ItemImage> images=is.selectItemImg();
		
		
		//이미지 가지러가기
		
		if(!items.isEmpty()&&!images.isEmpty()) {
			
			request.setAttribute("items", items);
			request.setAttribute("images", images);
			request.getRequestDispatcher("views/admin/itemManager.jsp").forward(request, response);
			
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
