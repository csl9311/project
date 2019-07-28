package shop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PageInfo;
import product.model.vo.Product;
import shop.model.service.ShopService;

@WebServlet("/shopMain.do")
public class ShopMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShopMainServlet() {
    	super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopService service = new ShopService();
		
		int listCount = service.getAllListCount();
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		limit = 10;

		maxPage = (int) ((double) listCount / limit + 0.9);
		startPage =  (((int)((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Product> list = service.selectAllList(currentPage);
		String page = null;
		if (list != null) {
			page = "views/shop/shopMainView.jsp";
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
