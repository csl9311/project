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

@WebServlet("/admin.MemberUpdate")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberUpdate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String nickName = request.getParameter("nickName");
		String[] phoneArr = request.getParameterValues("phone");
		String phone = "";
		if (phoneArr != null) {
			phone = String.join("-", phoneArr);
		}
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		String grade = request.getParameter("grade");

		int news = Integer.parseInt(request.getParameter("news"));
		int sms = Integer.parseInt(request.getParameter("sms"));

		Member member = new Member(id, name, nickName, phone, gender, email, grade, birth, news, sms);
		int result = new MemberService().adminUpdateMember(member);

		String msg = "";
		if (result > 0) {
			msg = "수정 되었습니다.";
		} else {
			msg = "정보 수정에 실패했습니다.";
		}

		ArrayList<Member> list = new MemberService().selectAll();
		request.setAttribute("memberList", list);
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("views/admin/adminMember/adminMemberView.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
