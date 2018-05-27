package ua.com.zhmaka.EnglishSchoolbackend.dao;

import java.util.List;

import ua.com.zhmaka.EnglishSchoolbackend.dto.Level;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Request;
import ua.com.zhmaka.EnglishSchoolbackend.dto.User;

public interface UserDAO {

	boolean addUser(User user);
	User getUserByPhone(String phone);
	List<User> getActiveUsers();
	boolean updateUser(User user);
	List<User> getListUsers();
	List<User> getActiveUsersByGroup(int groupId);
	boolean deleteUser(User user);
	User getUserById(int id);
	Level getLevelById(int id);
	boolean addUserRequest(Request request);
	List<Request> getAllRequests();
	Request getRequestById(int id);
	boolean deleteRequestById(int id);
	
	
}
