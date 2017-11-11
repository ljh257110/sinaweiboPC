package com.himan.content.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.himan.content.model.User;
import com.himan.content.service.IUserService;
import com.himan.others.WoException;
import com.himan.others.WoResultCode;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/")
public class HomeController {
	private final static Logger LOG = LogManager.getLogger(HomeController.class);
	@Autowired
	private IUserService userService;

	@ResponseBody
	@RequestMapping(value = "/register", produces = "application/json")
	public Object register(User user) {
		try {
			userService.register(user);

			System.out.println(user.getUserPhone());
			System.out.println(user.getUserPwd());
			return new WoResultCode().setMsg("注册成功，去登录");
		} catch (WoException wo) {

			WoResultCode code = wo.getCode();
			return code;
		}

	}

	@RequestMapping("/Goregister")
	public String Goregister() {
		return "register";

	}

}
