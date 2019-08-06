package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import product.model.vo.Product;

@WebServlet("/product.select")
public class AdminProductSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminProductSelect() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("서블릿 접근");
		int pId = Integer.parseInt(request.getParameter("pId"));
		Product product = new AdminService().selectProduct(pId);

		String page = "";
		if (product != null) {
			page = "views/admin/adminProduct/admin_productDetail.jsp";
			request.setAttribute("product", product);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상품정보조회에 실패했습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
