package ua.com.zhmaka.EnglishSchoolbackend.dao;

import java.util.List;

import ua.com.zhmaka.EnglishSchoolbackend.dto.Teacher;


public interface TeacherDAO {
	boolean addTeacher(Teacher teacher);
	Teacher getTeacherByPhone(String phone);
	List<Teacher> getActiveTeachers();
	boolean updateTeacher(Teacher teacher);
	List<Teacher> getListTeachers();
	List<Teacher> getActiveTeachersByGroup(int groupId);
	boolean deleteTeacher(Teacher teacher);
	Teacher getTeacherById(int id);
}
