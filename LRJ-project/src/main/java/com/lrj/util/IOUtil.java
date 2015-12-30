package com.lrj.util;

import java.io.Closeable;
import java.io.IOException;

/**
 * @Title: IOUtil.java
 * @Package: com.lrj.util
 * @Description: 关闭流对象
 * @CreateUser: 张顶飞 zhangdf@tiansu-china.com
 * @CreateDate: 2015年12月10日 下午4:56:23
 * @UpdateUser: 张顶飞 zhangdf@tiansu-china.com
 * @UpdateDate: 2015年12月10日 下午4:56:23
 */
public class IOUtil {
	/**
	 *
	 * @Description 关闭一个或多个流对象
	 * @CreateUser 张顶飞 zhangdf@tiansu-china.com
	 * @CreateDate 2015年12月10日 下午4:56:55
	 * @UpdateUser 张顶飞 zhangdf@tiansu-china.com
	 * @UpdateDate 2015年12月10日 下午4:56:55
	 * @param closeables 可关闭的流对象列表
	 * @throws IOException
	 */
    public static void close(Closeable... closeables){
        try {
			if (closeables != null) {
			    for (Closeable closeable : closeables) {
			        if (closeable != null) {
			            closeable.close();
			        }
			    }
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
    }

}
