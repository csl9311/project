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
		
		int result = dao.insertAddress(conn, a);
		
		if(result < 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return  result;

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
}
