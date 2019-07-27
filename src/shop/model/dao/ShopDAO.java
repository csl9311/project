package shop.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import member.model.dao.MemberDAO;
import product.model.vo.Product;

import static common.JDBCTemplate.*;

public class ShopDAO {
	private Properties prop = new Properties();
	
	public ShopDAO(){
		String fileName = MemberDAO.class.getResource("/sql/shop/shop-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("getListCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cid);
			rset = pstmt.executeQuery();
			if(rset.next()) {
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

	public ArrayList<Product> selectList(Connection conn, int currentPage, String cName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		int posts = 10;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;

		String query = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, cName);

			rset = pstmt.executeQuery();

			list = new ArrayList<Product>();
			while (rset.next()) {
				Product p = new Product(rset.getInt("pId"),
										rset.getInt("price"),
										rset.getString("pName"),
										rset.getString("bName"),
										rset.getString("cName"),
										rset.getString("sub_cname"));
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
	
	
}
