package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import common.PageInfo;
import member.model.vo.Member;

@WebServlet("/member.list")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminService service = new AdminService();
		int listCount = service.getListCount();
		
		/***************** 페이징처리 *******************/

		int currentPage; // 현재 페이지
		int limit; // 한 페이지에 표시 될 페이징 수
		int maxPage; // 전체 페이지 중 가장 마지막 페이지
		int startPage; // 페이징이 된 페이지 중 시작 페이지
		int endPage; // 페이징이 된 페이지 중 마지막 페이지

		currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		limit = 10;

		maxPage = (int) ((double) listCount / limit + 0.9);
		// listCount가 10으로 나눴을 때 안맞아떨어지면 페이지 1 증가, 맞아떨어지면 0.9 버림

		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		ArrayList<Member> list = service.selectList(currentPage);

		String page = null;
		if (list != null) {
			page = "views/board/boardListView.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회에 실패하였습니다.");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
