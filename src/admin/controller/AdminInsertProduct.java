package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.dao.AdminDAO;
import admin.model.service.AdminService;
import product.model.vo.Product;

@WebServlet("/product.insert")
public class AdminInsertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminInsertProduct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminService service = new AdminService();
		int price = Integer.parseInt(request.getParameter("price"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		int brandNo = Integer.parseInt(request.getParameter("brand"));
		int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
		int subCategoryNo = Integer.parseInt(request.getParameter("subCate"));
		String pName = request.getParameter("name");
		String useOption = request.getParameter("option");

		Product p = new Product(price, stock, brandNo, categoryNo, subCategoryNo, pName, useOption);
		int result = service.insertProduct(p);
		if (result > 0) {
			System.out.println("상품등록성공");
		} else {
			System.out.println("상품등록실패");
		}

		String option1 = request.getParameter("option1");
		String option2 = request.getParameter("option2");
		String option3 = request.getParameter("option3");
		String optionResult = "";
		if (useOption.equals("Y")) {
			if (option1.equals("")) {
				optionResult = "";
			} else if (option2.equals("")) {
				optionResult = option1;
			} else if (option3.equals("")) {
				optionResult = option1 + "/" + option2;
			} else {
				optionResult = option1 + "/" + option2 + "/" + option3;
			}
//			result = service.insertOption(optionResult);
			if(result > 0) {
				
			}
		}

		String page = "";
		if (result > 0) {
			page = "views/admin/adminProduct/admin_procductView.jsp";
			request.setAttribute("alert", "상품이 등록되었습니다.");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상품등록에 실패했습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
		;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
