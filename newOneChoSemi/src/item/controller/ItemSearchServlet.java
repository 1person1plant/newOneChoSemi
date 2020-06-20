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

/**
 * Servlet implementation class ItemSearchServlet
 */
@WebServlet("/itemSearch.it")
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
		
		// 입력받은 검색어를 ArrayList에 담고 Dao에 보내기
		int priceMin = Integer.valueOf(request.getParameter("searchPriceMin"));
		int priceMax = Integer.valueOf(request.getParameter("searchPriceMax"));
		String what = request.getParameter("searchWhat");
		
		ArrayList searchList = new ArrayList();
		
		searchList.add(priceMin);
		searchList.add(priceMax);
		searchList.add(what);
				
		ItemService itService = new ItemService();
		
		ArrayList<Item> resultList = new ArrayList<>();
		
		resultList = itService.searchResult(searchList);
		int resultCount = resultList.size();
		
		if(resultList != null) {
			request.setAttribute("searchResult", resultList);	
			request.setAttribute("resultCount", resultCount);
			request.getRequestDispatcher("views/item/itemResult.jsp").forward(request, response);
		}else {
			System.out.println("널 이야~");
		}
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
