package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

@WebServlet("/member.login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Member member = new Member(userId, userPwd);
		Member loginUser = new MemberService().loginMember(member);
		// 각 페이지에서 페이지 정보 받아온 후
		String page ="";
		if (loginUser != null) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(600);
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getHeader("referer"));
		} else {
			request.setAttribute("msg", "로그인 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
