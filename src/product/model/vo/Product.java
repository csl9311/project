package product.model.vo;

import java.sql.Date;

public class Product {
	private int pId,  price, stock, sellCount, amount;
	private String pName, category, subCategory, brand, useOption, option;
	private Date regDate, modifyDate;
	
	
	// 관리자 상품목록조회
	public Product(int pId, int price, int stock, int sellCount, String pName, String category, String subCategory,
			String brand, String useOption, String option, Date regDate, Date modifyDate) {
		super();
		this.pId = pId;
		this.price = price;
		this.stock = stock;
		this.sellCount = sellCount;
		this.pName = pName;
		this.category = category;
		this.subCategory = subCategory;
		this.brand = brand;
		this.useOption = useOption;
		this.option = option;
		this.regDate = regDate;
		this.modifyDate = modifyDate;
	}

	public Product(int pId, int price, int stock, int sellCount, String pName, String category, String subCategory,
			String brand, String useOption, Date regDate, Date modifyDate) {
		super();
		this.pId = pId;
		this.price = price;
		this.stock = stock;
		this.sellCount = sellCount;
		this.pName = pName;
		this.category = category;
		this.subCategory = subCategory;
		this.brand = brand;
		this.useOption = useOption;
		this.regDate = regDate;
		this.modifyDate = modifyDate;
	}

	public Product(int pId, int price, String pName, String category, String subCategory, String brand) {
		super();
		this.pId = pId;
		this.price = price;
		this.pName = pName;
		this.category = category;
		this.subCategory = subCategory;
		this.brand = brand;
	}
	
	public Product(int pId, int price, int amount, String pName, String option) {
		super();
		this.pId = pId;
		this.price = price;
		this.amount = amount;
		this.pName = pName;
		this.option = option;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Product(String option) {
		super();
		this.option = option;
	}

	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
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
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getUseOption() {
		return useOption;
	}
	public void setUseOption(String useOption) {
		this.useOption = useOption;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}
	
	
	
}
