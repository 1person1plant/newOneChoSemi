package item.controller.admin;

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
 * Servlet implementation class ItemStockUpdateServlet
 */
@WebServlet("/stockUpdate.it")
public class ItemStockUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemStockUpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] ids=request.getParameterValues("id");
		String[] stocks=request.getParameterValues("stock");
		
		ArrayList<Item> items=new ArrayList();
		
		for(int i=0;i<ids.length;i++) {
			System.out.println("id:"+ids[i]);
			System.out.println("stock:"+stocks[i]);
			
			Item it=new Item();
			it.setItemNo(ids[i]);
			it.setItemStock(Integer.valueOf(stocks[i]));
			
			items.add(it);
		}
		
		//재고 업데이트 하러 가즈아
		int result=new ItemService().updateStock(items);
		
		//업데이트된 재고목록 가져오기
		if(result>0) {
			
			response.sendRedirect("stock.it");
			
		}else {
			
			RequestDispatcher views= request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "재고 수정 실패");
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
