package com.lrj.mapper;

import java.util.List;

import com.lrj.entity.RoleFormMap;
import com.lrj.mapper.base.BaseMapper;

public interface RoleMapper extends BaseMapper{
	public List<RoleFormMap> seletUserRole(RoleFormMap map);

	public void deleteById(RoleFormMap map);
}
