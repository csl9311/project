package community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import community.model.service.BoardService;
import community.model.vo.Board;
import member.model.vo.Member;

/**
 * Servlet implementation class BoardGoodServlet
 */
@WebServlet("/avigood.bo")
public class BoardGoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardGoodServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int bid = Integer.parseInt(request.getParameter("bid"));
		String writer = request.getParameter("writer");
		System.out.println(bid);
		System.out.println(writer);
		
		Board b = new Board();
		
		b.setBid(bid);
		b.setbWriter(writer);
		
		
		int result = new BoardService().insertGood(b);
		

		
		
		response.setContentType("application/json,charset = utf-8");
		
		
		if(result>0) {
			 response.sendRedirect("avidetail.bo?bid="+bid); 
			
		
		} else {
			request.setAttribute("msg","게시글 작성에 실패하였습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
