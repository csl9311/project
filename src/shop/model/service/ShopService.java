package shop.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import product.model.vo.Product;
import shop.model.dao.ShopDAO;
import shop.model.vo.Answer;
import shop.model.vo.Payment;
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

	public ArrayList<Review> selectReviewList(int pId, int type) {
		System.out.println(1);
		Connection conn = getConnection();
		ArrayList<Review> list = new ShopDAO().selectReviewList(conn, pId, type);
		close(conn);
		return list;
	}

	public ArrayList<Answer> selectAnswerList(int pId, int type) {
		Connection conn = getConnection();
		ArrayList<Answer> list = new ShopDAO().selectAnswerList(conn, pId, type);
		close(conn);
		return list;
	}
	public int insertCart(String userId, Product product) {
		Connection conn = getConnection();
		int result= new ShopDAO().insertCart(conn, userId, product);
		
				
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		return result;
	}

	public ArrayList<Payment> selectCart(String userId) {
		Connection conn= getConnection();
		ArrayList<Payment> info = new ShopDAO().selectCart(conn, userId);
		close(conn);
		return info;
	}

	public int selectWriter(String userId, int rId, String str) {
		Connection conn = getConnection();
		int result = new ShopDAO().selectWriter(conn, userId, rId, str);
		close(conn);
		return result;
	}

	public int updateReview(int rId, String rContent, Date date) {
		Connection conn = getConnection();
		int result = new ShopDAO().updateReview(conn, rId, rContent, date);
		close(conn);
		return result;
	}

	public int updateAnswer(int a_rId, String aContent, Date date) {
		Connection conn = getConnection();
		int result = new ShopDAO().updateAnswer(conn, a_rId, aContent, date);
		close(conn);
		return result;
	}

	public Answer selectAnswer(String userId, int aId) {
		Connection conn = getConnection();
		Answer a = new ShopDAO().selectAnswer(conn, userId, aId);
		close(conn);
		return a;
	}

}

