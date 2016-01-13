package com.lrj.controller.system;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSONArray;
import com.lrj.controller.index.BaseController;
import com.lrj.entity.RoleFormMap;
import com.lrj.entity.UserFormMap;
import com.lrj.entity.UserLocationFormMap;
import com.lrj.entity.UserRoleFormMap;
import com.lrj.mapper.RoleMapper;
import com.lrj.mapper.UserMapper;
import com.lrj.plugin.PageView;
import com.lrj.util.Common;

/**
 *
 * @author lanyuan 2014-11-19
 * @Email: mmm333zzz520@163.com
 * @version 3.0v
 */
@Controller
@RequestMapping("/lowuser/")
public class LowUserController extends BaseController {
	@Inject
	private UserMapper userMapper;

	@Inject
	private RoleMapper roleMapper;

	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		model.addAttribute("resJSON", JSONArray.toJSON(findByRes()));
		return Common.BACKGROUND_PATH + "/system/lowuser/list";
	}

	@RequestMapping("listAll")
	public String listUIAll(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		model.addAttribute("resJSON", JSONArray.toJSON(findByRes()));
		return Common.BACKGROUND_PATH + "/system/lowuser/listAll";
	}

	@ResponseBody
	@RequestMapping("findByPage")
	public PageView getAllLowerUsers(HttpServletRequest request,String pageNow,
			String pageSize,String column,String sort,String flag){
		// 获取登录的bean
		UserFormMap userFormMap = (UserFormMap)Common.findUserSession(request);
		Integer userId = Integer.parseInt(userFormMap.get("id").toString());

		if(flag.equals("byRole")){
			List<Integer> roleIds = new ArrayList<>();
			UserRoleFormMap userRoleFormMap = new UserRoleFormMap();
			userRoleFormMap.put("userId", userId);

			List<UserRoleFormMap> userRoleFormMaps = userMapper.findByNames(userRoleFormMap);
			for(UserRoleFormMap u : userRoleFormMaps){
				getAllLowerRoles(Integer.parseInt(u.get("roleId").toString()),roleIds);
			}

			String strRoleIds = "";
			for(Integer roleId : roleIds){
				strRoleIds += roleId + ",";
			}
			strRoleIds = Common.trimComma(strRoleIds);

			UserFormMap ufm = getFormMap(UserFormMap.class);
			ufm.put("roleIds", strRoleIds);
			ufm=toFormMap(ufm, pageNow, pageSize,ufm.getStr("orderby"));
			ufm.put("column", column);
			ufm.put("sort", sort);
	        pageView.setRecords(userMapper.selectAllLowerUser(ufm));//不调用默认分页,调用自已的mapper中findUserPage
		}else{
			UserFormMap ufm = getFormMap(UserFormMap.class);
			ufm.put("userId", userId);
			ufm = toFormMap(ufm, pageNow, pageSize,ufm.getStr("orderby"));
			pageView.setRecords(userMapper.selectChoosedLowerUser(ufm));
		}
        return pageView;

	}

	public void getAllLowerRoles(Integer roleId,List<Integer> roleIds){
		RoleFormMap roleFormMap = roleMapper.findbyFrist("parentId", roleId.toString(), RoleFormMap.class);
		if(null != roleFormMap){
			roleId = Integer.parseInt(roleFormMap.get("id").toString());
			roleIds.add(roleId);
			getAllLowerRoles(roleId,roleIds);
		}
	}

	@ResponseBody
	@RequestMapping("getAllLowerUsers")
	public List<UserFormMap> getAllLowerUsers(){
		// 获取登录的bean
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		UserFormMap userFormMap = (UserFormMap)Common.findUserSession(request);
		Integer userId = Integer.parseInt(userFormMap.get("id").toString());
		List<Integer> roleIds = new ArrayList<>();
		UserRoleFormMap userRoleFormMap = new UserRoleFormMap();
		userRoleFormMap.put("userId", userId);

		List<UserRoleFormMap> userRoleFormMaps = userMapper.findByNames(userRoleFormMap);
		for(UserRoleFormMap u : userRoleFormMaps){
//			roleIds.add(Integer.parseInt(u.get("roleId").toString()));
			getAllLowerRoles(Integer.parseInt(u.get("roleId").toString()),roleIds);
		}

		String strRoleIds = "";
		for(Integer roleId : roleIds){
			strRoleIds += roleId + ",";
		}
		strRoleIds = Common.trimComma(strRoleIds);

		UserFormMap ufm = getFormMap(UserFormMap.class);
		ufm.put("roleIds", strRoleIds);
		List<UserFormMap> users = userMapper.selectAllLowerUser(ufm);

		List<UserFormMap> usersLocation = new ArrayList<>();

		for(UserFormMap u : users){
			String accountName = u.get("accountName").toString();
			UserLocationFormMap location = getLocation(accountName);
			if(null != location){
				u.put("longitude", location.get("longitude"));
				u.put("latitude", location.get("latitude"));
				u.put("locationTime", location.get("locationTime"));
				usersLocation.add(u);
			}
		}
        return usersLocation;
	}

	@ResponseBody
	@RequestMapping("getLocation")
	public UserLocationFormMap getLocation(String accountName){
		UserLocationFormMap userLocationFormMap = new UserLocationFormMap();
		userLocationFormMap.put("accountName", accountName);

		List<UserLocationFormMap> locations = userMapper.getLocation(userLocationFormMap);

		if(null == locations || locations.size() == 0){
			return null;
		}else{
			return locations.get(0);
		}
	}

	@RequestMapping("goToMapLocation")
	public String goToMapLocation(Model model,String accountName){
		UserLocationFormMap userLocationFormMap = new UserLocationFormMap();
		userLocationFormMap.put("accountName", accountName);

		List<UserLocationFormMap> locations = userMapper.getLocation(userLocationFormMap);
		model.addAttribute("location", locations.get(0));

		return Common.BACKGROUND_PATH + "/system/lowuser/map";
	}

}