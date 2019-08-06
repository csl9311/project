package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import member.model.vo.Payment;
import shop.model.service.ShopService;
import shop.model.vo.PAttachment;


@WebServlet("/selectPayment.do")
public class SelectPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectPaymentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PAYMENT Servlet들어옴?");

		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getId();
		
		MemberService memberService = new MemberService();
		
		ShopService shopService = new ShopService();
		
		ArrayList<Payment> payList = memberService.selectPayment(userId); 
		ArrayList<PAttachment> picList = shopService.selectAllPAttachmentList();
		
		String page = null;
		if (payList != null) {
			page = "views/MyPage/purchase.jsp";
			request.setAttribute("payList", payList);
			request.setAttribute("picList", picList);
			System.out.println(picList.size());
			System.out.println(payList.size());
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회에 실패하였습니다.");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
