package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Address;

@WebServlet("/address.update")
public class AddressUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddressUpdate() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int address_code = Integer.parseInt(request.getParameter("address_code"));
		String postNum = request.getParameter("postNum");
		String address = request.getParameter("address");
		String address_detail = request.getParameter("address_detail");
		
		Address add = new Address(address_code, postNum, address, address_detail);
		int result = new MemberService().addressUpdate(add);
		
		String id = request.getParameter("member_id");
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
