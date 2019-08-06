package karaoke.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.jrockit.jfr.RequestDelegate;

import karaoke.model.service.KaraokeService;
import karaoke.model.vo.Review;

/**
 * Servlet implementation class KaraokeReplyServlet
 */
@WebServlet("/reply.ko")
public class KaraokeReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KaraokeReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String krwriter = request.getParameter("krwriter");
		int ref_kid = Integer.parseInt(request.getParameter("ref_kid"));
		int krating = Integer.parseInt(request.getParameter("krating"));
		String krcontent = request.getParameter("krcontent");
		
		int result = new KaraokeService().selectReview(krwriter);
		if(result > 0) {
			out.println("<script language='javascript'>");
			out.println("alert('등록되었습니다.');");
			out.println("location.href = '../main/main.jsp';");
			out.println("</script>");
		}else{
			out.println("<script language='javascript'>");
			out.println("alert('수행중 에러발생');");
			out.println("location.href = '../main/main.jsp';");
			out.println("</script>");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
