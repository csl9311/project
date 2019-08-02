package shop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import product.model.vo.Product;
import shop.model.service.ShopService;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart.ca")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); //세션호출해서
		Member sessionMember = (Member)session.getAttribute("loginUser");
		String userId= sessionMember.getId();
		int pid = Integer.parseInt(request.getParameter("pId"));
		String pname = request.getParameter("pName");
		int price = Integer.parseInt(request.getParameter("price"));
		String option = request.getParameter("option");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String info=null;
		System.out.println("user="+option);
		System.out.println("user="+userId);
		
		
		if(option.equals("")) {	
			option="없음";
		}
		Product product= new Product(pid, price, amount, pname,option);
		int result= new ShopService().insertCart(userId,product);
		
		if(result>0) {
			
			response.sendRedirect(request.getHeader("referer"));
	
		} else {
	         request.setAttribute("msg", "장바구니에 넣지 못하였습니다.");
	         RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
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
