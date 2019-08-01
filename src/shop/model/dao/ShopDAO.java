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
import shop.model.vo.Answer;
import shop.model.vo.Review;

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
	public int getAllListCount(Connection conn) {
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
		int posts = 8;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		String query = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pList;

	}
	
	// 카테고리 페이지 검색어 입력시 총 수량 카운팅
	public int getKeyListCount(Connection conn, String cName, String key) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("getKeyListCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cName);
			pstmt.setString(2, "%" + key +"%");
			pstmt.setString(3, "%" + key +"%");
			pstmt.setString(4, "%" + key +"%");
			
			
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
	
	// 카테고리 페이지 정렬기준 선택시 상품 리스트 반환
	public ArrayList<Product> selectSortList(Connection conn, String cName, String sortBy, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();

		int posts = 8;

		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;

		String query = prop.getProperty("selectSortList"+sortBy);
		
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
	
	// 상품 클릭시 해당 상품 반환
	public Product selectProduct(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		
		String query = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			
			rset = pstmt.executeQuery();
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
	
	// 상품에 옵션이 있을 시, 옵션 반환
	public String selectOption(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product option = null;
		
		String query = prop.getProperty("selectOption");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				option = new Product(
							rset.getString("product_op")); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return option.getOption();
	}
	
	// 카테고리 페이지 키워드와 정렬기준이 선택되었을 경우 해당 상품 리스트 반환
	public ArrayList<Product> selectKeySortList(Connection conn, String cName, String sortBy, int currentPage, String key) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();

		int posts = 8;

		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;

		String query = prop.getProperty("selectKeySortList"+sortBy);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cName);
			pstmt.setString(2, "%" + key +"%");
			pstmt.setString(3, "%" + key +"%");
			pstmt.setString(4, "%" + key +"%");
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);
			
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
	
	// 카테고리내부 키워드 입력시 해당 리스트 반환
	public ArrayList<Product> selectkeyList(Connection conn, String cName, int currentPage, String key) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();

		int posts = 8;

		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;

		String query = prop.getProperty("selectKeyList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + key +"%");
			pstmt.setString(2, "%" + key +"%");
			pstmt.setString(3, "%" + key +"%");
			pstmt.setString(4, cName);
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);
			
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
	
	// 메인 페이지 정렬기준 선택시 해당 리스트 반환
	public ArrayList<Product> selectSortMainList(Connection conn, int currentPage, String sortBy) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();

		int posts = 8;

		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;

		String query = prop.getProperty("selectSortMainList"+sortBy);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
			list.size();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 메인페이지 키워드 입력시 해당 상품들 카운팅
	public int getAllKeyListCount(Connection conn, String key) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("getAllKeyListCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + key +"%");
			pstmt.setString(2, "%" + key +"%");
			pstmt.setString(3, "%" + key +"%");
			
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

	// 메인 페이지 키워드와 정렬기준 선택시 해당 리스트 반환
	public ArrayList<Product> selectKeySortMainList(Connection conn, int currentPage, String sortBy, String key) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();

		int posts = 8;

		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;

		String query = prop.getProperty("selectKeySortMainList"+sortBy);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + key +"%");
			pstmt.setString(2, "%" + key +"%");
			pstmt.setString(3, "%" + key +"%");
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
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

	// 메인 페이지 키워드 입력시 해당 리스트 반환
	public ArrayList<Product> selectAllkeyList(Connection conn, int currentPage, String key) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();

		int posts = 8;

		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;

		String query = prop.getProperty("selectAllKeyList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + key +"%");
			pstmt.setString(2, "%" + key +"%");
			pstmt.setString(3, "%" + key +"%");
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
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
	
	// 카테고리페이지 키워드와 품절 포함 체크시 해당 수량 카운팅
	public int getKeyNStockListCount(Connection conn, String cName, String key) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("getKeyNStockListCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cName);
			pstmt.setString(2, "%" + key +"%");
			pstmt.setString(3, "%" + key +"%");
			pstmt.setString(4, "%" + key +"%");
			
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
	
	// 카테고리 페이지 품절 포함 체크시 해당 수량 카운팅
	public int getStockListCount(Connection conn, String cName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("getStockListCount");
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
	
	// 메인 페이지 키워드와 품절 포함 체크시 해당 수량 카운팅
	public int getAllKeyNStockListCount(Connection conn, String key) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("getAllKeyNStockListCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + key +"%");
			pstmt.setString(2, "%" + key +"%");
			pstmt.setString(3, "%" + key +"%");
			
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
	
	// 메인페이지 품절 포함 체크시 해당 수량 카운팅
	public int getAllStockListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("getAllStockListCount");

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
	
	// 사용자의 상품평과 QnA 리스트 
	public ArrayList<Review> selectReviewList(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = null;
		
		String query = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Review>();
			while(rset.next()) {
				Review r = new Review( rset.getInt("rId"),
									  rset.getInt("rType"),
									  rset.getInt("pId"),
									  rset.getString("rWriter"),
									  rset.getString("rTitle"),
									  rset.getString("rContent"),
									  rset.getInt("rCount"),
									  rset.getDate("modify_date"));
				list.add(r);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return list;
	}
	
	// 관리자의 리뷰답변과 QnA 리스트
	public ArrayList<Answer> selectAnswerList(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Answer> list = null;
		
		String query = prop.getProperty("selectAnswerList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Answer>();
			while(rset.next()) {
				Answer a = new Answer( rset.getInt("aId"),
						  rset.getInt("aType"),
						  rset.getInt("pId"),
						  rset.getInt("a_rId"),
						  rset.getString("aWriter"),
						  rset.getString("aTitle"),
						  rset.getString("aContent"),
						  rset.getInt("aCount"),
						  rset.getDate("modify_date"));
				list.add(a);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
