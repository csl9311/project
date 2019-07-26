package community.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import community.model.dao.BoardDAO;
import community.model.vo.Board;

public class BoardService {

	
	
	public int insertBoard(Board b) {
		Connection conn =  getConnection();
		int result = new BoardDAO().insertBoard(conn,b);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;

}

	public int getListCount() {
		Connection conn = getConnection();
		int result = new BoardDAO().getListCount(conn);
		
		close(conn);
		return result;
	}

	public ArrayList<Board> selectList(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDAO().selectList(conn,currentPage);
		close(conn);
		
		return list;
		
	}

	/*
	 * public Board boardDetail(int bid) { Connection conn = getConnection(); int
	 * result = new BoardDAO().boardDetail(conn,bid); close(conn);
	 * 
	 * return result; }
	 */
	
}
