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
import item.model.vo.Pagination;

/**
 * Servlet implementation class ItemListServlet
 */
@WebServlet("/itemMain.it")
public class ItemMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemMainServlet() {
        super();
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ItemService itService = new ItemService();
		RequestDispatcher view = null;
		
		// BEST, NEW 시작
		ArrayList<Item> bestList = itService.bestList();
		ArrayList<Item> newList = itService.newList();
				
		request.setAttribute("bestList", bestList);
		request.setAttribute("newList", newList);
		
		view = request.getRequestDispatcher("views/item/itemMain.jsp");
		// BEST, NEW 끝
				
		// ALL PAGINATION START
		int itemCount = itService.itemCount();
		int currentPage;
		int howManyAtOnce;
		int beginPage;
		int ultimatePage;
		int startPage;
		int endPage;
		
		beginPage = 1;
		currentPage = 1;
		
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.valueOf(request.getParameter("currentPage"));			
		}
		
		howManyAtOnce = 8;
		ultimatePage = (int)((double)itemCount/howManyAtOnce + 0.9);
		startPage = (((int)((double)currentPage/howManyAtOnce + 0.9))-1) * howManyAtOnce + 1;
		endPage = startPage + howManyAtOnce - 1;
		
		if(ultimatePage < endPage) {
			endPage = ultimatePage;
		}else if(currentPage < 1){
			currentPage=1;
		}
		
		Pagination pagination = new Pagination(currentPage, itemCount, howManyAtOnce, ultimatePage, startPage, endPage);
		
		ArrayList<Item> allList = itService.allList(currentPage, howManyAtOnce);
		
		request.setAttribute("pagination", pagination);
		request.setAttribute("allList", allList);
		// ALL PAGINATION END
		
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
