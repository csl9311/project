package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDAO;
import member.model.vo.Address;
import member.model.vo.Member;

public class MemberService {
	public ArrayList<Member> selectAll() {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDAO().selectAll(conn);
		close(conn);
		return list;
	}

	public Member selectMember(String id) {
		Connection conn = getConnection();
		Member member = new MemberDAO().selectMember(conn, id);
		close(conn);
		return member;
	}

	public int adminUpdateMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDAO().adminUpdateMember(conn, member);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	// 아이디 중복체크
	public int idCheck(String id) {
		Connection conn = getConnection();
		int result = new MemberDAO().idCheck(conn, id);
		close(conn);
		return result;
	}

	
	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDAO().insertMember(conn, member);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	

	public Member loginMember(Member member) {
		Connection conn = getConnection();
		Member loginUser = new MemberDAO().loginMember(conn, member);
		close(conn);
		return loginUser;
	}

	public boolean pwCheck(String id, String pw) {
		Connection conn = getConnection();
		boolean pwCheck = new MemberDAO().pwCheck(conn, id, pw);
		close(conn);
		return pwCheck;
	}

	public ArrayList<Address> getAddress(String id) {
		Connection conn = getConnection();
		ArrayList<Address> list = new MemberDAO().getAddress(conn, id);
		close(conn);
		return list;
	}

	public int getAddressCount(String id) {
		Connection conn = getConnection();
		int result = new MemberDAO().getAddressCount(conn, id);
		close(conn);
		return result;
	}

	public int addressUpdate(Address add) {
		Connection conn = getConnection();
		int result = new MemberDAO().addressUpdate(conn, add);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


}
