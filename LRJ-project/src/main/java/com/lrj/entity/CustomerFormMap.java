package com.lrj.entity;

import com.lrj.annotation.TableSeg;
import com.lrj.util.FormMap;



/**
 * customer实体表
 */
@TableSeg(tableName = "tb_customer", id="customer_id")
public class CustomerFormMap extends FormMap<String,Object>{

	/**
	 *@descript
	 *@author lanyuan
	 *@date 2015年3月29日
	 *@version 1.0
	 */
	private static final long serialVersionUID = 1L;

}
