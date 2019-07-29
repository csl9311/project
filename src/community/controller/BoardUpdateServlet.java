package community.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/aviupdate.bo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bid = Integer.parseInt(request.getParameter("bid"));
		System.out.println(bid);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String date = request.getParameter("modifyDate");
		String writer = request.getParameter("writer");
		String address = request.getParameter("address");
		System.out.println("날짜"+date);
		Date sqlDate = null;
		
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String writer2 = loginUser.getNickName();
		String page = null;
		
		System.out.println("작성1:"+writer);
		System.out.println("작성2:"+writer2);
		if(date !=null) {
			String[] dateArr = date.split("-");
			int year = Integer.parseInt(dateArr[0]);
			int month = Integer.parseInt(dateArr[1])-1;
			int day = Integer.parseInt(dateArr[2]);
			
			sqlDate = new Date(
							new GregorianCalendar(year,month,day).getTimeInMillis());
						//1/1000초 변환까지 해줘야함 .getTimeInMillis
		}else {
			sqlDate = new Date(
					new GregorianCalendar().getTimeInMillis());
		}
	
		Board board = new Board();
		board.setBid(bid);
		board.setbTitle(title);
		board.setbContent(content);
		board.setModifyDate(sqlDate);
		board.setbAddress(address);
		int result = new BoardService().updateBoard(board);
		
		
		
		if(result>0) {
			page ="/detail.bo?bid=" + bid;
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 수정에 실패하였습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
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
