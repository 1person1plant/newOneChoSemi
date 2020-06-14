package item.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.model.service.ItemService;
import item.model.vo.Item;

/**
 * Servlet implementation class itemSoilServlet
 */
@WebServlet("/category.it")
public class ItemCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String category = request.getParameter("category");
		
		ItemService itService = new ItemService();
		RequestDispatcher view = null;
		
		// 카테고리별 친구들 몇 명인지 세고, 전부 보내주기 START
		int categoryCount = itService.categoryCount(category);
		ArrayList<Item> categoryList = itService.categoryList(category);
		
		request.setAttribute("category", category);
		request.setAttribute("categoryCount", categoryCount);
		request.setAttribute("categoryList", categoryList);
		
		view = request.getRequestDispatcher("views/item/itemCategory.jsp");
		view.forward(request, response);
		// 카테고리별 친구들 몇 명인지 세고, 전부 보내주기 END		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
