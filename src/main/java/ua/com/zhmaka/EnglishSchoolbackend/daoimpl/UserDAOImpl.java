package ua.com.zhmaka.EnglishSchoolbackend.daoimpl;

import java.util.List;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ua.com.zhmaka.EnglishSchoolbackend.dao.UserDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Level;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Request;
import ua.com.zhmaka.EnglishSchoolbackend.dto.User;

@Repository("userDAO")
@Transactional
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean addUser(User user) {
		try {
			sessionFactory.getCurrentSession().save(user);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
			return false;
		}
	}

	@Override
	public User getUserByPhone(String phone) {
		String phoneQuery = "FROM User WHERE phone = :phone";
		try {
			return sessionFactory.getCurrentSession().createQuery(phoneQuery, User.class)
					.setParameter("phone",phone).getSingleResult();
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public List<User> getActiveUsers() {
		String activeUsers = "FROM User WHERE active = :active";
		return sessionFactory.getCurrentSession().createQuery(activeUsers, User.class)
				.setParameter("active", true).getResultList();
	}

	@Override
	public boolean updateUser(User user) {
		try {
		sessionFactory.getCurrentSession().update(user);
		return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public List<User> getListUsers() {
		return sessionFactory.getCurrentSession().createQuery("FROM User", User.class).getResultList();
	}

	@Override
	public List<User> getActiveUsersByGroup(int groupId) {
		String activeUsersByGroup = "FROM User where active = :active AND group_id = :group_id";
			return sessionFactory.getCurrentSession().createQuery(activeUsersByGroup, User.class)
					.setParameter("active",true).setParameter("group_id", groupId).getResultList();
		
	}

	@Override
	public boolean deleteUser(User user) {
		user.setActive(false);
		try {
			sessionFactory.getCurrentSession().update(user);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public User getUserById(int id) {
		String phoneQuery = "FROM User WHERE id = :id";
		try {
			return sessionFactory.getCurrentSession().createQuery(phoneQuery, User.class)
					.setParameter("id",id).getSingleResult();
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Level getLevelById(int id) {
		String levelById = "FROM Level WHERE id =:id";
		try {
			return sessionFactory.getCurrentSession().createQuery(levelById, Level.class).setParameter("id", id).getSingleResult();
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean addUserRequest(Request request) {
		try {
			sessionFactory.getCurrentSession().save(request);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
			return false;
		}
	}

	@Override
	public List<Request> getAllRequests() {
	 return sessionFactory.getCurrentSession().createQuery("FROM Request", Request.class).getResultList();
	}

	@Override
	public Request getRequestById(int id) {
		String getReuestById = "FROM Request where id = :id";
		try {
			return sessionFactory.getCurrentSession().createQuery(getReuestById, Request.class)
					.setParameter("id", id).getSingleResult();
		}catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}

	}

	@Override
	public boolean deleteRequestById(int id) {
		Request  request = getRequestById(id);
		try {
			sessionFactory.getCurrentSession().delete(request);
			return true;
		}catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
	}

}
