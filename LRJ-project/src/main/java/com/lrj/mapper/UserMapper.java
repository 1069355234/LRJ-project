package com.lrj.mapper;

import java.util.List;

import com.lrj.entity.UserFormMap;
import com.lrj.entity.UserLocationFormMap;
import com.lrj.mapper.base.BaseMapper;


public interface UserMapper extends BaseMapper{

	public List<UserFormMap> findUserPage(UserFormMap userFormMap);

	public List<UserFormMap> selectChoosedLowerUser(UserFormMap userFormMap);

	public List<UserFormMap> selectUnChoosedLowerUser(UserFormMap userFormMap);
	
	public List<UserFormMap> selectAllLowerUser(UserFormMap userFormMap);
	
	public List<UserLocationFormMap> getLocation(UserLocationFormMap userLocationFormMap);

}
