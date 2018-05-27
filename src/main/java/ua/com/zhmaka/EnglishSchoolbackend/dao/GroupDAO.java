package ua.com.zhmaka.EnglishSchoolbackend.dao;

import java.util.List;

import ua.com.zhmaka.EnglishSchoolbackend.dto.Group;

public interface GroupDAO {
	public boolean addGroup(Group group);
	public boolean updateGroup(Group group);
	public boolean deleteGroup(Group group);
	public List<Group> getGroupsList();
	public Group getGroupById(int id);
}
