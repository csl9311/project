package karaoke.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import karaoke.model.vo.Attachment;
import karaoke.model.vo.Karaoke;
import member.model.vo.Address;

public class KaraokeDAO {
	private Properties prop = new Properties();
	public KaraokeDAO() {
		String fileName
			= KaraokeDAO.class.getResource("/sql/Karaoke/Karaoke-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertAddress(Connection conn, Address a) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query1 = prop.getProperty("insertAddress");
		String query2 = prop.getProperty("selectAddress");
		
		try {
			pstmt = conn.prepareStatement(query1);
			pstmt.setString(1, a.getPostNum());
			pstmt.setString(2, a.getAddress());
			pstmt.setString(3, a.getAddress_detail());
			pstmt.executeUpdate();
			
			pstmt			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);			
		}
		return result;
	}
	
	public int insertKaraoke(Connection conn, Karaoke k) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertKaraoke");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, k.getRefId());
			pstmt.setString(2, k.getKaraokeName());
			pstmt.setInt(3, k.getOneCoin());
			pstmt.setInt(4, k.getThreeCoin());
			pstmt.setString(5, k.getTime());
			pstmt.setString(6, k.getpostNum());
			pstmt.setInt(7, k.getAddressCode());
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return 0;
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		// TODO Auto-generated method stub
		return 0;
	}


}
