package member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

@WebServlet("/member.signUp")
public class signUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public signUpServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 중복확인
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickName = request.getParameter("nickName");
		String name = request.getParameter("name");
		// 핸드폰 번호
		String[] phoneArr = request.getParameterValues("phone");
		String phone = "";
			if (phoneArr != null) {
				phone = String.join("-", phoneArr);
			}
		
		String gender = request.getParameter("gender");
		
		// 주소 : 데이터베이스 구상해야함.
		String postNum = request.getParameter("postNum");
		if(postNum == "") {
			
		}
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		
		String email = request.getParameter("email");
		
		// 생년월일
		String[] birthArr = request.getParameterValues("birth");
			Date birth = null;
			int year = Integer.parseInt(birthArr[0]);
			int month = Integer.parseInt(birthArr[1])-1;
			int day = Integer.parseInt(birthArr[2]);
			birth = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
			
		int news = Integer.parseInt(request.getParameter("news"));
		int sms =  Integer.parseInt(request.getParameter("sms"));
		
		Member member = new Member(id, pw, name, nickName, phone, gender, postNum, address, addressDetail, email, birth, news, sms);
		
		System.out.println(member.toString());
		
		
		int result = new MemberService().insertMember(member);
		
		String page = "";
		if(result > 0) {
			request.setAttribute("msg", "회원가입에 성공했습니다.");
			page = "views/common/mainPage.jsp";
		} else {
			request.setAttribute("msg", "회원가입에 실패했습니다.");
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
