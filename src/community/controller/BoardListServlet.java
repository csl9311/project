package community.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PageInfo;
import community.model.service.BoardService;
import community.model.vo.Board;


/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/list.bo")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			BoardService service = new BoardService();
			
			int listCount = service.getListCount(); //총 개시글 갯수
			System.out.println("dd"+listCount);
			
			/******************페이지처리 ***********************/
			
			int currentPage; //현재 페이지
			int limit;		// 한 페이지에 표시될 페이징 수
			int maxPage;	//전체 페이지 중에서 가장 마지막 페이지
			int startPage; //페이징이 된 페이지중 시작 페이지
			int endPage; //페이징이 된 페이지중 마지막 페이지
			
			currentPage = 1;
			
			if(request.getParameter("currentPage")!=null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			limit = 10;
			
			maxPage =0;
			
			maxPage = (int)((double)listCount/limit +1); //페이지수 측정
			startPage = (((int)((double)currentPage/limit+0.9))-1) *limit+1;
			System.out.println("스페"+ startPage);
			System.out.println("막페"+ maxPage);
			endPage = startPage + limit -1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount , limit, maxPage, startPage,endPage);
			
			ArrayList<Board> list = new BoardService().selectList(currentPage);
		
			String page = null;
			if(list !=null) {
				page = "views/community/aviBoardListView.jsp";
				request.setAttribute("list",list);
				request.setAttribute("pi", pi);
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "게시판 조회에 실패하였습니다");
			}
			
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
