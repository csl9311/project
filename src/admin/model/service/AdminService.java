package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminDAO;
import member.model.vo.Member;

public class AdminService {

	public int getListCount() {
		Connection conn = getConnection();
		int result = new AdminDAO().getListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<Member> selectList(int currentPage) {
		Connection conn = getConnection();
		ArrayList <Member> list = new AdminDAO().selectList(conn,currentPage);
		close(conn);
		return list;
	}
}
