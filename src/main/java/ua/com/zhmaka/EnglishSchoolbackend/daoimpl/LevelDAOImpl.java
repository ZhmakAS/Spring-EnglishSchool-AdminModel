package ua.com.zhmaka.EnglishSchoolbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ua.com.zhmaka.EnglishSchoolbackend.dao.LevelDAO;
import ua.com.zhmaka.EnglishSchoolbackend.dto.Level;

@Repository("levelDAO")
@Transactional
public class LevelDAOImpl implements LevelDAO{

	
	@Autowired
	private SessionFactory SessionFactory;
	@Override
	public List<Level> getListLevels() {
		String listLevels = "FROM Level";
		try {
			return SessionFactory.getCurrentSession().createQuery(listLevels, Level.class).getResultList();
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
