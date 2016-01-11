package com.lrj.controller.system;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lrj.controller.index.BaseController;
import com.lrj.util.Common;

/**
 *
 * @author lanyuan 2014-11-19
 * @Email: mmm333zzz520@163.com
 * @version 3.0v
 */
@Controller
@RequestMapping("/map/")
public class MapController extends BaseController {

	@RequestMapping("map")
	public String listUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/map/welcome";
	}

}