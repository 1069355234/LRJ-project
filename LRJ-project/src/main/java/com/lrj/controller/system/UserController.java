package com.lrj.controller.system;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lrj.annotation.SystemLog;
import com.lrj.controller.index.BaseController;
import com.lrj.entity.ResUserFormMap;
import com.lrj.entity.UserFormMap;
import com.lrj.entity.UserGroupsFormMap;
import com.lrj.entity.UserRelationFormMap;
import com.lrj.entity.UserRoleFormMap;
import com.lrj.exception.SystemException;
import com.lrj.mapper.RoleMapper;
import com.lrj.mapper.UserMapper;
import com.lrj.plugin.PageView;
import com.lrj.util.Common;
import com.lrj.util.JsonUtils;
import com.lrj.util.POIUtils;
import com.lrj.util.PasswordHelper;

/**
 *
 * @author lanyuan 2014-11-19
 * @Email: mmm333zzz520@163.com
 * @version 3.0v
 */
@Controller
@RequestMapping("/user/")
public class UserController extends BaseController {
	@Inject
	private UserMapper userMapper;
	
	@Inject
	private RoleMapper roleMapper;

	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/user/list";
	}

	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage( String pageNow,
			String pageSize,String column,String sort) throws Exception {
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		userFormMap=toFormMap(userFormMap, pageNow, pageSize,userFormMap.getStr("orderby"));
		userFormMap.put("column", column);
		userFormMap.put("sort", sort);
        pageView.setRecords(userMapper.findUserPage(userFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
	}

	@RequestMapping("selUser")
	public String seletUser(Model model) throws Exception {
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		Object userId = userFormMap.get("userId");
		String roleIds = "";

		UserRoleFormMap userRoleFormMap = new UserRoleFormMap();
		userRoleFormMap.put("userId", userId);

		List<UserRoleFormMap> userRoleFormMaps = userMapper.findByNames(userRoleFormMap);
		for(UserRoleFormMap u : userRoleFormMaps){
			roleIds += u.get("roleId").toString() + ",";
		}
		roleIds = Common.trimComma(roleIds);
		userFormMap.put("roleIds", roleIds);
		List<UserFormMap> list = userMapper.selectChoosedLowerUser(userFormMap);
		String ugid = "";
		for (UserFormMap ml : list) {
			ugid += ml.get("id")+",";
		}
		ugid = Common.trimComma(ugid);
		model.addAttribute("txtLowerUserSelect", ugid);
		model.addAttribute("lowerUsers", list);
		model.addAttribute("userId", userId);
		List<UserFormMap> users = userMapper.selectUnChoosedLowerUser(userFormMap);
		model.addAttribute("users", users);
		return Common.BACKGROUND_PATH + "/system/user/userSelect";
	}
	
	@ResponseBody
	@RequestMapping("assignUsers")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	public String assignUsers(String txtGroupsSelect,Integer userId){
		try {
			userMapper.deleteByAttribute("user_parent_id", userId.toString(), UserRelationFormMap.class);
			if(StringUtils.isNotEmpty(txtGroupsSelect)){
				List<UserRelationFormMap> userRelationFormMaps = new ArrayList<>();
				String[] lowerUsers = txtGroupsSelect.split(",");
				for(String str : lowerUsers){
					UserRelationFormMap userRelationFormMap = new UserRelationFormMap();
					userRelationFormMap.put("user_parent_id", userId);
					userRelationFormMap.put("user_child_id", Integer.parseInt(str));
					userRelationFormMaps.add(userRelationFormMap);
				}
				userMapper.batchSave(userRelationFormMaps);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}

	@RequestMapping("/export")
	public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String fileName = "用户列表";
		UserFormMap userFormMap = findHasHMap(UserFormMap.class);
		//exportData =
		// [{"colkey":"sql_info","name":"SQL语句","hide":false},
		// {"colkey":"total_time","name":"总响应时长","hide":false},
		// {"colkey":"avg_time","name":"平均响应时长","hide":false},
		// {"colkey":"record_time","name":"记录时间","hide":false},
		// {"colkey":"call_count","name":"请求次数","hide":false}
		// ]
		String exportData = userFormMap.getStr("exportData");// 列表头的json字符串

		List<Map<String, Object>> listMap = JsonUtils.parseJSONList(exportData);

		List<UserFormMap> lis = userMapper.findUserPage(userFormMap);
		POIUtils.exportToExcel(response, listMap, lis, fileName);
	}

	@RequestMapping("addUI")
	public String addUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/user/add";
	}

	@ResponseBody
	@RequestMapping("addEntity")
	@SystemLog(module="系统管理",methods="用户管理-新增用户")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	public String addEntity(String txtGroupsSelect){
		try {
			UserFormMap userFormMap = getFormMap(UserFormMap.class);
			userFormMap.put("txtGroupsSelect", txtGroupsSelect);
			PasswordHelper passwordHelper = new PasswordHelper();
			userFormMap.set("password","123456789");
			passwordHelper.encryptPassword(userFormMap);
			userMapper.addEntity(userFormMap);//新增后返回新增信息
			if (!Common.isEmpty(txtGroupsSelect)) {
				String[] txt = txtGroupsSelect.split(",");
				UserGroupsFormMap userGroupsFormMap = new UserGroupsFormMap();
				for (String roleId : txt) {
					userGroupsFormMap.put("userId", userFormMap.get("id"));
					userGroupsFormMap.put("roleId", roleId);
					userMapper.addEntity(userGroupsFormMap);
				}
			}
		} catch (Exception e) {
			 throw new SystemException("添加账号异常");
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