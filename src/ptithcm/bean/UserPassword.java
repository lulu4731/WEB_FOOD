package ptithcm.bean;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.sun.istack.internal.NotNull;

public class UserPassword {
	@NotBlank(message="Vui lòng không để trống mật khẩu")
	@Length(min = 6, message="Mật khẩu ít nhất 6 ký tự")
	String password;
	@NotBlank(message="Vui lòng không để trống mật khẩu")
	@Length(min = 6, message="Mật khẩu ít nhất 6 ký tự")
	String rePassword;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRePassword() {
		return rePassword;
	}
	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}
	
	
}
