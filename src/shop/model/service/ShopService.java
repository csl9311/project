package shop.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import product.model.vo.Product;
import shop.model.dao.ShopDAO;

public class ShopService {

	public int getListCount(int cid) {
		Connection conn = getConnection();
		int result = new ShopDAO().getListCount(conn, cid);
		close(conn);
		return result;
	}

	public ArrayList<Product> selectList(int currentPage, String cName) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ShopDAO().selectList(conn, currentPage, cName);
		return list;
	}

}
