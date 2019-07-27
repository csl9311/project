package product.model.vo;

import java.sql.Date;

public class Product {
	private String name, brand, category, description; // id는 시퀀스, category는 별도 테이블 생성
	private int id, price, stock, sellCount;
	private Date regDate;

	public Product() {
	}

	public Product(String name, String brand, String category, String description, int id, int price, int stock,
			int sellCount, Date regDate) {
		this.name = name;
		this.brand = brand;
		this.category = category;
		this.description = description;
		this.id = id;
		this.price = price;
		this.stock = stock;
		this.sellCount = sellCount;
		this.regDate = regDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getSellCount() {
		return sellCount;
	}

	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}
