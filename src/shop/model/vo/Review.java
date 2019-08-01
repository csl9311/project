package shop.model.vo;

import java.sql.Date;

public class Review {
	private int rId;
	private int rType;
	private int pId;
	private String rWriter;
	private String rTitle;
	private String rContent;
	private int rCount;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	public Review(int rId, int rType, int pId, String rWriter, String rTitle, String rContent, int rCount,
			Date createDate, Date modifyDate, String status) {
		super();
		this.rId = rId;
		this.rType = rType;
		this.pId = pId;
		this.rWriter = rWriter;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rCount = rCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	
	

	public Review(int rId, int rType, int pId, String rWriter, String rTitle, String rContent, int rCount,
			Date modifyDate) {
		super();
		this.rId = rId;
		this.rType = rType;
		this.pId = pId;
		this.rWriter = rWriter;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rCount = rCount;
		this.modifyDate = modifyDate;
	}



	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public int getrType() {
		return rType;
	}

	public void setrType(int rType) {
		this.rType = rType;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getrWriter() {
		return rWriter;
	}

	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
