package member.model.vo;

import java.sql.Date;

public class Member {
	private String id, pw, name, nickName, phone, gender;
	private String postNum, address, addressDetail, email, grade, status;
	private Date birth, regDate, modifyDate;
	private int point, news, sms;

	public Member() {
	}



	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", name=" + name + ", nickName=" + nickName + ", phone=" + phone
				+ ", gender=" + gender + ", postNum=" + postNum + ", address=" + address + ", addressDetail="
				+ addressDetail + ", email=" + email + ", grade=" + grade + ", status=" + status + ", birth=" + birth
				+ ", regDate=" + regDate + ", modifyDate=" + modifyDate + ", point=" + point + ", news=" + news
				+ ", sms=" + sms + "]";
	}

	// 로그인
	public Member(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	// 포인트 사용
	public Member(String id, int point) {
		this.id = id;
		this.point = point;
	}

	// 관리자 회원 정보 수정

	public Member(String id, String name, String nickName, String phone, String gender, String postNum, String address,
			String addressDetail, String email, String grade, int news, int sms) {
		super();
		this.id = id;
		this.name = name;
		this.nickName = nickName;
		this.phone = phone;
		this.gender = gender;
		this.postNum = postNum;
		this.address = address;
		this.addressDetail = addressDetail;
		this.email = email;
		this.grade = grade;
		this.news = news;
		this.sms = sms;
	}

	// 회원정보수정
	public Member(String id, String pw, String name, String nickName, String phone, String gender, String postNum,
			String address, String addressDetail, String email, Date birth, int news, int sms) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickName = nickName;
		this.phone = phone;
		this.gender = gender;
		this.postNum = postNum;
		this.address = address;
		this.addressDetail = addressDetail;
		this.email = email;
		this.birth = birth;
		this.news = news;
		this.sms = sms;
	}

	// 전체 생성자
	public Member(String id, String pw, String name, String nickName, String phone, String gender, String postNum,
			String address, String addressDetail, String email, String grade, String status, Date birth, Date regDate,
			Date modifyDate, int point, int news, int sms) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickName = nickName;
		this.phone = phone;
		this.gender = gender;
		this.postNum = postNum;
		this.address = address;
		this.addressDetail = addressDetail;
		this.email = email;
		this.grade = grade;
		this.status = status;
		this.birth = birth;
		this.regDate = regDate;
		this.modifyDate = modifyDate;
		this.point = point;
		this.news = news;
		this.sms = sms;
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getNews() {
		return news;
	}

	public void setNews(int news) {
		this.news = news;
	}

	public int getSms() {
		return sms;
	}

	public void setSms(int sms) {
		this.sms = sms;
	}

}
