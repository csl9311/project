package shop.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import product.model.vo.Product;
import shop.model.dao.ShopDAO;

public class ShopService {

	public int getAllListCount() {
		Connection conn = getConnection();
		int result = new ShopDAO().getListCount(conn);
		close(conn);
		return result;
	}

	public int getListCount(String cName) {
		Connection conn = getConnection();
		int result = new ShopDAO().getListCount(conn, cName);
		close(conn);
		return result;
	}

	public ArrayList<Product> selectList(int currentPage, String cName) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ShopDAO().selectList(conn, currentPage, cName);
		close(conn);
		return list;
	}

	public ArrayList<Product> selectAllList(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ShopDAO().selectAllList(conn, currentPage);
		close(conn);
		return list;
	}

	public ArrayList<Product> selectList(int currentPage, String cName, String sortBy) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ShopDAO().selectSortList(conn, cName, sortBy, currentPage);
		close(conn);
		return list;
	}

	public Product selectProduct(int pId) {
		Connection conn = getConnection();
		Product p = new ShopDAO().selectProduct(conn, pId);
		close(conn);
		return p;
	}

	public String selectOption(int pId) {
		Connection conn = getConnection();
		String option = new ShopDAO().selectOption(conn, pId);
		close(conn);
		return option;
	}

}
