package karaoke.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

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
		
		String query = prop.getProperty("insertAddress");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, a.getPostNum());
			pstmt.setString(2, a.getAddress());
			pstmt.setString(3, a.getAddress_detail());
			pstmt.setString(4, a.getId());
			pstmt.executeUpdate();
						
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);			
		}
		
		return result;
		
	}
	
	public int selectAddress(Connection conn, Address a) {
		Statement stmt = null;
		int result = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAddress");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
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
			pstmt.setInt(6, k.getAddressCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertAttachment");
		try {
			for(int i=0; i<fileList.size(); i++) {
				Attachment at = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return  result;
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return result;
	}

	
	public ArrayList<Karaoke> selectList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Karaoke> list = null;
		int posts = 10;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, 1);
			
			rset = pstmt.executeQuery();
			
			/*list = new ArrayList<Karaoke>();
			
			while(rset.next()) {
				Board b = new Board(rset.getInt("bId"),
									rset.getInt("btype"),
									rset.getString("cname"),
									rset.getString("btitle"),
									rset.getString("bcontent"),
									rset.getString("nickname"),
									rset.getInt("bcount"),
									rset.getDate("create_date"),
									rset.getDate("modify_date"),
									rset.getString("status"));	
				list.add(b);
			}*/
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
}
