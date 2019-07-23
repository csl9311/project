package member.model.vo;

import java.sql.Date;

public class Member {
	private String id, pw, name, phone,  gender;
	private String address, email, grade, status;
	private Date birth, regDate, modifyDate;

	public Member() {
	}
	
	public Member(String id) {
		this.id = id;
	}

	public Member(String id, String pw, String name, String phone, Date birth, String gender, String address,
			String email, String grade, String status, Date regDate, Date modifyDate) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.birth = birth;
		this.gender = gender;
		this.address = address;
		this.email = email;
		this.grade = grade;
		this.status = status;
		this.regDate = regDate;
		this.modifyDate = modifyDate;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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
