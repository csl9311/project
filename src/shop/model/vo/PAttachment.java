package shop.model.vo;

import java.sql.Date;

public class PAttachment {
	private int pFId;
	private String originName;
	private String changeName;
	private String filePAth;
	private int pId;
	private Date uploadDate;
	
	public PAttachment() {}

	public PAttachment(int pFId, String originName, String changeName, String filePAth, int pId,
			Date uploadDate) {
		super();
		this.pFId = pFId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePAth = filePAth;
		this.pId = pId;
		this.uploadDate = uploadDate;
	}


	public int getpFId() {
		return pFId;
	}


	public void setpFId(int pFId) {
		this.pFId = pFId;
	}


	public String getOriginName() {
		return originName;
	}


	public void setOriginName(String originName) {
		this.originName = originName;
	}


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public String getFilePAth() {
		return filePAth;
	}


	public void setFilePAth(String filePAth) {
		this.filePAth = filePAth;
	}

	public int getpId() {
		return pId;
	}


	public void setpId(int pId) {
		this.pId = pId;
	}


	public Date getUploadDate() {
		return uploadDate;
	}


	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}


	@Override
	public String toString() {
		return "PAttachment [pFId=" + pFId + ", originName=" + originName + ", changeName=" + changeName + ", filePAth="
				+ filePAth + ", pId=" + pId + ", uploadDate=" + uploadDate + "]";
	}
	
}
