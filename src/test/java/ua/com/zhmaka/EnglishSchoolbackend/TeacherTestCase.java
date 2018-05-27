package ua.com.zhmaka.EnglishSchoolbackend;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import junit.framework.TestCase;
import ua.com.zhmaka.EnglishSchoolbackend.dao.TeacherDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Teacher;

public class TeacherTestCase {
	
	private static AnnotationConfigApplicationContext context;
	private static TeacherDAO teacherDAO;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("ua.com.zhmaka.EnglishSchoolbackend");
		context.refresh();
		
		teacherDAO = (TeacherDAO)context.getBean("teacherDAO");
	}
	
//	@Test
//	public void testAddTeacher() {
//		Teacher teacher = new Teacher();
//		teacher.setActive(true);
//		teacher.setAddress("Test address,55 fl 21");
//		teacher.setAge(20);
//		teacher.setFirstName("Anna");
//		teacher.setLastName("Turova");
//		teacher.setPhone("0979264140");
//		TestCase.assertEquals(true, teacherDAO.addTeacher(teacher));
//	}
	
//	@Test
//	public void testGetActiveTeacher() {
//		TestCase.assertEquals(5, teacherDAO.getActiveTeachers().size());
//	}
//	@Test
//	public void testGetTeacheByPhoneAndUpdate() {
//		Teacher teacher = teacherDAO.getTeacherByPhone("0979264140");
//		teacher.setActive(false);
//		teacherDAO.updateTeacher(teacher);
//		TestCase.assertEquals(4, teacherDAO.getActiveTeachers().size());
//		
//	}
	@Test
	public void testGetFullTeacherList() {
		TestCase.assertEquals(5, teacherDAO.getListTeachers().size());
	}
	

}
