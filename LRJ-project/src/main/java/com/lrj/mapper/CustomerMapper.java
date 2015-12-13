package com.lrj.mapper;

import java.util.List;
import java.util.Map;

import com.lrj.entity.CustomerFormMap;
import com.lrj.mapper.base.BaseMapper;


public interface CustomerMapper extends BaseMapper{

	public List<CustomerFormMap> findCustomerPage(CustomerFormMap customerFormMap);
	
	public List<Map<String,String>> showTableInfo();

}
