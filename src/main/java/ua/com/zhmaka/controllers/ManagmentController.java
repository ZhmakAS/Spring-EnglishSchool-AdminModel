package ua.com.zhmaka.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ua.com.zhmaka.EnglishSchoolbackend.dao.GroupDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dao.LevelDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dao.TeacherDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dao.UserDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Group;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Level;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Request;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Teacher;
import ua.com.zhmaka.EnglishSchoolbackend.dto.User;


@Controller
@RequestMapping("/manage")
public class ManagmentController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private TeacherDAO teacherDAO;
	@Autowired
	private GroupDAO groupDAO;
	@Autowired 
	private LevelDAO levelDAO;

	@RequestMapping(value = "/school", method = RequestMethod.GET)
	public ModelAndView showAllDataSchool() throws Exception{
		ModelAndView view = new ModelAndView("core");
		view.addObject("adminClickManageData", true);
		view.addObject("Title", "Manage Data");
		return view;
	}

	@RequestMapping(value = "/show/teachers")
	public ModelAndView showAllTeachers() {
		ModelAndView view = new ModelAndView("core");
		view.addObject("teachers", teacherDAO.getActiveTeachers());
		view.addObject("adminClickTeachers", true);
		view.addObject("Title", "Teachers");
		Teacher nTeacher = new Teacher();
		nTeacher.setActive(true);
		view.addObject("teacher", nTeacher);		

		return view;
	}

	@RequestMapping(value = "/show/students")
	public ModelAndView showAllStudents() {
		ModelAndView view = new ModelAndView("core");
		view.addObject("students", userDAO.getListUsers());
		view.addObject("adminClickStudents", true);
		view.addObject("Title", "Students");
		User nUser = new User();
		nUser.setActive(true);
		view.addObject("user", nUser);

		return view;
	}

	@RequestMapping(value = "/show/groups")
	public ModelAndView showAllGroups() {
		ModelAndView view = new ModelAndView("core");
		view.addObject("groups", groupDAO.getGroupsList());
		view.addObject("adminClickGroups", true);
		view.addObject("Title", "Groups");
		Group nGroup = new Group();
		view.addObject("group", nGroup);

		return view;
	}
	
	@RequestMapping(value = "/show/requests")
	public ModelAndView showAllRequests() {
		ModelAndView view = new ModelAndView("core");
		view.addObject("adminClickRequest", true);
		view.addObject("Title", "Request");

		return view;
	}
	
	@RequestMapping(value="delete/request/{id}")
	public String deleteRequest(@PathVariable int id) {
		Request request = userDAO.getRequestById(id);
		userDAO.deleteRequestById(request.getId());
		return "redirect:/manage/show/requests";
	}

	@RequestMapping(value = "/show/students/{id}/group")
	public ModelAndView showStudentsByGroupId(@PathVariable int id) {
		ModelAndView view = new ModelAndView("core");
		Group group = groupDAO.getGroupById(id);
		view.addObject("adminClickGroupID", true);
		view.addObject("Title", "Students");
		view.addObject("group", group);

		return view;
	}
	
	@ModelAttribute("levels")
	public List<Level> getLevels() {

		return levelDAO.getListLevels();
	}
	
	@ModelAttribute("groups")
	public List<Group> getGroups() {

		return groupDAO.getGroupsList();
	}
	
	@ModelAttribute("teachers")
	public List<Teacher> getTeachers(){
		return teacherDAO.getActiveTeachers();
	}

	@RequestMapping(value = "/show/student/{id}")
	public ModelAndView showUserProfile(@PathVariable int id) {
		ModelAndView view = new ModelAndView("core");
		view.addObject("adminClickShowUser", true);
		User user = userDAO.getUserById(id);
		view.addObject("user", user);
		Level level = userDAO.getLevelById(user.getLevel_id());
		view.addObject("level", level);
		Group group = groupDAO.getGroupById(user.getGroup_id());
		view.addObject("group", group);
		view.addObject("isUser", true);
		return view;
	}
	@RequestMapping(value = "/show/teacher/{id}")
	public ModelAndView showTeacherProfile(@PathVariable int id) {
		ModelAndView view = new ModelAndView("core");
		view.addObject("adminClickShowUser", true);
		Teacher user = teacherDAO.getTeacherById(id);
		view.addObject("user", user);
		view.addObject("isTeacher", true);
		Group group = groupDAO.getGroupById(user.getId());
		view.addObject("group", group);
		return view;
		
	}
	
	
	@RequestMapping(value="/add/student",method=RequestMethod.POST)
	public String addStudent(@Valid @ModelAttribute("user") User mUser, BindingResult result,Model model
			, HttpServletRequest request) {
		
		if(result.hasErrors()) {
			model.addAttribute("adminClickStudents", true);
			model.addAttribute("Title", "Students");
			return "core";
		}
		
			if (mUser.getId() == 0) {
				mUser.setRole("USER");
				mUser.setEnabled(true);
				mUser.setPassword("");
				userDAO.addUser(mUser);
				
			} else {
				mUser.setRole("USER");
				mUser.setEnabled(true);
				mUser.setPassword("");
				userDAO.updateUser(mUser);
			}
			model.addAttribute("adminClickStudents", true);
			model.addAttribute("Title", "Students");
			return "redirect:/manage/show/students";
		
	}
	
	@RequestMapping(value="/add/teacher",method=RequestMethod.POST)
	public String addTeacher(@Valid @ModelAttribute("teacher") Teacher mTeacher, BindingResult result,Model model
			, HttpServletRequest request) {
		
		if(result.hasErrors()) {
			model.addAttribute("adminClickTeachers", true);
			model.addAttribute("Title", "Teachers");
			return "core";
		}
		
			if (mTeacher.getId() == 0) {
				mTeacher.setRole("TEACHER");
				mTeacher.setEnabled(true);
				mTeacher.setPassword("");
				teacherDAO.addTeacher(mTeacher);
			} else {
				mTeacher.setRole("TEACHER");
				mTeacher.setEnabled(true);
				mTeacher.setPassword("");
				teacherDAO.updateTeacher(mTeacher);
			}
			model.addAttribute("adminClickTeachers", true);
			model.addAttribute("Title", "Teachers");
			return "redirect:/manage/show/teachers";
	}
	
	

	@RequestMapping(value = "/user/{id}/activation", method = RequestMethod.POST)
	@ResponseBody
	public String activeUser(@PathVariable("id") int id) {
		User user = userDAO.getUserById(id);
		boolean isActive = user.isActive();
		user.setActive(!user.isActive());

		userDAO.updateUser(user);

		return (isActive) ? "You succssfully deactivate the user with id = " + user.getId()
				: "You succssfully activate the user with id = " + user.getId();

	}
	
	@RequestMapping(value = "/teacher/{id}/activation", method = RequestMethod.POST)
	@ResponseBody
	public String activeTeacher(@PathVariable("id") int id) {
		Teacher user = teacherDAO.getTeacherById(id);
		boolean isActive = user.isActive();
		user.setActive(!user.isActive());

		teacherDAO.updateTeacher(user);

		return (isActive) ? "You succssfully deactivate the teacher with id = " + user.getId()
				: "You succssfully activate the teacher with id = " + user.getId();

	}
	
	
	@RequestMapping(value="/add/group",method=RequestMethod.POST)
	public String addGroup(@Valid @ModelAttribute("group") Group mGroup, BindingResult result,Model model
			, HttpServletRequest request) {
		
		if(result.hasErrors()) {
			model.addAttribute("adminClickGroups", true);
			model.addAttribute("Title", "Groups");
			return "core";
		}
		
			if (mGroup.getId() == 0) {
				groupDAO.addGroup(mGroup);
			} else {
				groupDAO.updateGroup(mGroup);
			}
			model.addAttribute("adminClickGroups", true);
			model.addAttribute("Title", "Groups");
			return "redirect:/manage/show/groups";
	}
	
	
	@RequestMapping(value="{id}/user")
	public ModelAndView editUser(@PathVariable int id) {
		ModelAndView view = new ModelAndView("core");
		User user = userDAO.getUserById(id);
		view.addObject("adminClickStudents", true);
		view.addObject("Title", "Students");
		view.addObject("user", user);
		return view;
	}
	
	@RequestMapping(value="{id}/teacher")
	public ModelAndView editTeacher(@PathVariable int id) {
		ModelAndView view = new ModelAndView("core");
		Teacher teacher = teacherDAO.getTeacherById(id);
		view.addObject("adminClickTeachers", true);
		view.addObject("Title", "Teachers");
		view.addObject("teacher", teacher);
		return view;
	}
	
}
