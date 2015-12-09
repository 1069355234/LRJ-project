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

import com.lrj.controller.index.BaseController;
import com.lrj.entity.RoleFormMap;
import com.lrj.entity.UserFormMap;
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
		return Common.BACKGROUND_PATH + "/system/lowuser/list";
	}

	@ResponseBody
	@RequestMapping("findByPage")
	public PageView getAllLowerUsers(String pageNow,
			String pageSize,String column,String sort){
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
		ufm=toFormMap(ufm, pageNow, pageSize,ufm.getStr("orderby"));
		ufm.put("column", column);
		ufm.put("sort", sort);
        pageView.setRecords(userMapper.selectAllLowerUser(ufm));//不调用默认分页,调用自已的mapper中findUserPage
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
	
	@RequestMapping("goToMapLocation")
	public String goToMapLocation(Model model,Double longitude,Double latitude){
		model.addAttribute("longitude", longitude);
		model.addAttribute("latitude", latitude);
		return Common.BACKGROUND_PATH + "/system/lowuser/map";
	}
	
}