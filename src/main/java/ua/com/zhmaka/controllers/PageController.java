package ua.com.zhmaka.controllers;

import java.security.Principal;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ua.com.zhmaka.EnglishSchoolbackend.dao.TeacherDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dao.UserDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Request;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Teacher;
import ua.com.zhmaka.EnglishSchoolbackend.dto.User;

@Controller
public class PageController {
	String message = "Welcome to Spring MVC!";
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private TeacherDAO teacherDAO;

	@RequestMapping(value = { "/", "/home" })
	public ModelAndView showMessage(@RequestParam(value = "name", required = false, defaultValue = "World") String name,
			Authentication authentication, Principal principal, HttpSession session) {
		System.out.println("in controller");

		ModelAndView mv = new ModelAndView("page");
		mv.addObject("message", "This is the test message!");
		mv.addObject("name", name);
		if (principal != null) {
			Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>) authentication.getAuthorities();
			for(SimpleGrantedAuthority var : authorities) {
				if(var.getAuthority().equalsIgnoreCase("USER")|| var.getAuthority().equalsIgnoreCase("ADMIN"))
				{
					User user = userDAO.getUserByPhone(principal.getName());
					session.setAttribute("user", user);
				}else if(var.getAuthority().equalsIgnoreCase("TEACHER")) {
					Teacher teacher = teacherDAO.getTeacherByPhone(principal.getName());
					session.setAttribute("teacher", teacher);
				}
			}
		}

		return mv;
	}

	@RequestMapping(value = { "/perform-logout" })
	public String performLogout(HttpServletRequest request,HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication != null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication);
		}
		return "redirect:/login?logout";
	}

	 @RequestMapping(value = { "/profile" })
	 public ModelAndView showPersonalData() {
	 ModelAndView mv = new ModelAndView("personal");
	 return mv;
	 }
	 @RequestMapping(value = { "/profile/teacher" })
	 public ModelAndView showPersonalTeacherData() {
	 ModelAndView mv = new ModelAndView("teacherprofile");
	 return mv;
	 }
	 
	 @RequestMapping(value = { "/submission" })
	 public ModelAndView showSubmissionForm() {
	 ModelAndView mv = new ModelAndView("submision");
	 Request request = new Request();
	 mv.addObject("request", request);
	 return mv;
	 }
	 
	 @RequestMapping(value = { "/procces/submit" }, method=RequestMethod.POST)
	 public String showProccesSubmission(@Valid @ModelAttribute("request")Request nReques,BindingResult result,Model model) {

	 if(result.hasErrors()) {
		 model.addAttribute("warning","Your request was not submitted! Try again!");
		 return "submision";
	 }
	 userDAO.addUserRequest(nReques);
	  return "page";
	 }

	@RequestMapping(value = { "/contact" })
	public ModelAndView showContact() {
		System.out.println("in controller");
		ModelAndView mv = new ModelAndView("contact");
		return mv;
	}

	@RequestMapping(value = { "login" })
	public ModelAndView login(@RequestParam(name = "error", required = false) String error,
			@RequestParam(name = "logout", required = false) String logout) {
		ModelAndView model = new ModelAndView("login");
		if (error != null) {
			model.addObject("message", "Invalid Username and Password");
		}
		if (logout != null) {
			model.addObject("logout", "You has been successfully logout!");
		}
		model.addObject("title", "Login");

		return model;
	}

}
