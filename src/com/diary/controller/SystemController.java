package com.diary.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.diary.entity.Admin;
import com.diary.entity.User;
import com.diary.service.AdminService;
import com.diary.service.UserService;
import com.diary.util.CpachaUtil;
import com.diary.util.StringUtil;

/**
 * 
 * @author Lenovo 系统主页控制器
 * 
 */
@RequestMapping("/system")
@Controller
public class SystemController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;

	// 后台首页
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	// 方式1
	/*
	 * public String index() { return "hello world"; }
	 */
	// 方式2
	public ModelAndView index(ModelAndView model) {
		model.setViewName("system/index"); // 转到的视图页面的名字
		return model;
	}

	/**
	 * 登陆
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView model) {
		model.setViewName("system/login"); // 转到的视图页面的名字
		return model;
	}
	
	/**
	 * 注销登录 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/login_out",method=RequestMethod.GET)
	public String loginOut(HttpServletRequest request){
		request.getSession().setAttribute("user", null);
		return "redirect:login";
	}

	// 注册页面
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register(ModelAndView model) {
		model.setViewName("system/register"); // 转到的视图页面的名字
		return model;
	}

	// 后台首页左侧部分
	@RequestMapping(value = "/left", method = RequestMethod.GET)
	public ModelAndView left(ModelAndView model) {
		model.setViewName("system/left");
		return model;
	}

	// 后台首页顶部部分
	@RequestMapping(value = "/top", method = RequestMethod.GET)
	public ModelAndView top(ModelAndView model) {
		System.out.println("top加载");
		model.setViewName("system/top");
		return model;
	}
	
	// 后台首页底部部分
	@RequestMapping(value = "/bottom", method = RequestMethod.GET)
	public ModelAndView bottom(ModelAndView model) {
		System.out.println("bottom加载");
		model.setViewName("system/bottom");
		return model;
	}

	// 后台首页欢迎页面部分
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public ModelAndView welcome(ModelAndView model) {
		model.setViewName("system/welcome");
		return model;
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView admin(ModelAndView model) {
		model.setViewName("system/index"); // 转到的视图页面的名字
		return model;
	}

	/**
	 * 登录表单提交
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> login(@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "vcode", required = true) String vcode,
			@RequestParam(value = "type", required = true) int type,
			HttpServletRequest request) {
		Map<String, String> ret = new HashMap<String, String>();
		if (StringUtils.isEmpty(username)) {
			ret.put("type", "error");
			ret.put("msg", "用户名不能为空!");
			return ret;
		}
		if (StringUtils.isEmpty(password)) {
			ret.put("type", "error");
			ret.put("msg", "密码不能为空!");
			return ret;
		}
		if (StringUtils.isEmpty(vcode)) {
			ret.put("type", "error");
			ret.put("msg", "验证码不能为空!");
			return ret;
		}
		String loginCpacha = (String) request.getSession().getAttribute("loginCpacha");
		if (StringUtils.isEmpty(loginCpacha)) {
			ret.put("type", "error");
			ret.put("msg", "长时间未操作，会话已失效，请刷新后重试!");
			return ret;
		}
		if (!vcode.toUpperCase().equals(loginCpacha.toUpperCase())) {
			ret.put("type", "error");
			ret.put("msg", "验证码错误!");
			return ret;
		}
		// 清空缓存中的验证码
		request.getSession().setAttribute("loginCpacha", null);
		System.out.println(type);
		// 从数据库中查找用户
		if (type == 1) {
			System.out.println("管理员登陆");
			// 管理员登陆
			Admin admin = adminService.findByUserName(username);
		    System.out.println(admin);
			if (admin == null) {
				ret.put("type", "error");
				ret.put("msg", "不存在该用户!");
				return ret;
			}
			if (!password.equals(admin.getPassword())) {
				ret.put("type", "error");
				ret.put("msg", "密码错误!");
				return ret;
			}
			System.out.println("查询到的admin:" + admin);
			request.getSession().setAttribute("user", admin);
			
			System.out.println(admin.getPassword());
			Object user2 = request.getSession().getAttribute("user");
			System.out.println("从缓存中获取的user:"+ user2);
		}
		if (type == 2) {
			// 普通用户登陆
			System.out.println("普通用户登陆，用户名为:" + username);
			User user = userService.findByUserName(username);
			System.out.println("普通用户");
			  System.out.println(user);
				if (user == null) {
					ret.put("type", "error");
					ret.put("msg", "不存在该用户!");
					return ret;
				}
				if (!password.equals(user.getPassword())) {
					ret.put("type", "error");
					ret.put("msg", "密码错误!");
					return ret;
				}
				System.out.println("查询到的admin:" + user);
				request.getSession().setAttribute("user", user);
		}
		//保存用户类型
		request.getSession().setAttribute("userType",type);
		ret.put("type", "success");
		ret.put("msg", "登录成功!");
		return ret;
	}


	/**
	 * 注册表单提交
	 * 
	 * @return
	 */

	@RequestMapping(value = "/register", method = RequestMethod.POST)

	@ResponseBody
	public Map<String, String> register(

			@RequestParam(value = "username", required = true) String username,

			@RequestParam(value = "password", required = true) String password,

			@RequestParam(value = "repassword", required = true) String repassword,

			@RequestParam(value = "vcode", required = true)
		String vcode, HttpServletRequest request) {
		Map<String, String> ret = new HashMap<String, String>();
		if (StringUtils.isEmpty(username)) {
			ret.put("type", "error");
			ret.put("msg", "用户名不能为空!");
			return ret;
		}
		if (StringUtils.isEmpty(password)) {
			ret.put("type", "error");
			ret.put("msg", "密码不能为空!");
			return ret;
		}
		if (StringUtils.isEmpty(repassword)) {
			ret.put("type", "error");
			ret.put("msg", "确认密码不能为空!");
			return ret;
		}
		if (!repassword.equals(password)) {
			ret.put("type", "error");
			ret.put("msg", "两次密码不一致");
			return ret;
		}
		if (StringUtils.isEmpty(vcode)) {
			ret.put("type", "error");
			ret.put("msg", "验证码不能为空!");
			return ret;
		}
		String loginCpacha = (String) request.getSession().getAttribute("loginCpacha");
		if (StringUtils.isEmpty(loginCpacha)) {
			ret.put("type", "error");
			ret.put("msg", "长时间未操作，会话已失效，请刷新后重试!");
			return ret;
		}
		if (!vcode.toUpperCase().equals(loginCpacha.toUpperCase())) {
			ret.put("type", "error");
			ret.put("msg", "验证码错误!");
			return ret;
		} // 清空缓存中的验证码
		request.getSession().setAttribute("loginCpacha", null);
		User existUser = userService.findByUserName(username);
		if (existUser != null) {
			ret.put("type", "error");
			ret.put("msg", "该用户名已经存在!");
			return ret;
		}
		User user = new User();
		user.setUn(StringUtil.generateUn("U", ""));
		user.setSex("男");
    	user.setPhoto("/MyDiary/upload/1612144135561.jpg");
		user.setUsername(username);
		user.setPassword(password);
		if(userService.add(user) <= 0){
			ret.put("type", "error");
			ret.put("msg", "注册失败!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "注册成功！!");
		return ret;
	}

	/**
	 * 显示 验证码
	 * 
	 * @param request
	 * @param vl
	 * @param w
	 * @param h
	 * @param response
	 */
	@RequestMapping(value = "/get_cpacha", method = RequestMethod.GET)
	public void getCpacha(HttpServletRequest request,
			@RequestParam(value = "vl", defaultValue = "4", required = false) Integer vl, /* 验证码个数 */
			@RequestParam(value = "w", defaultValue = "98", required = false) Integer w, /* 宽度 */
			@RequestParam(value = "h", defaultValue = "33", required = false) Integer h, /* 高度 */
			HttpServletResponse response) {
		/* System.out.println("验证码"); */
		CpachaUtil cpachaUtil = new CpachaUtil(vl, w, h);
		String generatorVCode = cpachaUtil.generatorVCode();
		request.getSession().setAttribute("loginCpacha", generatorVCode);
		BufferedImage generatorRotateVCodeImage = cpachaUtil.generatorRotateVCodeImage(generatorVCode, true);
		try {
			ImageIO.write(generatorRotateVCodeImage, "gif", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
