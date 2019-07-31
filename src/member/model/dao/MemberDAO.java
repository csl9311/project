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

import member.model.vo.Address;
import member.model.vo.Member;

public class MemberDAO {

	private Properties prop = new Properties();

	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 로그인정보 받아오기
	// 세션에 개인정보를 전부 담아두는게 맞는건지 모르겠다.
	// 보안 고려해서 id만 올려두고 각 기능 사용 할 때 마다 selectMember를 실행해줘야 하는건가?
	public Member loginMember(Connection conn, Member member) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		Member loginUser= null;
		
		String query= prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			rset= pstmt.executeQuery();
			if(rset.next()) {
				loginUser = new Member(
					rset.getString("id"),
					rset.getString("name")
				);
				loginUser = selectMember(conn, member.getId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return loginUser;
	}
	
	// 세션에 로그인 정보등록, 관리자페이지 상세정보 조회
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
					rset.getString("name"),
					rset.getString("nickname"),
					rset.getString("phone"),
					rset.getString("gender"),
					rset.getString("email"),
					rset.getString("grade"),
					rset.getDate("birth"),
					rset.getDate("regdate"),
					rset.getDate("modifydate"),
					rset.getInt("point"),
					rset.getInt("news"),
					rset.getInt("sms")
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
	
	public boolean pwCheck(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		boolean pwCheck = false;
		String query = prop.getProperty("pwCheck");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				pwCheck = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return pwCheck;
	}
	
	// 관리자 페이지 멤버 조회
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
						rset.getString("name"),
						rset.getString("nickname"),
						rset.getString("phone"),
						rset.getString("gender"),
						rset.getString("email"),
						rset.getString("grade"),
						rset.getDate("birth"),
						rset.getDate("regdate"),
						rset.getDate("modifydate"),
						rset.getInt("point"),
						rset.getInt("news"),
						rset.getInt("sms")
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
	
	// 회원가입
	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		// 멤버 등록
		String query = prop.getProperty("insertMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getNickName());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getGender());
			pstmt.setString(7, member.getEmail());
			pstmt.setDate(8, member.getBirth());
			pstmt.setInt(9, member.getNews());
			pstmt.setInt(10, member.getSms());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int adminUpdateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("adminUpdateMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getNickName());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getGender());
			pstmt.setString(8, member.getEmail());
			pstmt.setString(9, member.getGrade());
			pstmt.setInt(10, member.getNews());
			pstmt.setInt(11, member.getSms());
			pstmt.setString(12, member.getId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Address> getAddress(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Address> addressList = null;
		String query = prop.getProperty("getAddress");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Address address = new Address(
					rset.getInt("address_code"),
					rset.getString("postnum"),
					rset.getString("address"),
					rset.getString("address_detail")
				);
				addressList = new ArrayList<>();
				addressList.add(address);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return addressList;
	}
}
