package karaoke.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import karaoke.model.service.KaraokeService;
import karaoke.model.vo.Attachment;
import karaoke.model.vo.Karaoke;
import member.model.vo.Address;
import member.model.vo.Member;


/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/insert.ko")
public class KaraokeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KaraokeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8"); 
		 
		 if(ServletFileUpload.isMultipartContent(request)) {
				int maxSize = 1024 * 1024 * 10; // 10Mbyte
				String root = request.getSession().getServletContext().getRealPath("/");
				String savePath = root + "img/Karaoke/";
				
				System.out.println(savePath);
				
			
			
			/*
				cos.jar에서 파일 명 변환하는 클래스를 제공하고 있음
				== DefaultFileRenamePolicy
					: 같은 파일 명이 존재하는지 검사하고 있을 경우에는 파일 명 뒤에 숫자를 붙여줌
						ex) aaa.jpg, aaa1.jpg, aaa2.jpg
						
				MultipartRequest mr = new MultipartRequest(
						request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
			*/
			
				MultipartRequest multiRequest
					= new MultipartRequest(request, savePath, maxSize,
											"UTF-8", new MyFileRenamePolicy());	
				
				// 바뀐 파일의 이름을 저장할 ArrayList
				ArrayList<String> saveFiles = new ArrayList<String>();
				// 원본 파일의 이름을 저장할 ArrayList
				ArrayList<String> originFiles = new ArrayList<String>();
				
				//!!!!!!!!******
				Enumeration<String> files = multiRequest.getFileNames();
				// getFileNames() : 폼에서 전송된 파일 리스트들의 name 반환
				
				while(files.hasMoreElements()) {
					String name = files.nextElement();
					
					if(multiRequest.getFilesystemName(name) != null) {
						saveFiles.add(multiRequest.getFilesystemName(name));
						originFiles.add(multiRequest.getOriginalFileName(name));
						
					}
				}
				System.out.println(originFiles.size());
				
				String kname = multiRequest.getParameter("kname");
				String postnum = multiRequest.getParameter("sample4_postcode");
				String address = multiRequest.getParameter("sample4_roadAddress");
				String jibunAddress = multiRequest.getParameter("sample4_jibunAddress");
				String addressDetail = multiRequest.getParameter("sample4_detailAddress");
				int one = Integer.parseInt(multiRequest.getParameter("one"));
				int three = Integer.parseInt(multiRequest.getParameter("three"));
				String otime = multiRequest.getParameter("startTime");
				String ctime = multiRequest.getParameter("endTime");
				String time= otime + " ~ " + ctime;
				String user = multiRequest.getParameter("id");

				System.out.println(user);
				
				Address a = new Address();
				a.setPostNum(postnum);
				a.setRoadAddress(address);
				a.setAddress_detail(addressDetail);
				a.setJibunAddress(jibunAddress);
				a.setId(user);
				System.out.println("여기" + a.getRoadAddress() + "ㄴㄴ" + a.getAddress_detail() + "ㄴㄴ" + a.getId()  + "ㄴㄴ" + a.getPostNum());
				
				int addressCode = new KaraokeService().insertAddress(a);
				System.out.println(addressCode);
				
				Karaoke k = new Karaoke();
				k.setKaraokeName(kname);
				k.setOneCoin(one);
				k.setThreeCoin(three);
				k.setTime(time);
				k.setRefId(user);
				k.setAddressCode(addressCode);
				
				
				ArrayList<Attachment> fileList = new ArrayList<Attachment>();
				for(int i = originFiles.size() -1; i >=0; i--) {
					Attachment at = new Attachment();
					at.setFilePath(savePath);
					at.setOriginName(originFiles.get(i));
					at.setChangeName(saveFiles.get(i));
					
					if(i == originFiles.size() -1) {
						at.setFileLevel(0);
					} else {
						at.setFileLevel(1);
					}
					
					fileList.add(at);
				}
				int result = new KaraokeService().insertKaroke(k, fileList);
				
				if(result > 0) {
					response.sendRedirect("list.ko");
				} else {
					for(int i=0;i<saveFiles.size();i++) {
						File failedFile = new File(savePath + saveFiles.get(i));
						failedFile.delete();
					}
					request.setAttribute("msg", "노래방 정보 입력에 실패했습니다.");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
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
