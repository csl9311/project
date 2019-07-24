package member.model.dao;

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
						rset.getString("gender"),
						rset.getString("address"),
						rset.getString("email"),
						rset.getString("grade"),
						rset.getString("status"),
						rset.getDate("birth"),
						rset.getDate("regdate"),
						rset.getDate("modifydate"),
						rset.getInt("point")
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
		ResultSet rset = null;
		Member member = null;
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				member = new Member(
						rset.getString("id"),
						rset.getString("pw"),
						rset.getString("name"),
						rset.getString("phone"),
						rset.getString("gender"),
						rset.getString("address"),
						rset.getString("email"),
						rset.getString("grade"),
						rset.getString("status"),
						rset.getDate("birth"),
						rset.getDate("regdate"),
						rset.getDate("modifydate"),
						rset.getInt("point")
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getGender());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getGrade());
			pstmt.setString(7, member.getId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
