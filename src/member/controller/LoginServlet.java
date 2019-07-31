package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String userId = request.getParameter("userId");
		 String userPwd = request.getParameter("userPwd");
		 String location = request.getParameter("location");
		 System.out.println(location);
		 Member member = new Member(userId,userPwd);
		 
		 Member loginUser= new MemberService().loginMember(member);
		 if(loginUser != null) {
	         HttpSession session = request.getSession();
	         session.setMaxInactiveInterval(600);
	         session.setAttribute("loginUser", loginUser);
	         response.sendRedirect("index.jsp");
<<<<<<< HEAD
	     
=======
>>>>>>> refs/remotes/origin/master
	      } else {
	         request.setAttribute("msg", "로그인 실패");
	         RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
	         view.forward(request, response);
	      }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
