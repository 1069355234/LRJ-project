package com.lrj.mapper;

import java.util.List;

import com.lrj.entity.ResFormMap;
import com.lrj.mapper.base.BaseMapper;

public interface ResourcesMapper extends BaseMapper {
	public List<ResFormMap> findChildlists(ResFormMap map);

	public List<ResFormMap> findRes(ResFormMap map);

	public List<ResFormMap> findRoleRes(ResFormMap map);

	public void updateSortOrder(List<ResFormMap> map);

	public List<ResFormMap> findUserResourcess(String userId);

}
