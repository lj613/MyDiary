package com.diary.util;

import java.util.Date;
import java.util.List;

/**
 * 实用工具类
 * @author Lenovo
 *
 */
public class StringUtil {
	
	/**
	 * 将给定的list按照指定的分隔符分割成字符串返回
	 * @param list
	 * @param split
	 * @return
	 */
	public static String joinString(List<Long> list,String split){
		String ret = "";
		for(Long l:list){
			ret += l + split;
		}
		if(!"".equals(ret)){
			ret = ret.substring(0,ret.length() - split.length());
		}
		return ret;
	}
	
	
	/**
	   *     生成用户编号的方法
	 * @param prefix
	 * @param suffix
	 * @return
	 */
	public static String generateUn(String prefix,String suffix){
		return prefix + new Date().getTime() + suffix;
	}
	public static boolean isEmpty(String str){
		if("".equals(str)|| str==null){
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean isNotEmpty(String str){
		if(!"".equals(str)&&str!=null){
			return true;
		}else{
			return false;
		}
	}
}
