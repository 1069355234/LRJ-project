package com.lrj.controller.system;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
@RequestMapping("/download/")
public class DownloadController extends BaseController {

	private final Logger logger = LoggerFactory.getLogger(DownloadController.class);

	@RequestMapping("download")
	public String listUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/download/download";
	}

	@RequestMapping("downloadPhoneApk")
	public void download(HttpServletRequest request,
			HttpServletResponse response) {
		String realPath = request.getServletContext().getRealPath("/app/phone.apk");
		String filename = realPath.substring(realPath.lastIndexOf("\\") + 1);// 获取文件名称，在转化为子串
		// response.setHeader告诉浏览器以什么方式打开
		// 假如文件名称是中文则要使用 URLEncoder.encode()编码
		// 否则直接使用response.setHeader("content-disposition",
		// "attachment;filename=" + filename);即可

		InputStream in = null;
		OutputStream out = null;
		try {
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(filename, "UTF-8"));
			in = new FileInputStream(realPath); // 获取文件的流
			int len = 0;
			byte buf[] = new byte[1024];// 缓存作用
			out = response.getOutputStream();// 输出流
			while ((len = in.read(buf)) > 0) // 切忌这后面不能加 分号 ”;“
			{
				out.write(buf, 0, len);// 向客户端输出，实际是把数据存放在response中，然后web服务器再去response中读取
			}
			logger.info("下载apk文件成功");
		} catch (Exception e) {
			logger.error("下载apk文件异常，原因："+e.getMessage());
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

}