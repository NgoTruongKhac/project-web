package entity;

import java.sql.Date;

public class User {
	
	private int userId;
	private String firstName;
	private String LastName;
	private String pass;
	private String email;
	private String phoneNumber;
	private String sex;
	private Date birthday;
	private String verificationCode;
	private String avatar;
	private String role;
	
	

	public User(String firstName, String LastName, String pass, String email, String phoneNumber,
			String verificationCode) {
		this.firstName = firstName;
		this.LastName = LastName;
		this.pass = pass;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.verificationCode = verificationCode;
	}
	

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	

	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}
	


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", LastName=" + LastName + ", pass=" + pass + ", email=" + email
				+ ", phoneNumber=" + phoneNumber + ", verificationCode=" + verificationCode + "]";
	}
	



}
