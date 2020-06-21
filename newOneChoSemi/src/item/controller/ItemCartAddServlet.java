package item.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.model.service.ItemService;
import member.model.vo.Member;

/**
 * Servlet implementation class ItemCartAddServlet
 */
@WebServlet("/cart.it")
public class ItemCartAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemCartAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String itemNo = request.getParameter("itemNo");	    
	    int itemCount = Integer.valueOf(request.getParameter("itemCount"));
	     
	    PrintWriter out = response.getWriter();
	      
	    int result = 0;
	    
	    if(((Member)request.getSession().getAttribute("loginUser")) == null) {
	    	result = -1;
	    }else if(itemCount == 0) {
	    	result = 0;
	    }else {
	    	String memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
	    	result = new ItemService().cartAdd(itemNo, memberNo, itemCount);	
	    }
	    
	    System.out.println(result);
	            
	    if(result == -1) {
	    	out.print("plzLogin");
	    }else if(result == 0) {
	    	out.print("noCount");
	    }else {
	    	out.print("success");
	    }
	      
	    out.flush();
	    out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}