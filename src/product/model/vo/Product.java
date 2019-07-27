package product.model.vo;

import java.sql.Date;

public class Product {
	private int pId,  price, stock, sellCount;
	private String pName, caegory, subCategory, brand, useOption;
	private Date regDate, modifyDate;
	public Product(int pId, int price, int stock, int sellCount, String pName, String caegory, String subCategory,
			String brand, String useOption, Date regDate, Date modifyDate) {
		super();
		this.pId = pId;
		this.price = price;
		this.stock = stock;
		this.sellCount = sellCount;
		this.pName = pName;
		this.caegory = caegory;
		this.subCategory = subCategory;
		this.brand = brand;
		this.useOption = useOption;
		this.regDate = regDate;
		this.modifyDate = modifyDate;
	}
	public Product(int pId, int price, String pName, String caegory, String subCategory, String brand) {
		super();
		this.pId = pId;
		this.price = price;
		this.pName = pName;
		this.caegory = caegory;
		this.subCategory = subCategory;
		this.brand = brand;
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
	public String getCaegory() {
		return caegory;
	}
	public void setCaegory(String caegory) {
		this.caegory = caegory;
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
	
	
	
}
