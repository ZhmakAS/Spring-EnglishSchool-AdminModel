package ua.com.zhmaka.EnglishSchoolbackend.dto;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="teacher")
public class Teacher {
	

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="first_name")
	@NotBlank(message="Please enter a teacher`s name!")
	private String firstName;
	@Column(name="last_name")
	@NotBlank(message="Please enter a teacher`s name!")
	private String lastName;
	private Integer age;
	@NotBlank(message="Please enter a teacher`s phone!")
	private String phone;
	@NotBlank(message="Please enter a teacher`s address!")
	private String address;
	@Column(name="is_active")
	private boolean active;
	private String code;
	private String role;
	private String password;
	private boolean enabled;
	
	

	//default constructor - generete a unic code for each product 
	public Teacher()
	{
		this.code =  UUID.randomUUID().toString().substring(26).toUpperCase();
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	

	

}
