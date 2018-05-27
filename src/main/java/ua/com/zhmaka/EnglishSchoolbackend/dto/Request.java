package ua.com.zhmaka.EnglishSchoolbackend.dto;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;


@Entity
@Table(name="request")
public class Request {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@NotBlank(message="Please enter a name!")
	private String name;
	@NotBlank(message="Please enter a email!")
	private String email;
	@NotBlank(message="Please enter a phone!")
	private String phone;
	private String date;
	
	
	public int getId() {
		return id;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setId(int id) {
		this.id = id;
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
	public String getDate() {
		return date;
	}
	public void String(String date) {
		this.date = date;
	}
	
	
	

}
