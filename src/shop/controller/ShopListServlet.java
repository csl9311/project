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
import common.PageInfo;

@WebServlet("/shopList.do")
public class ShopListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShopListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ShopService service = new ShopService();

		int cid = Integer.parseInt(request.getParameter("cid"));
		String sortBy = request.getParameter("sort");
		System.out.println("정렬 기준은? : " + sortBy);
		String cName = null;
		switch (cid) {
		case 10:
			cName = "스피커";
			break;
		case 20:
			cName = "헤드셋";
			break;
		case 30:
			cName = "헤드폰이어폰";
			break;
		case 40:
			cName = "블루투스사운드";
			break;
		case 50:
			cName = "마이크";
			break;
		}

		int listCount = service.getListCount(cName);

		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;

		currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("페이지는? : " + currentPage);
		}

		limit = 8;

		System.out.println(limit);

		maxPage = (int) ((double) listCount / limit + 0.9);
		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

		String rank = "sellCount";
		ArrayList<Product> rankList = service.selectList(1, cName, rank);

		ArrayList<Product> list = null;
		System.out.println("여기서 sortBy의 값은? : " + sortBy);
		if (sortBy != null && !sortBy.equals("regdate") && !sortBy.equals("null")) {
			list = service.selectList(currentPage, cName, sortBy);
			System.out.println("들어왔니?111");
		} else {
			System.out.println("들어왔니?222");
			list = service.selectList(currentPage, cName);
		}

		String page = null;
		if (list != null) {
			page = "views/shop/shopListView.jsp";
			request.setAttribute("list", list);
			request.setAttribute("rankList", rankList);
			request.setAttribute("pi", pi);
			request.setAttribute("listCount", listCount);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회에 실패하였습니다.");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
