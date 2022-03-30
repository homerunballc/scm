package kr.happyjob.study.mgrScm.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {
	
	private String loginID;
	private String user_Type;
	private String password;
	private String name;
	private String client;
	private String zipCode;
	private String address;
	private String dtAddress;
	private String phone;
	private String email;
	

}
