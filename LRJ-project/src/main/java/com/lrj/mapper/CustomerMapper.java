package com.lrj.mapper;

import java.util.List;
import java.util.Map;

import com.lrj.entity.CustomerLoanFormMap;
import com.lrj.mapper.base.BaseMapper;


public interface CustomerMapper extends BaseMapper{

	public List<CustomerLoanFormMap> findCustomerPage(CustomerLoanFormMap customerLoanFormMap);
	
	public List<Map<String,String>> showCusBasicInfo();
	
	public List<Map<String,String>> showCusLoanInfo();

}
