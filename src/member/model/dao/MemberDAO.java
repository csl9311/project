package member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static common.JDBCTemplate.*;
import member.model.vo.Member;

public class MemberDAO {

	private Properties prop = new Properties();

	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Member> selectAll(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;

		String query = prop.getProperty("selectAllMember");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<>();
		
			while (rset.next()) {
				Member member = new Member(
						rset.getString("id"),
						rset.getString("pw"),
						rset.getString("name"),
						rset.getString("phone"),
						rset.getDate("birth"),
						rset.getString("gender"),
						rset.getString("address"),
						rset.getString("email"),
						rset.getString("grade"),
						rset.getString("status"),
						rset.getDate("regdate"),
						rset.getDate("modifydate")
				);
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public Member selectMember(Connection conn, String id) {
		PreparedStatement pstmt = null;
		Member member = null;
		
		try {
			pstmt = conn.prepareStatement("selectMember");
			pstmt.setString(1, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return member;
	}

}
