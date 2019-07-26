package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDAO;
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

	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDAO().insertMember(conn, member);
		if (result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Member loginMember(Member member) {
		Connection conn = getConnection();
		Member loginUser = new MemberDAO().loginMember(conn,member);
		
		close(conn);
		return loginUser;
	}

}
