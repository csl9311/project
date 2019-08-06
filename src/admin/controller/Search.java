package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

@WebServlet("/admin.search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Search() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		
		ArrayList<?> list = new MemberService().search(keyword);
		
		if(list != null) {
			request.setAttribute("memberList", list);
			request.getRequestDispatcher("").forward(request, response);;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
