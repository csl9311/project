package karaoke.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import karaoke.model.dao.KaraokeDAO;
import karaoke.model.vo.Attachment;
import karaoke.model.vo.Karaoke;
import member.model.vo.Address;

public class KaraokeService {
	
	public int insertAddress(Address a) {
		Connection conn = getConnection();
		
		KaraokeDAO dao = new KaraokeDAO();
		
		int result1 = dao.insertAddress(conn, a);
		int result2 = dao.selectAddress(conn, a);
		
		if(result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return  result2;

		}

	public int insertKaroke(Karaoke k, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		KaraokeDAO dao = new KaraokeDAO();
		
		int result1 = dao.insertKaraoke(conn, k);
		int result2 = dao.insertAttachment(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return  result1;

		}

	public int getListCount() {
		Connection conn = getConnection();
		int result = new KaraokeDAO().getListCount(conn);
		close(conn);
				
		return result;
	}

	public ArrayList<Karaoke> selectList(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Karaoke> list = new KaraokeDAO().selectList(conn, currentPage);
		close(conn);
		return list;
	}

	public ArrayList<Attachment> selectAlist(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Attachment> at = new KaraokeDAO().selectAlist(conn, currentPage);
		close(conn);
		return at;
	}
}
