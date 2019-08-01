package karaoke.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/list.ko")
public class KaraokeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public String getList(SearchVO param, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
	    Gson gson = new Gson();
	    DataSet set = new DataSet();
	    try {
	        int totalCnt = service.getListCnt(param);  //데이터의 전체 갯수를 가져온다.
	        int page = param.getPage();  //파라메터 page값을 받는다.
	        if (page==1){
	            param.setStartNum(1);
	            param.setEndNum(20);  //데이터를 20개씩 가져오겠다.
	        }else{
	            param.setStartNum(page+(19*(page-1)));  //10개씩 가져오고싶다면 19->9로 
	            param.setEndNum(page*20);   //20, 40, 60
	        }
	        //위에서 구한, 데이터를 가져올 시작 rownum과 끝 rownum을 값을 같이 보낸다. 이 사이의 데이터를 조회
	        List<DataVO> list = service.getList(param);  //조회한 데이터를 가져온다.
	 
	        set.setRows(list);
	        set.setTotCnt(totalCnt);
	        set.setStartNum(param.getStartNum());
	        set.setResultCode(200);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return gson.toJson(set);
	}


	출처: https://aljjabaegi.tistory.com/191 [알짜배기 프로그래머]

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		DataSet set = new DataSet();
		try {
			int totalCnt = service.selectList();
			
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
