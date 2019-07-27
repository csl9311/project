package shop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.vo.Product;
import shop.model.service.ShopService;
import shop.model.vo.PageInfo;

@WebServlet("/shopList.do")
public class ShopListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShopListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopService service = new ShopService();
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		int listCount = service.getListCount(cid);
		
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
		
		String cName = null;
		switch(cid) {
		case 10: cName = "스피커"; break;
		case 20: cName = "헤드셋"; break;
		case 30: cName = "헤드폰/이어폰"; break;
		case 40: cName = "블루투스 사운드"; break;
		case 50: cName = "마이크"; break;
		}
		
		ArrayList<Product> list = service.selectList(currentPage, cName);

		String page = null;
		if (list != null) {
			page = "views/shop/shopListView.jsp";
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
