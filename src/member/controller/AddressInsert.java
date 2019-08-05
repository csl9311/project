package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Address;
import member.model.vo.Member;

@WebServlet("/address.insert")
public class AddressInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddressInsert() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String postNum = request.getParameter("postNum");
		String address = request.getParameter("address");
		String address_detail = request.getParameter("address_detail");
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		Address add = new Address(postNum, address, address_detail, id);
		
		int result = new MemberService().addressInsert(add);
		
		String page = request.getParameter("page") + "?id=" + id;
		if(result > 0) {
			request.setAttribute("msg", "수정되었습니다.");
		} else {
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
