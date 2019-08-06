package payment.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import payment.model.dao.PaymentDAO;
import payment.model.vo.Payment;

public class PaymentService {
	public ArrayList<Payment> selectPayment(String userId) {
		System.out.println("서비스 들어옴?");
		Connection conn = getConnection();
		ArrayList<Payment> pList = new PaymentDAO().selectPayment(conn, userId);
		close(conn);
		return pList;
	}
}
