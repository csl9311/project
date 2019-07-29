package shop.model.dao;

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

import member.model.dao.MemberDAO;
import product.model.vo.Product;

public class ShopDAO {
	private Properties prop = new Properties();

	public ShopDAO() {
		String fileName = MemberDAO.class.getResource("/sql/shop/shop-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 메인페이지 전체 카운팅
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("getAllListCount");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return result;
	}
	
	// 메인페이지 전부 list로 리턴하는 메소드
	public ArrayList<Product> selectAllList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;

		int posts = 8;

		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;

		String query = prop.getProperty("selectAllList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Product>();
			while (rset.next()) {
				Product p = new Product(rset.getInt("pId"), 
										rset.getInt("price"), 
										rset.getString("pName"),
										rset.getString("cName"), 
										rset.getString("sub_cname"), 
										rset.getString("bName"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}
	
	// 카테고리 카운팅
	public int getListCount(Connection conn, String cName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("getListCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cName);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	// 카테고리 리스트
	public ArrayList<Product> selectList(Connection conn, int currentPage, String cName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> pList = null;
		System.out.println("받은 cName은?:" + cName);
		int posts = 8;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		System.out.println("시작페이지는? : " + startRow);
		System.out.println("마지막페이지는? : " + endRow);
		String query = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			System.out.println("쿼리는?: " + query);
			rset = pstmt.executeQuery();
			System.out.println("rset : " + rset);
			pList = new ArrayList<Product>();
			while (rset.next()) {
				Product p = new Product(rset.getInt("pId"), 
										rset.getInt("price"), 
										rset.getString("pName"),
										rset.getString("cName"), 
										rset.getString("sub_cname"), 
										rset.getString("bName"));
				pList.add(p);
			}
			System.out.println("사이즈는? : " + pList.size());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pList;

	}
	
	// 정렬
	public ArrayList<Product> selectSortList(Connection conn, String cName, String sortBy, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();

		int posts = 8;

		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;

		String query = prop.getProperty("selectSortList"+sortBy);
		System.out.println(query);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				Product p = new Product(rset.getInt("pId"), 
										rset.getInt("price"), 
										rset.getString("pName"),
										rset.getString("cName"), 
										rset.getString("sub_cname"), 
										rset.getString("bName"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public Product selectProduct(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		
		String query = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			
			rset = pstmt.executeQuery();
			System.out.println("rset1:" + rset);
			if(rset.next()) {
				p = new Product(rset.getInt("pid"),
								rset.getInt("price"),
								rset.getInt("stock"),
								rset.getInt("sellCount"),
								rset.getString("pname"),
								rset.getString("cname"),
								rset.getString("sub_cname"),
								rset.getString("bname"),
								rset.getString("useoption"),
								rset.getDate("regDate"),
								rset.getDate("modify_date"));
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}

	public String selectOption(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product option = null;
		
		String query = prop.getProperty("selectOption");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			System.out.println("pId: " + pId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				option = new Product(
							rset.getString("product_op")); 
			}
			System.out.println("option : " + option.getOption());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return option.getOption();
	}

}
