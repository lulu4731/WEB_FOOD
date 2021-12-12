package ptithcm.bean;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

public class UserSignup {
	@NotBlank(message="Vui lòng không để trống họ tên")
	String name;
	
	@NotBlank(message="Vui lòng không để trống email")
	@Email(message="Vui lòng điền đúng email")
	String email;
	@Length(min=6, message="Mật khẩu phải từ 6 ký từ trở lên")
	String password;
	
	@NotBlank(message="Vui lòng nhập số thẻ")
	String card;
	
	@NotBlank(message="Vui lòng nhập số điện thoại")
	String phone;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@NotBlank(message="Vui lòng nhập địa chỉ")
	String address;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
