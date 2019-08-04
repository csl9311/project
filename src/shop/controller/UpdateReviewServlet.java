package shop.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import member.model.vo.Member;
import shop.model.service.ShopService;


@WebServlet("/updateReview.do")

public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateReviewServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getId();
		
		int rId = Integer.parseInt(request.getParameter("rId"));
		String rContent = request.getParameter("rContent");
		Date date = new Date(new GregorianCalendar().getTimeInMillis());
		
		ShopService service = new ShopService();
		
		String str = "Review";
		
		int result = service.selectWriter(userId, rId, str); 
		if(result > 0) {
			result = service.updateReview(rId, rContent, date);
		}
		
		JsonObject jObj = new JsonObject();
		jObj.addProperty("result", result);
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=utf-8");
		gson.toJson(jObj,response.getWriter());
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
