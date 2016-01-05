package com.lrj.controller.system;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.DOMReader;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;
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
	public PageView findByPage(String pageNow, String pageSize, String column,
			String sort) throws Exception {
		CustomerLoanFormMap customerFormMap = getFormMap(CustomerLoanFormMap.class);
		customerFormMap = toFormMap(customerFormMap, pageNow, pageSize,
				customerFormMap.getStr("orderby"));
		customerFormMap.put("column", column);
		customerFormMap.put("sort", sort);

		// 获取下属员工
		// 获取登录的bean
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
		UserFormMap userFormMap = (UserFormMap) Common.findUserSession(request);

		List<String> salesman = new ArrayList<>();

		List<Integer> roleIds = new ArrayList<>();
		UserRoleFormMap userRoleFormMap = new UserRoleFormMap();
		userRoleFormMap.put("userId",
				Integer.parseInt(userFormMap.get("id").toString()));

		List<UserRoleFormMap> userRoleFormMaps = userMapper
				.findByNames(userRoleFormMap);
		for (UserRoleFormMap u : userRoleFormMaps) {
			getAllLowerRoles(Integer.parseInt(u.get("roleId").toString()),
					roleIds);
		}

		String strRoleIds = "";
		for (Integer roleId : roleIds) {
			strRoleIds += roleId + ",";
		}
		strRoleIds = Common.trimComma(strRoleIds);

		UserFormMap ufm = getFormMap(UserFormMap.class);
		ufm.put("roleIds", strRoleIds);
		List<UserFormMap> allLowerUser = userMapper.selectAllLowerUser(ufm);

		for (UserFormMap u : allLowerUser) {
			salesman.add(u.get("accountName").toString());// 当前用户可以查看其下属用户的客户
		}

		salesman.add(userFormMap.get("accountName").toString());// 自己可以查看自己的客户
		customerFormMap.put("lowerSalesman", salesman);

		pageView.setRecords(customerMapper.findCustomerPage(customerFormMap));// 不调用默认分页,调用自已的mapper中findUserPage
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
		CustomerBasicFormMap customerBasicFormMap = customerMapper.findbyFrist(
				"idCard", customerLoanFormMap.get("idCard").toString(),
				CustomerBasicFormMap.class);
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
	public String picList(Model model, String applyloanKey) {
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

		model.addAttribute("customerPics", customerPics);
		model.addAttribute("applyloanKey", applyloanKey);
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
	public void exportAll(HttpServletRequest request,
			HttpServletResponse response, String applyloanKey)
			throws IOException {
		CustomerLoanFormMap customerLoanFormMap = customerMapper.findbyFrist(
				"applyloanKey", applyloanKey, CustomerLoanFormMap.class);

		String picPath = customerLoanFormMap.get("picPath").toString();
		String idCard = customerLoanFormMap.get("idCard").toString();
		CustomerBasicFormMap customerBasicFormMap = customerMapper.findbyFrist(
				"idCard", idCard, CustomerBasicFormMap.class);
		String custName = customerBasicFormMap.get("name").toString();

		String filePath = request.getServletContext().getRealPath(picPath);

		File zip = ZipUtil.zip(filePath, custName);

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
	// @ResponseBody
	// @RequestMapping(value="addCusInfo", method = RequestMethod.POST)
	// @SystemLog(module="客户管理",methods="客户管理-新增客户")//凡需要处理业务逻辑的.都需要记录操作日志
	// @Transactional(readOnly=false)//需要事务操作必须加入此注解
	public boolean addCusInfo(HttpServletRequest request, String cusInfo) {

		String time = Common.fromDateH();
		JSONObject jsonInfo = null;

		// if(null == cusInfo){
		// String param =
		// "{\"basic\":{\"idCard\":\"320322154802041156\",\"name\":\"张顶飞\",\"sex\":\"男\",\"age\":\"32\",\"national\":\"汉\",\"phoneNumber\":\"13062505804\",\"qqPhone\":\"105523225\",\"censusSeat\":\"江苏南京\",\"parentSeat\":\"江苏徐州\",\"nowliveAddress\":\"江苏南京建邺区\",\"unitName\":\"南京凌睿吉\",\"unitAddress\":\"南京晓庄\",\"unitPhone\":\"025-110110110\",\"descriPtion\":\"描述信息\"},\"contact\":{\"relativesName\":\"王斌\",\"relativesPhoneNumber\":\"111111111\",\"socialFriendsName\":\"李治国\",\"socialFriendsPhoneNumber\":\"222222222\",\"classmatesName\":\"陈忠\",\"classmatesPhoneNubmer\":\"3333333\",\"colleaguesName\":\"王婷婷\",\"colleaguesPhoneNumber\":\"645135165\",\"simpleFriend\":\"赵柳\",\"simpleFriendPhoneNumber\":\"2131\",\"borrowFriendsName\":\"王琪\",\"borrowFriendsPhoneNumber\":\"9865465\"},\"credit\":{\"workYear\":\"3-5年\",\"commericial\":\"有\",\"nickName\":\"工程师\",\"socialYear\":\"10年\",\"houserProperty\":\"100万\",\"longLive\":\"江苏南京\",\"annualIncome\":\"20万\",\"maritalStatus\":\"已婚\",\"cusAge\":\"32岁\",\"educationDegree\":\"本科\",\"professional\":\"工程师\",\"loanRecords\":\"无贷款记录\",\"creditCards\":\"8000\",\"creditReport\":\"诚信良好\"},\"loan\":{\"salesman\":\"lisi\",\"idCard\":\"320322154802041156\",\"applyloanKey\":\"20151216224823\",\"applyloanBlx\":\"翼农贷\",\"applyloanJkje\":\"100000\",\"applyloanJkqx\":\"40天\",\"applyloanZgnll\":\"10.0%\",\"applyloanHkfs\":\"还本付息\",\"applyloanJklx\":\"个人消费\",\"applyloanJkQy\":\"江苏南京\",\"applyloanJkmd\":\"房贷\",\"applyloanMsxx\":\"描述信息\"}}";
		// jsonInfo = JSONObject.parseObject(param);
		// }else{
		System.out.println("cusInfo参数值：" + cusInfo);

		jsonInfo = JSONObject.parseObject(cusInfo);
		// }

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
			// String picHolePath =
			// request.getServletContext().getRealPath(picPath);
			// File picFile = new File(picHolePath);
			//
			// if(!picFile.exists()){
			// picFile.mkdirs();
			// }

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

	// @ResponseBody
	// @RequestMapping(value="addCusPic", method = RequestMethod.POST)
	// @SystemLog(module="客户管理",methods="客户管理-上传图片")//凡需要处理业务逻辑的.都需要记录操作日志
	// @Transactional(readOnly=false)//需要事务操作必须加入此注解
	public boolean addCusPic(HttpServletRequest request, File picFile,
			String picInfo) {
		CustomerPicFormMap customerPicFormMap = JSONObject.parseObject(picInfo,
				CustomerPicFormMap.class);
		String applyloanKey = customerPicFormMap.get("applyloanKey").toString();

		CustomerLoanFormMap customerLoanFormMap = customerMapper.findbyFrist(
				"applyloanKey", applyloanKey, CustomerLoanFormMap.class);
		String picPath = customerLoanFormMap.get("picPath").toString();
		String applyloanBlx = customerLoanFormMap.get("applyloanBlx")
				.toString();
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
	public boolean saveCusInfo(HttpServletRequest request, String cusInfo,
			String picInfo) {
		// {"credittype":"2","filePath":"/storage/emulated/0/Android/data/com.lrj.ptp/files/admin/123456/2/5/20160104165042.jpg","fileleng":4707105,"filename":"20160104165042.jpg","filetype":"5","id":22,"idCard":"123456","isupover":"0","username":"admin"}
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile picFile = multipartRequest.getFile("picFile");
		if (null != cusInfo) {
			addCusInfo(request, cusInfo);
		}

		CustomerPicFormMap customerPicFormMap = new CustomerPicFormMap();
		for (Map.Entry<String, Object> entry : JSONObject.parseObject(picInfo)
				.entrySet()) {
			if (entry.getKey().equals("id")) {
				continue;
			}
			customerPicFormMap.put(entry.getKey(), entry.getValue());
		}

		String applyloanKey = customerPicFormMap.get("applyloanKey").toString();
		// String applyloanKey = "20151216224823";
//		String name = customerPicFormMap.get("name").toString();// 客户姓名
		String name = "测试";
		String fileName = customerPicFormMap.get("filename").toString();
		String applyloanBlx = getLoanType(Integer.parseInt(customerPicFormMap.get("credittype").toString()));// 标类型

		String picPath = "/uploadFile/" + name + "_" + applyloanKey;

		String filetype = getPicType(Integer.parseInt(customerPicFormMap.get("credittype").toString()),Integer.parseInt(customerPicFormMap.get("filetype").toString()));

		String picRealPath = request.getServletContext().getRealPath(picPath + "/" + applyloanBlx + "/" + filetype);

		File saveFile = new File(picRealPath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}

		try {
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
			logger.info("上传失败");
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
		Matcher   m   =   p.matcher(picType);
		return m.replaceAll("").trim();
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