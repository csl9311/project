package admin.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin.MemberUpdate")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberUpdate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = (String)request.getAttribute("id");
		String name = (String)request.getAttribute("name");
		String[] phone = (String[])request.getAttribute("phone");
		String gender = (String)request.getAttribute("gender");
		String email = (String)request.getAttribute("email");
		String address = (String)request.getAttribute("address");
		String grade = (String)request.getAttribute("grade");
		Date birth = (Date)request.getAttribute("birth");
		Date modifyDate = (Date)request.getAttribute("modifyDate");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
