package item.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.model.service.ItemService;

/**
 * Servlet implementation class ItemDeleteServlet
 */
@WebServlet("/delete.it")
public class ItemDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//테이블에서 삭제 눌렀을 때, 모달 안에서 삭제 눌렀을 때 (어떤 때이든 변수 name이 같음)
		String itemNum=request.getParameter("itemNum");
//		System.out.println("테이블 행 버튼 클릭:"+itemNum);
//		
//		String modalItemNum=request.getParameter("modalItemNum");
//		System.out.println("모달 안 버튼 클릭"+modalItemNum);
		
		//상품 판매 상태를 N로 업데이트 하러 가자
		int result=new ItemService().deleteItem(itemNum);
		
		if(result>0) {
			System.out.println("상품 조회 페이지로 이동!");
			response.sendRedirect("list.it");
			
		}else {
			
			RequestDispatcher views= request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "상품 삭제 실패");
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
