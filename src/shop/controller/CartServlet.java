package shop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		HttpSession session = request.getSession();		
		String userId = session.getId();
		String pid = request.getParameter("pId");
		String pname = request.getParameter("pName");
		String price = request.getParameter("price");
		String brand = request.getParameter("brand");
		String stock = request.getParameter("stock");
		String sellcount =request.getParameter("sellCount");
		String option = request.getParameter("option");
		String amount = request.getParameter("amount");
		String ur= request.getParameter("ur");
		String info=null;
		System.out.println("user="+option);
		System.out.println("user="+userId);
		String st=request.getHeader("referer");
	
		info= pid +"/"+pname +"/"+ price +"/"+ brand +"/"+ stock +"/"+ sellcount +"/"+ option +"/"+ amount;
		System.out.println("info= "+info);
		
		
		int result= new ShopService().insertCart(userId,info);
		
		if(result>0) {
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니에 추가되었습니다.');");
			out.println("</script>");
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
