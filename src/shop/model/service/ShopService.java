package shop.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import product.model.vo.Product;
import shop.model.dao.ShopDAO;
import shop.model.vo.Answer;
import shop.model.vo.Review;

public class ShopService {

	public int getAllListCount() {
		Connection conn = getConnection();
		int result = new ShopDAO().getAllListCount(conn);
		close(conn);
		return result;
	}

	public int getListCount(String cName) {
		Connection conn = getConnection();
		int result = new ShopDAO().getListCount(conn, cName);
		close(conn);
		return result;
	}
	
	public ArrayList<Product> selectAllList(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ShopDAO().selectAllList(conn, currentPage);
		close(conn);
		return list;
	}

	public ArrayList<Product> selectList(int currentPage, String cName) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ShopDAO().selectList(conn, currentPage, cName);
		close(conn);
		return list;
	}

	public ArrayList<Product> selectSortList(int currentPage, String cName, String sortBy) {
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

	public ArrayList<Product> selectKeySortList(int currentPage, String cName, String sortBy, String key) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ShopDAO().selectKeySortList(conn, cName, sortBy, currentPage, key);
		close(conn);
		return list;
	}

	public ArrayList<Product> selectkeyList(int currentPage, String cName, String key) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ShopDAO().selectkeyList(conn, cName, currentPage, key);
		close(conn);
		return list;
	}

	public int getKeyListCount(String cName, String key) {
		Connection conn = getConnection();
		int result = new ShopDAO().getKeyListCount(conn, cName, key);
		close(conn);
		return result;
	}

	public ArrayList<Product> selectSortMainList(int currentPage, String sortBy) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ShopDAO().selectSortMainList(conn, currentPage, sortBy);
		close(conn);
		return list;
	}

	public int getAllKeyListCount(String key) {
		Connection conn = getConnection();
		int result = new ShopDAO().getAllKeyListCount(conn, key);
		close(conn);
		return result;
	}

	public ArrayList<Product> selectKeySortMainList(int currentPage, String sortBy, String key) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ShopDAO().selectKeySortMainList(conn, currentPage, sortBy, key);
		close(conn);
		return list;
	}

	public ArrayList<Product> selectAllkeyList(int currentPage, String key) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ShopDAO().selectAllkeyList(conn, currentPage, key);
		close(conn);
		return list;
	}

	public int getKeyNStockListCount(String cName, String key) {
		Connection conn = getConnection();
		int result = new ShopDAO().getKeyNStockListCount(conn, cName, key);
		close(conn);
		return result;
	}

	public int getStockListCount(String cName) {
		Connection conn = getConnection();
		int result = new ShopDAO().getStockListCount(conn, cName);
		close(conn);
		return result;
	}

	public int getAllKeyNStockListCount(String key) {
		Connection conn = getConnection();
		int result = new ShopDAO().getAllKeyNStockListCount(conn, key);
		close(conn);
		return result;
	}

	public int getAllStockListCount() {
		Connection conn = getConnection();
		int result = new ShopDAO().getAllStockListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<Review> selectReviewList(int pId) {
		Connection conn = getConnection();
		ArrayList<Review> list = new ShopDAO().selectReviewList(conn, pId);
		close(conn);
		return list;
	}

	public ArrayList<Answer> selectAnswerList(int pId) {
		Connection conn = getConnection();
		ArrayList<Answer> list = new ShopDAO().selectAnswerList(conn, pId);
		close(conn);
		return list;
	}
	public int insertCart(String userId, String info) {
		Connection conn = getConnection();
		int result= new ShopDAO().insertCart(conn, userId, info);
		
				
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		return result;
	}

}

