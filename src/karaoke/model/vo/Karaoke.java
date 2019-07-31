package karaoke.model.vo;

public class Karaoke {
	private int kid;
	private String refId;
	private String karaokeName;
	private int oneCoin;
	private int threeCoin;
	private String openTime;
	private String status;
	private int address_code;
	private String address;
	private String address_detail;
	
	public Karaoke() {}

	public Karaoke(int kid, String refId, String karaokeName, int oneCoin, int threeCoin, String openTime,
			String status, int address_code, String address, String address_detail) {
		super();
		this.kid = kid;
		this.refId = refId;
		this.karaokeName = karaokeName;
		this.oneCoin = oneCoin;
		this.threeCoin = threeCoin;
		this.openTime = openTime;
		this.status = status;
		this.address_code = address_code;
		this.address = address;
		this.address_detail = address_detail;
	}

	public int getKid() {
		return kid;
	}

	public void setKid(int kid) {
		this.kid = kid;
	}

	public String getRefId() {
		return refId;
	}

	public void setRefId(String refId) {
		this.refId = refId;
	}

	public String getKaraokeName() {
		return karaokeName;
	}

	public void setKaraokeName(String karaokeName) {
		this.karaokeName = karaokeName;
	}

	public int getOneCoin() {
		return oneCoin;
	}

	public void setOneCoin(int oneCoin) {
		this.oneCoin = oneCoin;
	}

	public int getThreeCoin() {
		return threeCoin;
	}

	public void setThreeCoin(int threeCoin) {
		this.threeCoin = threeCoin;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getAddress_code() {
		return address_code;
	}

	public void setAddress_code(int address_code) {
		this.address_code = address_code;
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
	
}
