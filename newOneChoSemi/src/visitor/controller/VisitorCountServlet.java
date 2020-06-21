package visitor.controller;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import visitor.model.service.VisitorService;

/**
 * Servlet implementation class VisitorCountServlet
 */
@WebServlet("/count.vi")
public class VisitorCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisitorCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String ip=request.getParameter("id");
		String id=request.getParameter("ip");
		
		
		System.out.println("방문자의session:"+id);
		System.out.println("방문자의ip"+ip);
		
		//ip주소를 디비에 넣어보자~
		VisitorService vs=new VisitorService();
		
		int result=vs.addIp(ip,id);
		
		PrintWriter out=response.getWriter();
		
		System.out.println(result);
		
		if(result>0) {
			
			out.print("success");
			
		}else {
		
			
			out.print("fail");
			
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
