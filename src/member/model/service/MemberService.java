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

}
