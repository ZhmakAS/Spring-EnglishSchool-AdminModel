package ua.com.zhmaka.EnglishSchoolbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ua.com.zhmaka.EnglishSchoolbackend.dao.TeacherDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Teacher;

@Repository("teacherDAO")
@Transactional
public class TeacherDAOIpml implements TeacherDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean addTeacher(Teacher teacher) {
		try {
			sessionFactory.getCurrentSession().save(teacher);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Teacher getTeacherByPhone(String phone) {
		String getActiveUserByPhone = "FROM Teacher WHERE active = :active AND phone = :phone";

		return sessionFactory.getCurrentSession().createQuery(getActiveUserByPhone, Teacher.class)
				.setParameter("active", true).setParameter("phone", phone).getSingleResult();
	}

	@Override
	public List<Teacher> getActiveTeachers() {
		String getListOfAvtiveTeacher = " FROM Teacher WHERE active = :active";
		return sessionFactory.getCurrentSession().createQuery(getListOfAvtiveTeacher, Teacher.class)
				.setParameter("active", true).getResultList();
	}

	@Override
	public boolean updateTeacher(Teacher teacher) {
		try {
			sessionFactory.getCurrentSession().update(teacher);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Teacher> getListTeachers() {
		return sessionFactory.getCurrentSession().createQuery("FROM Teacher", Teacher.class).getResultList();
	}

	@Override
	public List<Teacher> getActiveTeachersByGroup(int groupId) {
		String activeUserByGroup = "FROM Teacher WHERE active = :active AND group_id = :group_id";
		return sessionFactory.getCurrentSession().createQuery(activeUserByGroup, Teacher.class)
				.setParameter("active", true).setParameter("group_id", groupId).getResultList();
	}

	@Override
	public boolean deleteTeacher(Teacher teacher) {
		teacher.setActive(false);
		try {
			sessionFactory.getCurrentSession().update(teacher);
			return true;
		} catch (Exception e) {

			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Teacher getTeacherById(int id) {
		String getActiveUserByPhone = "FROM Teacher WHERE id = :id";

		return sessionFactory.getCurrentSession().createQuery(getActiveUserByPhone, Teacher.class)
				.setParameter("id", id).getSingleResult();
	}

}
