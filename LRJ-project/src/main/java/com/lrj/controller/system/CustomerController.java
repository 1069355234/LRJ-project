package com.lrj.controller.system;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONArray;
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
import com.lrj.util.PropertiesUtils;
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

	private final Logger logger = LoggerFactory
			.getLogger(CustomerController.class);

	@Inject
	private UserMapper userMapper;

	@Inject
	private CustomerMapper customerMapper;

	@Inject
	private RoleMapper roleMapper;

	//所有本级和下级员工的客户信息
	@RequestMapping("list")
	public String listUI(HttpServletRequest request,Model model) throws Exception {
		model.addAttribute("res", findByRes());

		UserFormMap userFormMap = (UserFormMap) Common.findUserSession(request);
		userFormMap.put("userId", Integer.parseInt(userFormMap.get("id").toString()));
		//获取分配的下级员工
		List<UserFormMap> allLowerUser = userMapper.selectChoosedLowerUser(userFormMap);
		allLowerUser.add(userFormMap);//算上自己
		model.addAttribute("lowerUser", allLowerUser);
		return Common.BACKGROUND_PATH + "/system/customer/list";
	}

	//所有本级和下级角色的客户信息
	@RequestMapping("listAll")
	public String listUIAll(HttpServletRequest request,Model model) throws Exception {
		model.addAttribute("res", findByRes());

		UserFormMap userFormMap = (UserFormMap) Common.findUserSession(request);
		List<Integer> roleIds = new ArrayList<>();
		UserRoleFormMap userRoleFormMap = new UserRoleFormMap();
		userRoleFormMap.put("userId",Integer.parseInt(userFormMap.get("id").toString()));

		List<UserRoleFormMap> userRoleFormMaps = userMapper.findByNames(userRoleFormMap);
		for (UserRoleFormMap u : userRoleFormMaps) {
			getAllLowerRoles(Integer.parseInt(u.get("roleId").toString()),roleIds);
		}
		String strRoleIds = "";
		for (Integer roleId : roleIds) {
			strRoleIds += roleId + ",";
		}
		strRoleIds = Common.trimComma(strRoleIds);

		UserFormMap ufm = getFormMap(UserFormMap.class);
		ufm.put("roleIds", strRoleIds);
		List<UserFormMap> allLowerUser = userMapper.selectAllLowerUser(ufm);
		allLowerUser.add(userFormMap);//算上自己

		model.addAttribute("lowerUser", allLowerUser);
		return Common.BACKGROUND_PATH + "/system/customer/listAll";
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
	public PageView findByPage(HttpServletRequest request,String pageNow, String pageSize, String column,
			String sort,String flag) throws Exception {
		CustomerLoanFormMap customerFormMap = getFormMap(CustomerLoanFormMap.class);
		customerFormMap = toFormMap(customerFormMap, pageNow, pageSize,
				customerFormMap.getStr("orderby"));
		customerFormMap.put("column", column);
		customerFormMap.put("sort", sort);

		// 获取下属员工
		UserFormMap userFormMap = (UserFormMap) Common.findUserSession(request);

		List<String> salesman = new ArrayList<>();

		List<Integer> roleIds = new ArrayList<>();
		UserRoleFormMap userRoleFormMap = new UserRoleFormMap();
		userRoleFormMap.put("userId",Integer.parseInt(userFormMap.get("id").toString()));

		List<UserRoleFormMap> userRoleFormMaps = userMapper.findByNames(userRoleFormMap);
		for (UserRoleFormMap u : userRoleFormMaps) {
			getAllLowerRoles(Integer.parseInt(u.get("roleId").toString()),roleIds);
		}
		List<UserFormMap> allLowerUser = new ArrayList<>();

		//根据下级角色获取下属用户
		if(flag.equals("byRole")){
			String strRoleIds = "";
			for (Integer roleId : roleIds) {
				strRoleIds += roleId + ",";
			}
			strRoleIds = Common.trimComma(strRoleIds);


			UserFormMap ufm = getFormMap(UserFormMap.class);
			ufm.put("roleIds", strRoleIds);
			allLowerUser = userMapper.selectAllLowerUser(ufm);
		}else{
			userFormMap.put("userId", Integer.parseInt(userFormMap.get("id").toString()));
			//获取分配的下级员工
			allLowerUser = userMapper.selectChoosedLowerUser(userFormMap);
		}

		for (UserFormMap u : allLowerUser) {
			salesman.add(u.get("accountName").toString());// 当前用户可以查看其下属用户的客户
		}

		salesman.add(userFormMap.get("accountName").toString());// 自己可以查看自己的客户
		customerFormMap.put("lowerSalesman", salesman);

		List<CustomerLoanFormMap> customerPages = customerMapper.findCustomerPage(customerFormMap);

		for(CustomerLoanFormMap cus : customerPages){
			String applyloanJkQy = cus.get("applyloanJkQy")==null?"":cus.get("applyloanJkQy").toString();
			String applyloanJkcs = cus.get("applyloanJkcs")==null?"":cus.get("applyloanJkcs").toString();
			String applyloanJkqu = cus.get("applyloanJkqu")==null?"":cus.get("applyloanJkqu").toString();
			cus.put("loanArea", applyloanJkQy+applyloanJkcs+applyloanJkqu);
		}

		pageView.setRecords(customerPages);// 不调用默认分页,调用自已的mapper中findUserPage
		return pageView;
	}

	public void getAllLowerRoles(Integer roleId, List<Integer> roleIds) {
		RoleFormMap roleFormMap = roleMapper.findbyFrist("parentId",
				roleId.toString(), RoleFormMap.class);
		if (null != roleFormMap) {
			roleId = Integer.parseInt(roleFormMap.get("id").toString());
			roleIds.add(roleId);
			getAllLowerRoles(roleId, roleIds);
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
	public String detail(Model model, String applyloanKey) {
		CustomerLoanFormMap customerLoanFormMap = customerMapper.findbyFrist(
				"applyloanKey", applyloanKey, CustomerLoanFormMap.class);

		String idCard =  customerLoanFormMap.get("idCard").toString();

		CustomerBasicFormMap customerBasicFormMap = customerMapper.findbyFrist(
				"idCard", idCard,
				CustomerBasicFormMap.class);

		Map<String,Object> phoneInfo = new HashMap<>();

		model.addAttribute("customerBasic", customerBasicFormMap);
		model.addAttribute("customerLoan", customerLoanFormMap);

		for(Map.Entry<String, Object> entry : customerBasicFormMap.entrySet()){
			if(entry.getKey().equals("phoneNumber")){
				phoneInfo.put("phoneNumber", getPhoneInfo(idCard,entry.getValue()==null?"-1":entry.getValue().toString()));
			}
			if(entry.getKey().equals("relativesPhoneNumber")){
				phoneInfo.put("relativesPhoneNumber", getPhoneInfo(idCard,entry.getValue()==null?"-1":entry.getValue().toString()));
			}
			if(entry.getKey().equals("socialFriendsPhoneNumber")){
				phoneInfo.put("socialFriendsPhoneNumber", getPhoneInfo(idCard,entry.getValue()==null?"-1":entry.getValue().toString()));
			}
			if(entry.getKey().equals("classmatesPhoneNubmer")){
				phoneInfo.put("classmatesPhoneNubmer", getPhoneInfo(idCard,entry.getValue()==null?"-1":entry.getValue().toString()));
			}
			if(entry.getKey().equals("colleaguesPhoneNumber")){
				phoneInfo.put("colleaguesPhoneNumber", getPhoneInfo(idCard,entry.getValue()==null?"-1":entry.getValue().toString()));
			}
			if(entry.getKey().equals("simpleFriendPhoneNumber")){
				phoneInfo.put("simpleFriendPhoneNumber", getPhoneInfo(idCard,entry.getValue()==null?"-1":entry.getValue().toString()));
			}
			if(entry.getKey().equals("borrowFriendsPhoneNumber")){
				phoneInfo.put("borrowFriendsPhoneNumber", getPhoneInfo(idCard,entry.getValue()==null?"-1":entry.getValue().toString()));
			}
		}
		model.addAttribute("phoneInfo", phoneInfo);
		picList(model,applyloanKey);

		return Common.BACKGROUND_PATH + "/system/customer/detail";
	}

	private String getPhoneInfo(String idCard,String phoneNumber){
		String usedInfo = "";
		CustomerBasicFormMap cbf = new CustomerBasicFormMap();
		cbf.put("idCard", idCard);
		cbf.put("phoneNumber", phoneNumber);
		List<CustomerBasicFormMap> cusInfos = customerMapper.selectPhoneInfo(cbf);
		for(CustomerBasicFormMap c : cusInfos){
			String custName = c.get("name").toString();
			if("".equals(usedInfo) ){
				usedInfo += "客户："+custName;
			}else{
				usedInfo += ","+"客户："+custName;
			}
		}
		if(!"".equals(usedInfo)){
			return "(该手机号码曾被"+usedInfo+"使用过)";
		}
		return null;
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
	public void picList(Model model, String applyloanKey) {
		CustomerPicFormMap customerPicFormMap = new CustomerPicFormMap();
		customerPicFormMap.put("applyloanKey", applyloanKey);

		List<CustomerPicFormMap> findByNames = customerMapper
				.findByNames(customerPicFormMap);

		Map<String, List<CustomerPicFormMap>> customerPics = new HashMap<>();

		for (CustomerPicFormMap pic : findByNames) {
			String filetype = pic.get("filetype").toString();
			if (customerPics.containsKey(filetype)) {
				customerPics.get(filetype).add(pic);
			} else {
				List<CustomerPicFormMap> map = new ArrayList<>();
				map.add(pic);
				customerPics.put(filetype, map);
			}
		}

		CustomerLoanFormMap customerLoanFormMap = customerMapper.findbyFrist("applyloanKey", applyloanKey, CustomerLoanFormMap.class);
		String applyloanBlx = customerLoanFormMap.get("applyloanBlx").toString();

		model.addAttribute("customerPics", customerPics);
		model.addAttribute("fileTypes", JSONArray.toJSON(getPicTypeByLoanType(applyloanBlx)));
		model.addAttribute("applyloanKey", applyloanKey);
	}

	@ResponseBody
	@RequestMapping("/uploadPic")
	public String uploadPic(HttpServletRequest request,String inputName,String fileType,String applyloanKey){
		try {
			CustomerLoanFormMap customerLoanFormMap = customerMapper.findbyFrist("applyloanKey", applyloanKey, CustomerLoanFormMap.class);
			String picPath = customerLoanFormMap.get("picPath").toString();
			String applyloanBlx = customerLoanFormMap.get("applyloanBlx").toString();
			String filePath = request.getServletContext().getRealPath(picPath+"/"+applyloanBlx+"/"+fileType);
			String salesman = customerLoanFormMap.get("salesman").toString();
			String idCard = customerLoanFormMap.get("idCard").toString();
			String time = Common.fromDateH();

			File file = new File(filePath);
			if(!file.exists()){
				file.mkdirs();
			}

			File[] childFiles = file.listFiles();

			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile multipartFile = multipartRequest.getFile(inputName);

			//如果有相同名字的文件，则跳过，不上传
			for(File f : childFiles){
				if(f.getName().equals(multipartFile.getOriginalFilename())){
					return "success";
				}
			}

			InputStream is = multipartFile.getInputStream();
			Long fileSize = multipartFile.getSize();
			byte[] b = new byte[fileSize.intValue()];
			int length = is.read(b);
			FileOutputStream outputStream = new FileOutputStream(filePath+"/"+multipartFile.getOriginalFilename());
			outputStream.write(b, 0, length);
			outputStream.close();
			is.close();

			CustomerPicFormMap customerPicFormMap = new CustomerPicFormMap();
			customerPicFormMap.put("filename", multipartFile.getOriginalFilename());
			customerPicFormMap.put("filepath", picPath+"/"+applyloanBlx+"/"+fileType+"/"+multipartFile.getOriginalFilename());
			customerPicFormMap.put("fileleng", fileSize.intValue());
			customerPicFormMap.put("filetype", fileType);
			customerPicFormMap.put("applyloanKey", applyloanKey);
			customerPicFormMap.put("username", salesman);
			customerPicFormMap.put("idCard", idCard);
			customerPicFormMap.put("createTime", time);

			customerMapper.addEntity(customerPicFormMap);

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
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
	public void exportAll(HttpServletRequest request,
			HttpServletResponse response, String applyloanKey)
			throws IOException {
		CustomerLoanFormMap customerLoanFormMap = customerMapper.findbyFrist(
				"applyloanKey", applyloanKey, CustomerLoanFormMap.class);

		String picPath = customerLoanFormMap.get("picPath").toString();
//		String idCard = customerLoanFormMap.get("idCard").toString();
//		CustomerBasicFormMap customerBasicFormMap = customerMapper.findbyFrist(
//				"idCard", idCard, CustomerBasicFormMap.class);
//		String custName = customerBasicFormMap.get("name").toString();

		String filePath = request.getServletContext().getRealPath(picPath);

		File zip = ZipUtil.zip(filePath);

		DownloadUtils.downloadFile(zip, response);
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
	public void exportBaseInfo(String loanIds, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String fileName = "客户信息";

		List<Map<String, String>> cusBasicInfos = customerMapper
				.showCusBasicInfo();

		List<Map<String, String>> cusLoanInfos = customerMapper
				.showCusLoanInfo();

		String exportBasicData = "[";
		String exportLoanData = "[";

		for (Map<String, String> ci : cusBasicInfos) {
			exportBasicData += "{\"colkey\":\"" + ci.get("Field").toString()
					+ "\",\"name\":\"" + ci.get("Comment").toString()
					+ "\",\"hide\":false},";
		}

		for (Map<String, String> ci : cusLoanInfos) {
			exportLoanData += "{\"colkey\":\"" + ci.get("Field").toString()
					+ "\",\"name\":\"" + ci.get("Comment").toString()
					+ "\",\"hide\":false},";
		}

		exportBasicData = Common.trimComma(exportBasicData);
		exportLoanData = Common.trimComma(exportLoanData);

		exportBasicData += "]";
		exportLoanData += "]";

		List<Map<String, Object>> listBasicMap = JsonUtils
				.parseJSONList(exportBasicData);
		List<Map<String, Object>> listLoanMap = JsonUtils
				.parseJSONList(exportLoanData);

		List<CustomerBasicFormMap> customerBasicFormMaps = new ArrayList<>();
		List<CustomerLoanFormMap> customerLoanFormMaps = null;

		if (StringUtils.isEmpty(loanIds)) {
			customerLoanFormMaps = customerMapper
					.findByNames(new CustomerLoanFormMap());
		} else {
			CustomerLoanFormMap paramsLoan = new CustomerLoanFormMap();
			paramsLoan.put("where", "where id in (" + loanIds + ")");
			customerLoanFormMaps = customerMapper.findByWhere(paramsLoan);
		}

		Map<String, String> idCards = new HashMap<>();

		for (CustomerLoanFormMap clf : customerLoanFormMaps) {
			idCards.put(clf.get("idCard").toString(), "");
		}

		for (Map.Entry<String, String> entry : idCards.entrySet()) {
			customerBasicFormMaps.add(customerMapper.findbyFrist("idCard",
					entry.getKey(), CustomerBasicFormMap.class));
		}
		POIUtils.exportToExcel(response, listLoanMap, customerLoanFormMaps,
				listBasicMap, customerBasicFormMaps, fileName);

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
	public boolean addCusInfo(HttpServletRequest request, String cusInfo) {

		String time = Common.fromDateH();

		logger.info("***************APP端传入的cusInfo参数值为：" + cusInfo+"*******************");

		JSONObject jsonInfo = JSONObject.parseObject(cusInfo);

		JSONObject basicO = jsonInfo.getJSONObject("basic");
		JSONObject basicN = new JSONObject();
		for (Map.Entry<String, Object> entry : basicO.entrySet()) {
			String key = entry.getKey();
			if (key.equals("Id")) {
				continue;
			}
			basicN.put(
					key.substring(0, 1).toLowerCase()
							+ key.substring(1, key.length()), entry.getValue());
		}

		JSONObject contactO = jsonInfo.getJSONObject("contact");
		JSONObject contactN = new JSONObject();
		for (Map.Entry<String, Object> entry : contactO.entrySet()) {
			String key = entry.getKey();
			if (key.equals("Id")) {
				continue;
			}
			contactN.put(
					key.substring(0, 1).toLowerCase()
							+ key.substring(1, key.length()), entry.getValue());
		}

		JSONObject creditO = jsonInfo.getJSONObject("credit");
		JSONObject creditN = new JSONObject();
		for (Map.Entry<String, Object> entry : creditO.entrySet()) {
			String key = entry.getKey();
			if (key.equals("Id")) {
				continue;
			}
			creditN.put(
					key.substring(0, 1).toLowerCase()
							+ key.substring(1, key.length()), entry.getValue());
		}

		JSONObject loanO = jsonInfo.getJSONObject("loan");
		JSONObject loanN = new JSONObject();
		for (Map.Entry<String, Object> entry : loanO.entrySet()) {
			String key = entry.getKey();
			if (key.equals("Id")) {
				continue;
			}
			if(key.equals("ApplyloanBlx")){
				loanN.put("applyloanBlx", getLoanType(Integer.parseInt(entry.getValue().toString())));
				continue;
			}
			loanN.put(
					key.substring(0, 1).toLowerCase()
							+ key.substring(1, key.length()), entry.getValue());
		}

		basicN.putAll(contactN);
		basicN.putAll(creditN);

		String idCard = basicN.get("idCard").toString();
		CustomerBasicFormMap customerBasicFormMap = customerMapper.findbyFrist(
				"idCard", idCard, CustomerBasicFormMap.class);
		if (null == customerBasicFormMap) {
			basicN.put("createTime", time);
			basicN.put("updateTime", time);
			try {
				CustomerBasicFormMap cbf = new CustomerBasicFormMap();
				for (Map.Entry<String, Object> entry : basicN.entrySet()) {
					cbf.put(entry.getKey(), entry.getValue());
				}
				customerMapper.addEntity(cbf);
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		} else {
			int id = Integer
					.parseInt(customerBasicFormMap.get("id").toString());
			basicN.put("updateTime", time);
			basicN.put("id", id);

			try {
				CustomerBasicFormMap cbf = new CustomerBasicFormMap();
				for (Map.Entry<String, Object> entry : basicN.entrySet()) {
					cbf.put(entry.getKey(), entry.getValue());
				}
				customerMapper.editEntity(cbf);
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}

		String name = basicN.get("name").toString();
		String applyloanKey = loanN.get("applyloanKey").toString();

		CustomerLoanFormMap customerLoanFormMap = customerMapper.findbyFrist(
				"applyloanKey", applyloanKey, CustomerLoanFormMap.class);

		if (null == customerLoanFormMap) {
			String picPath = "/uploadFile/" + name + "_" + applyloanKey;
			String picHolePath = request.getServletContext().getRealPath(picPath);
			File picFile = new File(picHolePath);

			if(!picFile.exists()){
				picFile.mkdirs();
			}

			loanN.put("picPath", picPath);
			loanN.put("createTime", time);

			try {
				CustomerLoanFormMap clf = new CustomerLoanFormMap();
				for (Map.Entry<String, Object> entry : loanN.entrySet()) {
					clf.put(entry.getKey(), entry.getValue());
				}
				customerMapper.addEntity(clf);
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}

		return true;
	}

//	 @ResponseBody
//	 @RequestMapping(value="addCusPic", method = RequestMethod.POST)
//	 @SystemLog(module="客户管理",methods="客户管理-上传图片")//凡需要处理业务逻辑的.都需要记录操作日志
//	 @Transactional(readOnly=false)//需要事务操作必须加入此注解
	public boolean addCusPic(HttpServletRequest request, File picFile,String picInfo) {
		CustomerPicFormMap customerPicFormMap = JSONObject.parseObject(picInfo,CustomerPicFormMap.class);
		String applyloanKey = customerPicFormMap.get("applyloanKey").toString();

		CustomerLoanFormMap customerLoanFormMap = customerMapper.findbyFrist("applyloanKey", applyloanKey, CustomerLoanFormMap.class);
		String picPath = customerLoanFormMap.get("picPath").toString();
		String applyloanBlx = customerLoanFormMap.get("applyloanBlx").toString();
		String filetype = customerPicFormMap.get("filetype").toString();

		String picRealPath = request.getServletContext().getRealPath(
				picPath + "/" + applyloanBlx + "/" + filetype);

		File saveFile = new File(picRealPath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}
		boolean isSavedSuccess = picFile.renameTo(new File(picRealPath + "/"
				+ picFile.getName()));
		if (isSavedSuccess) {
			customerPicFormMap.put("filePath", picPath + "/" + applyloanBlx
					+ "/" + filetype);
			try {
				customerMapper.addEntity(customerPicFormMap);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;

	}

	@ResponseBody
	@RequestMapping(value = "saveCusInfo", method = RequestMethod.POST)
	public boolean saveCusInfo(HttpServletRequest request,String picInfo) {
		// {"credittype":"2","filePath":"/storage/emulated/0/Android/data/com.lrj.ptp/files/admin/123456/2/5/20160104165042.jpg","fileleng":4707105,"filename":"20160104165042.jpg","filetype":"5","id":22,"idCard":"123456","isupover":"0","username":"admin"}
		logger.info("*************APP端传入的picInfo为："+picInfo+"***************");
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile picFile = multipartRequest.getFile("picFile");

			CustomerPicFormMap customerPicFormMap = new CustomerPicFormMap();
			for (Map.Entry<String, Object> entry : JSONObject.parseObject(picInfo)
					.entrySet()) {
				if (entry.getKey().equals("id")) {
					continue;
				}
				customerPicFormMap.put(entry.getKey(), entry.getValue());
			}

			String applyloanKey = customerPicFormMap.get("applyloanKey").toString();
			CustomerLoanFormMap customerLoanFormMap = customerMapper.findbyFrist("applyloanKey", applyloanKey, CustomerLoanFormMap.class);
			String picPath = customerLoanFormMap.get("picPath").toString();
			String applyloanBlx = customerLoanFormMap.get("applyloanBlx").toString();


			String fileName = customerPicFormMap.get("filename").toString();
//			String applyloanBlx = getLoanType(Integer.parseInt(customerPicFormMap.get("credittype").toString()));// 标类型

//			String picPath = "/uploadFile/" + name + "_" + applyloanKey;

			String filetype = getPicType(Integer.parseInt(customerPicFormMap.get("credittype").toString()),Integer.parseInt(customerPicFormMap.get("filetype").toString()));

			String picRealPath = request.getServletContext().getRealPath(picPath + "/" + applyloanBlx + "/" + filetype);

			File saveFile = new File(picRealPath);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			}

			//如果有相同名字的文件，则跳过，不上传
			for(File f : saveFile.listFiles()){
				if(f.getName().equals(picFile.getOriginalFilename())){
					logger.info("************存在同名文件["+f.getName()+"]，跳过不上传************");
					return true;
				}
			}

			InputStream fileInputStream = picFile.getInputStream();
			FileOutputStream fos = new FileOutputStream(picRealPath + "/"
					+ fileName);
			byte[] b = new byte[new Long(picFile.getSize()).intValue()];
			while ((fileInputStream.read(b)) != -1) {
				fos.write(b);
			}
			customerPicFormMap.put("filepath", picPath + "/" + applyloanBlx + "/" + filetype + "/" + fileName);
			customerPicFormMap.put("createTime", Common.fromDateH());
			customerPicFormMap.put("applyloanBlx", applyloanBlx);
			customerPicFormMap.put("filetype", filetype);
			customerMapper.addEntity(customerPicFormMap);
			fos.flush();
			fos.close();
			fileInputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("上传失败，原因："+e.getMessage());
			return false;
		}
		logger.info("上传成功");
		return true;
	}

	private String getLoanType(int index) {
		String loanType = "";
		try {
			SAXReader saxReader = new SAXReader();
			Document doc = saxReader.read(new File(PropertiesUtils.class.getResource("/arrays.xml").getPath()));
			Element root = doc.getRootElement();
			List childList = root.elements();
			for(int i=0;i<childList.size();i++){
				Element child = (Element) childList.get(i);
				if(child.attributeValue("name").equals("list_blx")){
					List childChildList = child.elements();
					Element childChild = (Element) childChildList.get(index);
					loanType = childChild.getText();
				}
			}

		} catch (DocumentException e) {
			e.printStackTrace();
			logger.error("解析xml出错");
		}

		return loanType;
	}

	private String getPicType(int loanIndex,int picIndex){
		String picType = "";
		String picName = "";
		switch(loanIndex){
		case 1:
			picName = "automobile_credit";
			break;
		case 2:
			picName = "mortgage";
			break;
		case 3:
		case 4:
			picName = "wing_agricultural_loan";
			break;
		case 5:
			picName = "wing_enterprise_credit";
			break;
		case 6:
			picName = "wing_business_credit";
			break;
		}
		try {
			SAXReader saxReader = new SAXReader();
			Document doc = saxReader.read(new File(PropertiesUtils.class.getResource("/arrays.xml").getPath()));
			Element root = doc.getRootElement();
			List childList = root.elements();
			for(int i=0;i<childList.size();i++){
				Element child = (Element) childList.get(i);
				if(child.attributeValue("name").equals(picName)){
					List childChildList = child.elements();
					Element childChild = (Element) childChildList.get(picIndex);
					picType = childChild.getText();
				}
			}

		} catch (DocumentException e) {
			e.printStackTrace();
			logger.error("解析xml出错");
		}
		String regEx="[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
		Pattern   p   =   Pattern.compile(regEx);
		if(picType.indexOf("[") > -1 && picType.indexOf("]") > picType.indexOf("[")){
			picType = picType.substring(picType.indexOf("]"),picType.length());
		}
		Matcher   m   =   p.matcher(picType);
		return m.replaceAll("").trim();
	}

	private List<String> getPicTypeByLoanType(String loanType){
		List<String> picTypes = new ArrayList<>();
		String type = "";
		switch(loanType){
		case "车贷":
			type = "automobile_credit";
			break;
		case "房贷":
			type = "mortgage";
			break;
		case "三户联保贷":
		case "翼农贷":
			type = "wing_agricultural_loan";
			break;
		case "翼企贷":
			type = "wing_enterprise_credit";
			break;
		case "翼商贷":
			type = "wing_business_credit";
			break;
		}
		String regEx="[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
		Pattern   p   =   Pattern.compile(regEx);
		try {
			SAXReader saxReader = new SAXReader();
			Document doc = saxReader.read(new File(PropertiesUtils.class.getResource("/arrays.xml").getPath()));
			Element root = doc.getRootElement();
			List childList = root.elements();
			for(int i=0;i<childList.size();i++){
				Element child = (Element) childList.get(i);
				if(child.attributeValue("name").equals(type)){
					List childChildList = child.elements();
					for(int j=0;j<childChildList.size();j++){
						Element childChild = (Element) childChildList.get(j);
						String picType = childChild.getText();
						if(picType.indexOf("[") > -1 && picType.indexOf("]") > picType.indexOf("[")){
							picType = picType.substring(picType.indexOf("]"),picType.length());
						}
						Matcher m = p.matcher(picType);
						picTypes.add(m.replaceAll("").trim());
					}

				}
			}

		} catch (DocumentException e) {
			e.printStackTrace();
			logger.error("解析xml出错");
		}
		return picTypes;

	}

	public static void main(String[] args) {
		 // 只允许字母和数字
        // String   regEx  =  "[^a-zA-Z0-9]";
           // 清除掉所有特殊字符
		String   str   =   "[张三]";
  String regEx="[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
  Pattern   p   =   Pattern.compile(regEx);
  Matcher   m   =   p.matcher(str);
  System.out.println(m.replaceAll("").trim());
	}

}