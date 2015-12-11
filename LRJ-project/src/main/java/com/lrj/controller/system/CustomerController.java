package com.lrj.controller.system;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.lrj.annotation.SystemLog;
import com.lrj.controller.index.BaseController;
import com.lrj.entity.CustomerFormMap;
import com.lrj.entity.CustomerPicFormMap;
import com.lrj.entity.ResUserFormMap;
import com.lrj.entity.UserFormMap;
import com.lrj.entity.UserGroupsFormMap;
import com.lrj.exception.SystemException;
import com.lrj.mapper.CustomerMapper;
import com.lrj.mapper.UserMapper;
import com.lrj.plugin.PageView;
import com.lrj.util.Common;
import com.lrj.util.DownloadUtils;
import com.lrj.util.JsonUtils;
import com.lrj.util.POIUtils;
import com.lrj.util.PasswordHelper;
import com.lrj.util.ZipUtil;

/**
 *
 * @author lanyuan 2014-11-19
 * @Email: mmm333zzz520@163.com
 * @version 3.0v
 */
@Controller
@RequestMapping("/customer/")
public class CustomerController extends BaseController {
	@Inject
	private UserMapper userMapper;

	@Inject
	private CustomerMapper customerMapper;

	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/customer/list";
	}

	/**
	 *
	 * @Description 显示客户列表
	 * @CreateUser 张顶飞 zhangdf@tiansu-china.com
	 * @CreateDate 2015年12月10日 下午7:17:21
	 * @UpdateUser 张顶飞 zhangdf@tiansu-china.com
	 * @UpdateDate 2015年12月10日 下午7:17:21
	 * @param pageNow
	 * @param pageSize
	 * @param column
	 * @param sort
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage( String pageNow,
			String pageSize,String column,String sort) throws Exception {
		CustomerFormMap customerFormMap = getFormMap(CustomerFormMap.class);
		customerFormMap=toFormMap(customerFormMap, pageNow, pageSize,customerFormMap.getStr("orderby"));
		customerFormMap.put("column", column);
		customerFormMap.put("sort", sort);
        pageView.setRecords(customerMapper.findCustomerPage(customerFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
	}

	/**
	 *
	 * @Description 客户详细信息
	 * @CreateUser 张顶飞 zhangdf@tiansu-china.com
	 * @CreateDate 2015年12月10日 下午7:17:03
	 * @UpdateUser 张顶飞 zhangdf@tiansu-china.com
	 * @UpdateDate 2015年12月10日 下午7:17:03
	 * @param model
	 * @param customer_id
	 * @return
	 */
	@RequestMapping("detail")
	public String detail(Model model,String customer_id){
//		model.addAttribute("res", findByRes());
		CustomerFormMap customerFormMap = customerMapper.findbyFrist("customer_id", customer_id, CustomerFormMap.class);
		System.out.println(JSONObject.toJSONString(customerFormMap));
		return Common.BACKGROUND_PATH + "/system/customer/detail";
	}

	/**
	 *
	 * @Description 显示图片列表
	 * @CreateUser 张顶飞 zhangdf@tiansu-china.com
	 * @CreateDate 2015年12月10日 下午7:15:30
	 * @UpdateUser 张顶飞 zhangdf@tiansu-china.com
	 * @UpdateDate 2015年12月10日 下午7:15:30
	 * @param model
	 * @param customer_id
	 * @return
	 */
	@RequestMapping("piclist")
	public String picList(Model model,String customerPhone){
		CustomerPicFormMap customerPicFormMap = new CustomerPicFormMap();
		customerPicFormMap.put("username", customerPhone);

		List<CustomerPicFormMap> findByNames = customerMapper.findByNames(customerPicFormMap);

		Map<String,List<CustomerPicFormMap>> customerPics = new HashMap<>();

		for(CustomerPicFormMap pic : findByNames){
			String filetype = pic.get("filetype").toString();
			if(customerPics.containsKey(filetype)){
				customerPics.get(filetype).add(pic);
			}else{
				List<CustomerPicFormMap> map = new ArrayList<>();
				map.add(pic);
				customerPics.put(filetype, map);
			}
		}

		model.addAttribute("customerPics", customerPics);
		return Common.BACKGROUND_PATH + "/system/customer/piclist";
	}

	/**
	 *
	 * @Description 导出全部图片
	 * @CreateUser 张顶飞 zhangdf@tiansu-china.com
	 * @CreateDate 2015年12月10日 下午7:16:32
	 * @UpdateUser 张顶飞 zhangdf@tiansu-china.com
	 * @UpdateDate 2015年12月10日 下午7:16:32
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/exportAll")
	public void exportAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String filePath = request.getServletContext().getRealPath("/uploadFile/张三");

		File zip = ZipUtil.zip(filePath);

		DownloadUtils.downloadFile(zip,response);
	}

	/**
	 *
	 * @Description 导出客户基本信息成excel表格
	 * @CreateUser 张顶飞 zhangdf@tiansu-china.com
	 * @CreateDate 2015年12月11日 下午2:33:06
	 * @UpdateUser 张顶飞 zhangdf@tiansu-china.com
	 * @UpdateDate 2015年12月11日 下午2:33:06
	 * @param customerIds
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/exportBaseInfo")
	public void exportBaseInfo(String customerIds,HttpServletRequest request, HttpServletResponse response) throws IOException {
		String fileName = "客户信息";
		String exportData =
		 "[{\"colkey\":\"customer_name\",\"name\":\"客户名\",\"hide\":false}"
		 + ",{\"colkey\":\"customer_phone\",\"name\":\"电话号码\",\"hide\":false}"
		 + "]";

		List<Map<String, Object>> listMap = JsonUtils.parseJSONList(exportData);

		List<CustomerFormMap> customerFormMaps = null;
		if(StringUtils.isEmpty(customerIds)){
			customerFormMaps = customerMapper.findByNames(new CustomerFormMap());
		}else{
			CustomerFormMap params = new CustomerFormMap();
			params.put("where", "customer_id in (" + customerIds + ")");
			customerFormMaps = customerMapper.findByWhere(params);
		}
		POIUtils.exportToExcel(response, listMap, customerFormMaps, fileName);

	}


	/**
	 *
	 * @Description app接口，新增客户基本信息
	 * @CreateUser 张顶飞 zhangdf@tiansu-china.com
	 * @CreateDate 2015年12月11日 下午2:33:35
	 * @UpdateUser 张顶飞 zhangdf@tiansu-china.com
	 * @UpdateDate 2015年12月11日 下午2:33:35
	 * @param txtGroupsSelect
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="addCusInfo", method = RequestMethod.POST)
	@SystemLog(module="客户管理",methods="客户管理-新增客户")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	public String addCusInfo(String cusInfo){
		String param = "{\"name\":\"testinterface\",\"phoneNumber\":\"12345677\"}";
		CustomerFormMap customerFormMap = JSONObject.parseObject(param, CustomerFormMap.class);
		try {
			customerMapper.addEntity(customerFormMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	@ResponseBody
	@RequestMapping(value="addCusPic", method = RequestMethod.POST)
	@SystemLog(module="客户管理",methods="客户管理-上传图片")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	public String addCusPic(byte[] picFile, String picInfo) {

		CustomerPicFormMap customerPicFormMap = JSONObject.parseObject(picInfo, CustomerPicFormMap.class);

		String filePath = customerPicFormMap.get("filepath").toString();
		String fileName = customerPicFormMap.get("filename").toString();

		BufferedOutputStream bos = null;
		FileOutputStream fos = null;
		File file = null;
		try {
			File dir = new File(filePath);
			if (!dir.exists() && dir.isDirectory()) {// 判断文件目录是否存在
				dir.mkdirs();
			}
			file = new File(filePath + "\\" + fileName);
			fos = new FileOutputStream(file);
			bos = new BufferedOutputStream(fos);
			bos.write(picFile);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (bos != null) {
				try {
					bos.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}
		return "success";
	}

	@ResponseBody
	@RequestMapping("deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理-删除用户")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			userMapper.deleteByAttribute("userId", id, UserGroupsFormMap.class);
			userMapper.deleteByAttribute("userId", id, ResUserFormMap.class);
			userMapper.deleteByAttribute("id", id, UserFormMap.class);
		}
		return "success";
	}

	@RequestMapping("editUI")
	public String editUI(Model model) throws Exception {
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			model.addAttribute("user", userMapper.findbyFrist("id", id, UserFormMap.class));
		}
		return Common.BACKGROUND_PATH + "/system/user/edit";
	}

	@ResponseBody
	@RequestMapping("editEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理-修改用户")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity(String txtGroupsSelect) throws Exception {
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		userFormMap.put("txtGroupsSelect", txtGroupsSelect);
		userMapper.editEntity(userFormMap);
		userMapper.deleteByAttribute("userId", userFormMap.get("id")+"", UserGroupsFormMap.class);
		if(!Common.isEmpty(txtGroupsSelect)){
			String[] txt = txtGroupsSelect.split(",");
			for (String roleId : txt) {
				UserGroupsFormMap userGroupsFormMap = new UserGroupsFormMap();
				userGroupsFormMap.put("userId", userFormMap.get("id"));
				userGroupsFormMap.put("roleId", roleId);
				userMapper.addEntity(userGroupsFormMap);
			}
		}
		return "success";
	}
	/**
	 * 验证账号是否存在
	 *
	 * @author lanyuan Email：mmm333zzz520@163.com date：2014-2-19
	 * @param name
	 * @return
	 */
	@RequestMapping("isExist")
	@ResponseBody
	public boolean isExist(String name) {
		UserFormMap account = userMapper.findbyFrist("accountName", name, UserFormMap.class);
		if (account == null) {
			return true;
		} else {
			return false;
		}
	}

	//密码修改
	@RequestMapping("updatePassword")
	public String updatePassword(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/user/updatePassword";
	}

	//保存新密码
	@RequestMapping("editPassword")
	@ResponseBody
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理-修改密码")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editPassword() throws Exception{
		// 当验证都通过后，把用户信息放在session里
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		userFormMap.put("password", userFormMap.get("newpassword"));
		//这里对修改的密码进行加密
		PasswordHelper passwordHelper = new PasswordHelper();
		passwordHelper.encryptPassword(userFormMap);
		userMapper.editEntity(userFormMap);
		return "success";
	}
}