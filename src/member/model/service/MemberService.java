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

	public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDAO().updateMember(conn, member);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


}
