package payment.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import member.model.dao.MemberDAO;
import payment.model.vo.Payment;
import shop.model.vo.Cart;

public class PaymentDAO {
	
	private Properties prop = new Properties();

	public PaymentDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/payment-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Payment> selectPayment(Connection conn, String userId) {
		System.out.println("DAO 들어옴?");
		PreparedStatement pstmt = null;
		ResultSet r = null;
		ArrayList<Payment> pArr = new ArrayList<Payment>();
		Payment p = new Payment();

		String query = prop.getProperty("selectPayment");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);

			r = pstmt.executeQuery();

			while (r.next()) {
				p = new Payment(r.getInt("oNo"), r.getString("userId"), r.getString("phone"), r.getInt("pId"),
						r.getInt("price"), r.getInt("amount"), r.getString("pName"), r.getString("pOption"),
						r.getDate("pay_date"), r.getString("address"), r.getString("history"));
				pArr.add(p);
				System.out.println("pArr.size() : " + pArr.size());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(r);
			close(pstmt);
		}

		return pArr;
	}
	public int insertPurchase(Connection conn, String userId, ArrayList<Cart> pay, Object shipinfo) {
		PreparedStatement pstmt =null;
		
		int result=0;
		String nss = shipinfo.
		String query = prop.getProperty("insertPurchase");
		
		try {
			pstmt=conn.prepareStatement(query);
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return result;
	}
}
