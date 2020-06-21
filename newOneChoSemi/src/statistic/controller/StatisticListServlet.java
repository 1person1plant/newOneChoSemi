package statistic.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import statistic.model.service.StatService;
import statistic.model.vo.Statistic;

/**
 * Servlet implementation class StatisticListServlet
 */
@WebServlet("/list.st")
public class StatisticListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatisticListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//이번달 매출 값을 가져오자
		StatService ss=new StatService();
		
		ArrayList<Statistic> sales=ss.selectSales();
		
		
		//통계값을 가져오자
		
		Statistic stat=ss.selectStatistic();
		
		if(!sales.isEmpty()&&stat!=null) {
			
			request.setAttribute("stat", stat);
			request.setAttribute("sales", sales);
			request.getRequestDispatcher("views/admin/statistic.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "통계 조회 실패");
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
