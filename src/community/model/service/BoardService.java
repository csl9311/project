package community.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import community.model.dao.BoardDAO;
import community.model.vo.Board;
import community.model.vo.Reply;

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

	public Board boardDetail(int bid) {
		Connection conn = getConnection();
		Board board = new BoardDAO().boardDetail(conn,bid);
		close(conn);
		
		return board;
	}

	public void updateCount(int bid) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().updateCount(conn,bid);
		//커밋을 해줘야하기때문에 정수형 변수가 필요하다
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
	}

	public ArrayList<Reply> selectReplyList(int bid) {
		Connection conn = getConnection();
		ArrayList<Reply> list = new BoardDAO().selectReplyList(conn,bid);
		close(conn);
		
		return list;
	}

	public ArrayList<Reply> insertReply(Reply r) {
		Connection conn = getConnection();
		BoardDAO dao = new BoardDAO();
		
		int result = dao.insertReply(conn,r);
		
		ArrayList<Reply> rlist = null;
		
		if(result > 0) {
			commit(conn);
			rlist = dao.selectReplyList(conn, r.getRefBid());
		}else {
			rollback(conn);
		}
		close(conn);
		return rlist;
	}

	public int insertGood(Board b) {
		
		Connection conn  = getConnection();
		BoardDAO dao =  new BoardDAO();
		
		int result = dao.insertGood(conn,b);
		
		if(result>0) {
			dao.insertGoodDB(conn,b);
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
			
		
	}


	
}