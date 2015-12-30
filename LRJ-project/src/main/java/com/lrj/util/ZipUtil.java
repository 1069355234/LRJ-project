package com.lrj.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * @Title: ZipUtil.java
 * @Package: com.lrj.util
 * @Description: 压缩和解压缩文件
 * @CreateUser: 张顶飞 zhangdf@tiansu-china.com
 * @CreateDate: 2015年12月10日 下午4:54:03
 * @UpdateUser: 张顶飞 zhangdf@tiansu-china.com
 * @UpdateDate: 2015年12月10日 下午4:54:03
 */
public class ZipUtil {
	private static byte[] buffer = new byte[1024 * 10];

	private ZipUtil() {
	}

	/**
	 *
	 * @Description 压缩文件
	 * @CreateUser 张顶飞 zhangdf@tiansu-china.com
	 * @CreateDate 2015年12月10日 下午5:06:40
	 * @UpdateUser 张顶飞 zhangdf@tiansu-china.com
	 * @UpdateDate 2015年12月10日 下午5:06:40
	 * @param filePath 待压缩的文件路径
	 * @return 压缩后的文件
	 */
	public static File zip(String filePath,String custName) {
		File target = null;
		File source = new File(filePath);
		if (source.exists()) {
			// 压缩文件名=源文件名.zip
			String zipName = custName + "_" + source.getName() + ".zip";
			target = new File(source.getParent(), zipName);
			if (target.exists()) {
				target.delete(); // 删除旧的文件
			}
			FileOutputStream fos = null;
			ZipOutputStream zos = null;
			try {
				fos = new FileOutputStream(target);
				zos = new ZipOutputStream(new BufferedOutputStream(fos));
				// 添加对应的文件Entry
				addEntry("/", source, zos);
			} catch (IOException e) {
				throw new RuntimeException(e);
			} finally {
				IOUtil.close(zos, fos);
			}
		}
		return target;
	}

	/**
	 *
	 * @Description 扫描添加文件Entry
	 * @CreateUser 张顶飞 zhangdf@tiansu-china.com
	 * @CreateDate 2015年12月10日 下午5:07:31
	 * @UpdateUser 张顶飞 zhangdf@tiansu-china.com
	 * @UpdateDate 2015年12月10日 下午5:07:31
	 * @param base 基路径
	 * @param source 源文件
	 * @param zos Zip文件输出流
	 * @throws IOException
	 */
	private static void addEntry(String base, File source, ZipOutputStream zos)
			throws IOException {
		// 按目录分级，形如：/aaa/bbb.txt
		String entry = base + source.getName();
		if (source.isDirectory()) {
			for (File file : source.listFiles()) {
				// 递归列出目录下的所有文件，添加文件Entry
				addEntry(entry + "/", file, zos);
			}
		} else {
			FileInputStream fis = null;
			BufferedInputStream bis = null;
			try {
				fis = new FileInputStream(source);
				bis = new BufferedInputStream(fis, buffer.length);
				int read = 0;
				zos.putNextEntry(new ZipEntry(entry));
				while ((read = bis.read(buffer, 0, buffer.length)) != -1) {
					zos.write(buffer, 0, read);
				}
				zos.closeEntry();
			} finally {
				IOUtil.close(bis, fis);
			}
		}
	}

	/**
	 *
	 * @Description 解压文件
	 * @CreateUser 张顶飞 zhangdf@tiansu-china.com
	 * @CreateDate 2015年12月10日 下午5:08:04
	 * @UpdateUser 张顶飞 zhangdf@tiansu-china.com
	 * @UpdateDate 2015年12月10日 下午5:08:04
	 * @param filePath 压缩文件路径
	 */
	public static void unzip(String filePath) {
		File source = new File(filePath);
		if (source.exists()) {
			ZipInputStream zis = null;
			BufferedOutputStream bos = null;
			try {
				zis = new ZipInputStream(new FileInputStream(source));
				ZipEntry entry = null;
				while ((entry = zis.getNextEntry()) != null
						&& !entry.isDirectory()) {
					File target = new File(source.getParent(), entry.getName());
					if (!target.exists()) {
						// 创建文件父目录
						(new File(target.getParent())).mkdirs();
					}
					// 写入文件
					bos = new BufferedOutputStream(new FileOutputStream(target));
					int read = 0;
					while ((read = zis.read(buffer, 0, buffer.length)) != -1) {
						bos.write(buffer, 0, read);
					}
				}
				zis.closeEntry();
			} catch (IOException e) {
				throw new RuntimeException(e);
			} finally {
				IOUtil.close(zis, bos);
			}
		}
	}

	public static void main(String[] args) {
		String targetPath = "F:/张三";
//		File file = ZipUtil.zip(targetPath);
//		System.out.println(file);
		ZipUtil.unzip("F:/张三.zip");
	}
}
