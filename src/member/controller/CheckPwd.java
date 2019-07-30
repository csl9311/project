package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;

@WebServlet("/checkpwd.me")
public class CheckPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckPwd() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userPwd = (String) request.getParameter("pwd");
		System.out.println("ㅇㅇ" + userPwd);
		HttpSession session = request.getSession(true);
		Member sessionMember = (Member) session.getAttribute("loginUser");
		String userPwd2 = sessionMember.getPw();
		System.out.println("userPwd2" + userPwd2);

		String page = null;
		if (!userPwd.equals(userPwd2)) {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
		} else {
			page = "views/MyPage/upDate.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
