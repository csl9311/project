package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Address;
import member.model.vo.Member;

@WebServlet("/selectMember")
public class MemberSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberSelect() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = (String)request.getParameter("id");
		Member member = new MemberService().selectMember(id);
		ArrayList<Address> addressList = new MemberService().getAddress(id);
		
		String page = "";
		if (member != null) {
			page ="views/admin/adminMember/adminMemberDetail.jsp";
			request.setAttribute("member", member);
			request.setAttribute("addressList", addressList);
		} else {
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "회원정보조회에 실패했습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
