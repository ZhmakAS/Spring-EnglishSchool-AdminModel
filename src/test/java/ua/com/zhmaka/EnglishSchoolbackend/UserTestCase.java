package ua.com.zhmaka.EnglishSchoolbackend;

import javax.xml.registry.infomodel.User;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import junit.framework.TestCase;
import ua.com.zhmaka.EnglishSchoolbackend.dao.UserDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Request;

public class UserTestCase {

	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("ua.com.zhmaka.EnglishSchoolbackend");
		context.refresh();
		
		userDAO = (UserDAO)context.getBean("userDAO");
	}
//	@Test
//	public void testAddUser() {
//		User user = new User();
//		user.setFirstName("Test");
//		user.setLastName("Testov");
//		user.setAge(18);
//		user.setPhone("380999999999");
//		user.setAddress("Test str, 54");
//		user.setLevel_id(4);
//		user.setGroup_id(1);
//		TestCase.assertEquals(true, userDAO.addUser(user));
//	}
//	@Test
//	public void testGetActiveUsers() {
//		TestCase.assertEquals(4, userDAO.getActiveUsers().size());
//	}
//	@Test
//	public void testGetUserByPhoneAndUpdate() {
//		User user = userDAO.getUserByPhone("380999999999");
//		user.setActive(true);
//		userDAO.updateUser(user);
//		TestCase.assertEquals(5, userDAO.getActiveUsers().size());
//		
//	}
	
//	@Test
//	public void testGetUserByPhoneAndUpdate() {
//		User user = userDAO.getUserByPhone("380999999999");
//		userDAO.deleteUser(user);
//		TestCase.assertEquals(4, userDAO.getActiveUsers().size());
//		
//	}
	
////	@Test
//	public void testGetUserByFroupId() {
//		TestCase.assertEquals(3, userDAO.getActiveUsersByGroup(1).size());
//	}
	
//	@Test 
//	public void testGetLevelById() {
//		Level level = userDAO.getLevelById(3);
//		TestCase.assertEquals("Pre_Int", level.getShort_title());
//	}
	@Test
	public void testGetAndDeleteRequest() {
		Request request = userDAO.getRequestById(1);
		TestCase.assertEquals(true, userDAO.deleteRequestById(request.getId()));
		
	}
}
