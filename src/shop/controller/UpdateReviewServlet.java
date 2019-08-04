package shop.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import member.model.vo.Member;
import shop.model.service.ShopService;
import shop.model.vo.RAttachment;
import shop.model.vo.Review;


@WebServlet("/updateReview.do")

public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateReviewServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ShopService service = new ShopService();
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getId();
		
		int result = 0;
		System.out.println("서블렛 들어옴");
		
		///// 사진
		if (ServletFileUpload.isMultipartContent(request)) {
			System.out.println("if문 들어옴");
			int maxSize = 1024 * 1024 * 10;// 10Mbyte
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "review_uploadFiles/";
			System.out.println(savePath);
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while (files.hasMoreElements()) {
				String name = files.nextElement();

				if (multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			System.out.println(originFiles.size());
			System.out.println(originFiles);
			
			ArrayList<RAttachment> fileList = new ArrayList<RAttachment>();
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				RAttachment at = new RAttachment();
				at.setFilePAth(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));

				fileList.add(at);
			}
			
			int rId = Integer.parseInt(multiRequest.getParameter("rId"));
			String rContent = multiRequest.getParameter("rContent");
			Date date = new Date(new GregorianCalendar().getTimeInMillis());
			String str = "Review";
			
			result = service.selectWriter(userId, rId, str);
			
			if(result > 0) {
			Review r = new Review();
			r.setrId(rId);
			r.setrContent(rContent);
			r.setModifyDate(date);
			
			result = service.updateReview(r, fileList);
			}
		}
		///// 사진
		
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
