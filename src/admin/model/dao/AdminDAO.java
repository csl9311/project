package admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import member.model.dao.MemberDAO;
import product.model.vo.Product;

public class AdminDAO {
	private Properties prop = new Properties();

	public AdminDAO() {
		String fileName = MemberDAO.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Product> getAllProduct(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;

		String query = prop.getProperty("getAllProduct");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<>();

			while (rset.next()) {
				Product p = new Product(
					rset.getInt("pid"),
					rset.getInt("price"),
					rset.getInt("stock"),
					rset.getInt("sellcount"),
					rset.getString("pname"),
					rset.getString("cname"),
					rset.getString("sub_cname"),
					rset.getString("bname"),
					rset.getString("useoption"),
					rset.getString("product_op"),
					rset.getDate("regdate"),
					rset.getDate("modify_date")
				);
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
}
