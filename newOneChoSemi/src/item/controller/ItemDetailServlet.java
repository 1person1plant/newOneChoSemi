package item.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.model.service.ItemService;
import item.model.vo.ItemImage;

/**
 * Servlet implementation class ItemDetailServlet
 */
@WebServlet("/detail.it")
public class ItemDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pNum=request.getParameter("productNum");
		System.out.println(pNum);
		
		//이미지 가지러 가자..
		ItemImage itemImg=new ItemService().selectItemImg(pNum);
		
		if(itemImg!=null) {
			
			request.setAttribute("itemImg", itemImg);
			request.getRequestDispatcher("views/admin/itemManager.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "사진 조회 실패");
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
