package admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.Member;

public class AdminDAO {
	private Properties prop = new Properties();

	public AdminDAO() {
		String fileName = AdminDAO.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("getListCount");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if (rset.next()) {
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

	public ArrayList<Member> selectList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;

		int posts = 10;

		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;

		String query = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, 1); // 게시판 타입


			rset = pstmt.executeQuery();

			list = new ArrayList<>();

			while (rset.next()) {
				Member member = new Member(rset.getString(""), rset.getString(""), rset.getString(""),
						rset.getString(""), rset.getString(""), rset.getString(""), rset.getString(""),
						rset.getString(""), rset.getString(""), rset.getDate(""), rset.getDate(""));
				// (id, pw, name, phone, birth, gender, address, grade, status, regDate,
				// modifyDate)
				list.add(member);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
