package product.model.vo;

import java.sql.Date;

public class Product {
	private int pId, price, stock, sellCount;
	private String pName, bName, category, subCategory, description, useOption;
	private Date regDate, modifyDate;

	public Product(int pId, int price, int stock, int sellCount, String pName, String bName, String category,
			String subCategory, String description, String useOption, Date regDate, Date modifyDate) {
		super();
		this.pId = pId;
		this.price = price;
		this.stock = stock;
		this.sellCount = sellCount;
		this.pName = pName;
		this.bName = bName;
		this.category = category;
		this.subCategory = subCategory;
		this.description = description;
		this.useOption = useOption;
		this.regDate = regDate;
		this.modifyDate = modifyDate;
	}
	
	

	public Product(int pId, int price, String pName, String bName, String category, String subCategory) {
		super();
		this.pId = pId;
		this.price = price;
		this.pName = pName;
		this.bName = bName;
		this.category = category;
		this.subCategory = subCategory;
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

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
