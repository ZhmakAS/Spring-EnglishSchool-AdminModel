package ua.com.zhmaka.EnglishSchoolbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ua.com.zhmaka.EnglishSchoolbackend.dao.GroupDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Group;

@Repository("groupDAO")
@Transactional
public class GroupDAOImpl implements GroupDAO {
	
	@Autowired
	private SessionFactory SessionFactory;

	@Override
	public boolean addGroup(Group group) {
		try {
			SessionFactory.getCurrentSession().save(group);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateGroup(Group group) {
		try {
			SessionFactory.getCurrentSession().update(group);
			return true;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteGroup(Group group) {
		try {
			SessionFactory.getCurrentSession().delete(group);;
			return true;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Group> getGroupsList(){ 
		return SessionFactory.getCurrentSession().createQuery("FROM Group", Group.class).getResultList();
	}

	@Override
	public Group getGroupById(int id) {
		String getGroupById = "FROM Group WHERE id = :id";
		return SessionFactory.getCurrentSession().createQuery(getGroupById, Group.class).setParameter("id", id).getSingleResult();
	}

}
