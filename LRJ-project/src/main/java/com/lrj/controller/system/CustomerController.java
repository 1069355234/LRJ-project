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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSONObject;
import com.lrj.annotation.SystemLog;
import com.lrj.controller.index.BaseController;
import com.lrj.entity.CustomerBasicFormMap;
import com.lrj.entity.CustomerLoanFormMap;
import com.lrj.entity.CustomerPicFormMap;
import com.lrj.entity.RoleFormMap;
import com.lrj.entity.UserFormMap;
import com.lrj.entity.UserRoleFormMap;
import com.lrj.mapper.CustomerMapper;
import com.lrj.mapper.RoleMapper;
import com.lrj.mapper.UserMapper;
import com.lrj.plugin.PageView;
import com.lrj.util.Common;
import com.lrj.util.DownloadUtils;
import com.lrj.util.JsonUtils;
import com.lrj.util.POIUtils;
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
	
	@Inject
	private RoleMapper roleMapper;

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
		CustomerLoanFormMap customerFormMap = getFormMap(CustomerLoanFormMap.class);
		customerFormMap=toFormMap(customerFormMap, pageNow, pageSize,customerFormMap.getStr("orderby"));
		customerFormMap.put("column", column);
		customerFormMap.put("sort", sort);
		
		//获取下属员工
		// 获取登录的bean
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		UserFormMap userFormMap = (UserFormMap)Common.findUserSession(request);

		List<String> salesman = new ArrayList<>();
		
		List<Integer> roleIds = new ArrayList<>();
		UserRoleFormMap userRoleFormMap = new UserRoleFormMap();
		userRoleFormMap.put("userId", Integer.parseInt(userFormMap.get("id").toString()));

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
        List<UserFormMap> allLowerUser = userMapper.selectAllLowerUser(ufm);
        
        for(UserFormMap u : allLowerUser){
        	salesman.add(u.get("accountName").toString());//当前用户可以查看其下属用户的客户
        }
        
		salesman.add(userFormMap.get("accountName").toString());//自己可以查看自己的客户
		customerFormMap.put("lowerSalesman", salesman);
		
        pageView.setRecords(customerMapper.findCustomerPage(customerFormMap));//不调用默认分页,调用自已的mapper中findUserPage
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

	/**
	 *
	 * @Description 客户详细信息
	 * @CreateUser 张顶飞 zhangdf@tiansu-china.com
	 * @CreateDate 2015年12月10日 下午7:17:03
	 * @UpdateUser 张顶飞 zhangdf@tiansu-china.com
	 * @UpdateDate 2015年12月10日 下午7:17:03
	 * @param model
	 * @param phoneNumber
	 * @return
	 */
	@RequestMapping("detail")
	public String detail(Model model,String applyloanKey){
		CustomerLoanFormMap customerLoanFormMap = customerMapper.findbyFrist("applyloanKey", applyloanKey, CustomerLoanFormMap.class);
		CustomerBasicFormMap customerBasicFormMap = customerMapper.findbyFrist("idCard", customerLoanFormMap.get("idCard").toString(), CustomerBasicFormMap.class);
		model.addAttribute("customerBasic", customerBasicFormMap);
		model.addAttribute("customerLoan", customerLoanFormMap);
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
	public String picList(Model model,String applyloanKey){
		CustomerPicFormMap customerPicFormMap = new CustomerPicFormMap();
		customerPicFormMap.put("applyloanKey", applyloanKey);

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
		String filePath = request.getServletContext().getRealPath("/uploadFile/张三20151211110323");

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
	public void exportBaseInfo(String loanIds,HttpServletRequest request, HttpServletResponse response) throws IOException {
		String fileName = "客户信息";
		
		List<Map<String, String>> cusBasicInfos = customerMapper.showCusBasicInfo();
		
		List<Map<String, String>> cusLoanInfos = customerMapper.showCusLoanInfo();
		
		String exportBasicData = "[";
		String exportLoanData = "[";
		
		for(Map<String,String> ci : cusBasicInfos){
			exportBasicData += "{\"colkey\":\""+ci.get("Field").toString()+"\",\"name\":\""+ci.get("Comment").toString()+"\",\"hide\":false},";
		}
		
		for(Map<String,String> ci : cusLoanInfos){
			exportLoanData += "{\"colkey\":\""+ci.get("Field").toString()+"\",\"name\":\""+ci.get("Comment").toString()+"\",\"hide\":false},";
		}
		
		exportBasicData = Common.trimComma(exportBasicData);
		exportLoanData = Common.trimComma(exportLoanData);
		
		exportBasicData += "]";
		exportLoanData += "]";
		
		List<Map<String, Object>> listBasicMap = JsonUtils.parseJSONList(exportBasicData);
		List<Map<String, Object>> listLoanMap = JsonUtils.parseJSONList(exportLoanData);

		List<CustomerBasicFormMap> customerBasicFormMaps = new ArrayList<>();
		List<CustomerLoanFormMap> customerLoanFormMaps = null;
		
		if(StringUtils.isEmpty(loanIds)){
			customerLoanFormMaps = customerMapper.findByNames(new CustomerLoanFormMap());
		}else{
			CustomerLoanFormMap paramsLoan = new CustomerLoanFormMap();
			paramsLoan.put("where", "where id in (" + loanIds + ")");
			customerLoanFormMaps = customerMapper.findByWhere(paramsLoan);
		}
		
		Map<String,String> idCards = new HashMap<>();
		
		for(CustomerLoanFormMap clf : customerLoanFormMaps){
			idCards.put(clf.get("idCard").toString(), "");
		}
		
		for(Map.Entry<String, String> entry : idCards.entrySet()){
			customerBasicFormMaps.add(customerMapper.findbyFrist("idCard", entry.getKey(),CustomerBasicFormMap.class));
		}
		POIUtils.exportToExcel(response, listLoanMap, customerLoanFormMaps,listBasicMap, customerBasicFormMaps, fileName);

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
		CustomerBasicFormMap customerFormMap = JSONObject.parseObject(param, CustomerBasicFormMap.class);
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

	
}