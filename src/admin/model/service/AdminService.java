package admin.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminDAO;
import product.model.vo.Product;

public class AdminService {

	public ArrayList<Product> getAllProduct() {
		Connection conn = getConnection();
		ArrayList<Product> list = new AdminDAO().getAllProduct(conn);
		close(conn);
		return list;
	}

	public int insertProduct(Product p) {
		Connection conn = getConnection();
		int result = new AdminDAO().insertProduct(conn, p);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

}
