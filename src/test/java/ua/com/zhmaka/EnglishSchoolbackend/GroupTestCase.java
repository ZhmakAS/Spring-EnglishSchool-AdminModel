package ua.com.zhmaka.EnglishSchoolbackend;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import junit.framework.TestCase;
import ua.com.zhmaka.EnglishSchoolbackend.dao.GroupDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dao.TeacherDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Group;

public class GroupTestCase {

	
	private static AnnotationConfigApplicationContext context;
	private static GroupDAO groupDAO;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("ua.com.zhmaka.EnglishSchoolbackend");
		context.refresh();
		
		groupDAO = (GroupDAO)context.getBean("groupDAO");
	}
	
//	@Test
//	public void testGetListGroups() {
//		TestCase.assertEquals(2, groupDAO.getGroupsList().size());
//	}
	@Test 
	public void testGetGroupById() {
		Group group = groupDAO.getGroupById(1);
		TestCase.assertEquals("Grop-Advanced", group.getTitle());
		
	}
}
