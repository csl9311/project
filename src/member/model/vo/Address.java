package member.model.vo;

public class Address {
	private int address_code;
	private String postNum, address, address_detail, id;

	public Address() {
	}

	// 주소 생성 시
	public Address(String postNum, String address, String address_detail) {
		super();
		this.postNum = postNum;
		this.address = address;
		this.address_detail = address_detail;
	}
	
	public Address(int address_code, String postNum, String address, String address_detail) {
		this.address_code = address_code;
		this.postNum = postNum;
		this.address = address;
		this.address_detail = address_detail;
	}

	// 주소 입력할 때 사용
	public Address(String postNum, String address, String address_detail, String id) {
		super();
		this.postNum = postNum;
		this.address = address;
		this.address_detail = address_detail;
		this.id = id;
	}

	public int getAddress_code() {
		return address_code;
	}

	public void setAddress_code(int address_code) {
		this.address_code = address_code;
	}

	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
