package com.himan.content.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.himan.content.model.Message;
import com.himan.content.model.User;
import com.himan.content.service.IFileUploadService;
import com.himan.content.service.IUserService;
import com.himan.others.WoException;
import com.himan.others.WoResultCode;

@Controller
@RequestMapping("/")
public class UserController {
	
	private final static Logger LOG = LogManager.getLogger(UserController.class);
	
	@Autowired
	private IUserService userService;
	
	@Resource
	private IFileUploadService fileUploadService;

	@RequestMapping("/firstpage")
	public String first() {
		return "login";
	}

	
	@RequestMapping("/Goregister")
	public String Goregister() {
		return "register";
	}
	
	@ResponseBody
	@RequestMapping(value = "/register", produces = "application/json")
	public Object register(User user) {
		try {
			userService.register(user);
			return new WoResultCode().setMsg("注册成功，去登录");		
		} catch (WoException wo) {
			WoResultCode code = wo.getCode();
			return code;
		}
	}


	@RequestMapping(value = "/loginIn", produces = "application/json")
	public String login(String userPhone, String userPwd) {
		try {
			userService.login(userPhone, userPwd);
			System.out.println("sucess");
			return "login_index";
		} catch (WoException we) {
			return "login";
		}

	}

	@ResponseBody
	@RequestMapping("/personal")
	public Object changeData(User user, String userPhone) {
		try {
			userService.changeData(user, userPhone);
			return null;
		} catch (WoException wo) {
			return null;
		}
	}
	
	
	@RequestMapping("/myUserInfo")
	public String myUserInfo() {
		return "user";
	}
	
	@ResponseBody
	@RequestMapping("/changeHead")
	public Object changeHead(User user, MultipartFile userHead, HttpServletRequest request){
		try {
			String hd = fileUploadService.uploadFile(userHead, request);
			user.setUserHead(hd);
			userService.updateUserHead(user);
			return WoResultCode.getSuccess().setMsg("头像修改成功！");
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("头像修改失败！");
		}
		
	}
	
	@RequestMapping(value = "/myHomePage", produces = "application/json")
	public Object myHomePage(String userId){
		
		List<Message> list = userService.findMyWei(userId);
		
		new WoResultCode();
		
		
		return list;
		
	}
	
	

	
}
