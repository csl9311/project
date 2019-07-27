package community.model.dao;

import static common.JDBCTemplate.close;

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

import community.model.vo.Board;

public class BoardDAO {

	private Properties prop = new Properties();

	public BoardDAO() {
		String fileName = BoardDAO.class.getResource("/sql/board/board-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} // 쿼리문을 DAO에 받아오는곳

	public int insertBoard(Connection conn, Board b) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAVIBoard");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setString(3, b.getbWriter());
			pstmt.setString(4, b.getbAddress());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;

		int result = 0;

		String query = prop.getProperty("getListAVICount");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return result;
	}

	public ArrayList<Board> selectList(Connection conn, int currentPage) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		int posts = 9; // 한 페이지에서 보여질 게시글 갯수

		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		System.out.println("스타트" + startRow);
		System.out.println("끝" + endRow);
		String query = prop.getProperty("selectAVIList");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			list = new ArrayList<Board>();

			while (rset.next()) {
				Board b = new Board(rset.getInt("bid"), rset.getInt("btype"), rset.getString("btitle"),
						rset.getString("byoutubeaddress"), rset.getString("bcontent"), rset.getString("bwriter"),
						rset.getInt("bcount"), rset.getInt("bgood"), rset.getDate("create_date"),
						rset.getDate("modify_date"), rset.getString("status"));
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}

	public Board boardDetail(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board board = null;
		
		String query = prop.getProperty("boardAVIDetail");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				board = new Board(rset.getInt("bid"), rset.getInt("btype"), rset.getString("btitle"),
						rset.getString("byoutubeaddress"), rset.getString("bcontent"), rset.getString("bwriter"),
						rset.getInt("bcount"), rset.getInt("bgood"), rset.getDate("create_date"),
						rset.getDate("modify_date"), rset.getString("status"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return board;
	}

	public int updateCount(Connection conn, int bid) {
		PreparedStatement pstmt =null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			pstmt.setInt(2, bid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
