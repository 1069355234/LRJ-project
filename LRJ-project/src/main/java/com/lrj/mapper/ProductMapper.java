package com.lrj.mapper;

import java.util.List;

import com.lrj.entity.ProductFormMap;
import com.lrj.entity.UserFormMap;
import com.lrj.mapper.base.BaseMapper;


public interface ProductMapper extends BaseMapper{

	public List<UserFormMap> findProductPage(ProductFormMap productFormMap);

}
