package ua.com.zhmaka.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ua.com.zhmaka.EnglishSchoolbackend.dao.GroupDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dao.TeacherDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dao.UserDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Group;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Request;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Teacher;
import ua.com.zhmaka.EnglishSchoolbackend.dto.User;

@Controller
@RequestMapping("/json/data")
public class JsonDataController {
	
	@Autowired
	private TeacherDAO teacherDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private GroupDAO groupDAO;
	
	
	@RequestMapping("show/students")
	@ResponseBody
	public List<User> showStudents(){
		return userDAO.getListUsers();
	}
	
	@RequestMapping("show/teachers")
	@ResponseBody
	public List<Teacher> showTeachers(){
		return teacherDAO.getListTeachers();
	}
	
	@RequestMapping("show/requests")
	@ResponseBody
	public List<Request> showRequests(){
		return userDAO.getAllRequests();
	}
	
	@RequestMapping("show/groups")
	@ResponseBody
	public List<Group> showGroups(){
		return groupDAO.getGroupsList();
	}
	
	@RequestMapping("/show/students/{id}/group")
	@ResponseBody
	public List<User> showStudentsByGroupId(@PathVariable int id){
		return userDAO.getActiveUsersByGroup(id);
	}



}
