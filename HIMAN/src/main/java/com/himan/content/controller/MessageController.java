package com.himan.content.controller;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.web.servlet.result.JsonPathResultMatchers;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.himan.content.dao.IUserDao;
import com.himan.content.model.Comment;
import com.himan.content.model.MImage;
import com.himan.content.model.Message;
import com.himan.content.model.User;
import com.himan.content.service.ICommentService;
import com.himan.content.service.IFileUploadService;
import com.himan.content.service.IMessageService;
import com.himan.content.service.ISendService;
import com.himan.others.WoException;
import com.himan.others.WoResultCode;

@Controller
@RequestMapping("/message")
public class MessageController {
	/**
	 * Recording the log of this class.
	 */

	private final static Logger LOG = LogManager.getLogger(MessageController.class);

	@Resource
	private IMessageService messageService;

	@Autowired
	private ISendService sendService;
	
	@Resource
	private IFileUploadService fileUploadService;

	@Resource
	private ICommentService commentService;
	
	@Resource
	private IUserDao userDao;

	// 发微博
	@ResponseBody
	@RequestMapping("/createMessage")
	public Object sendWB(Message message, MultipartFile file1, MultipartFile file2,
			MultipartFile file3, MultipartFile file4, MultipartFile file5,
			MultipartFile file6, MultipartFile file7, MultipartFile file8,
			MultipartFile file9, HttpServletRequest request,String username) {
		try {
			List<MultipartFile> fileList = new ArrayList<MultipartFile>();
			fileList.add(file1);fileList.add(file2);fileList.add(file3);
			fileList.add(file4);fileList.add(file5);fileList.add(file6);
			fileList.add(file7);fileList.add(file8);fileList.add(file9);
			List<String> hds = new ArrayList<String>();
			for (MultipartFile file : fileList) {
				if(file.getSize()!=0){
					String hd = fileUploadService.uploadFile(file, request);
					hds.add(hd);
				}
			}
			List<MImage> mImages = new ArrayList<MImage>();
			for (String hd : hds) {
				if (hd != null) {
					MImage m = new MImage();
					m.setmImageId(Math.random()+"");
					m.setUrl(hd);
					sendService.save(m);
					mImages.add(m);
				}
			}
			LOG.info(username);
			User user = userDao.find(username);
			LOG.info(user.getUserName());
			message.setUser(user);
			message.setmImages(mImages);
			message.setMessageId(Math.random()+"");
			message.setMessageDate(new Date());
			sendService.sendWB(message);
			List<Message> newestList = messageService.getNewestList();
			return WoResultCode.getSuccess().setContent(newestList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博发表失败！");
		}
	}
	

	// 删除
	@ResponseBody
	@RequestMapping("/deleteMessage")
	public Object deleteWB(String messageId) {
		try {
			sendService.deleteWB(messageId);
			List<Message> newestList = messageService.getNewestList();
			return WoResultCode.getSuccess().setContent(newestList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博删除失败！");
		}

	}

	// 转发微博
	@ResponseBody
	@RequestMapping("/transmitMessage")
	public Object forwardWB(String messageId, String commentUserId) {

		try {
			sendService.forward(messageId, commentUserId);
			List<Message> newestList = messageService.getNewestList();
			Message message = messageService.getByMessageId(messageId);
			int forward = message.getMessageForward();
			List list=new ArrayList();
			list.add(newestList);
			list.add(forward);
			return WoResultCode.getSuccess().setContent(list);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博转发失败！");
		}

	}

	//评论
	@ResponseBody
	@RequestMapping("/sendComment")
	public Object sendCM(Comment comment) {
		try {

			commentService.sendCM(comment);
			String messageId = comment.getMessage().getMessageId();
//			int commentCount = comment.getMessage().getComments().size();
			List<Comment> comments = messageService.findCommentByMessageId(messageId);
			List list=new ArrayList();
//			list.add(commentCount);
			list.add(comments);
			return WoResultCode.getSuccess().setContent(list);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("评论发表失败！");
		}
	}

	/*// 删除评论
	@ResponseBody
	@RequestMapping("/deleteComment")
	public Object deleteCM(Comment comment) {
		try {
			commentService.deleteWB(comment.getCommentId());
			String messageId = comment.getMessage().getMessageId();
//			int commentCount = comment.getMessage().getComments().size();
			List<Comment> comments = messageService.findCommentByMessageId(messageId);
			List list=new ArrayList();
			list.add(commentCount);
			list.add(comments);
			return WoResultCode.getSuccess().setContent(list);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("评论删除失败！");
		}

	}*/

	// 热门动态
	@ResponseBody
	@RequestMapping(value = "/hotAnalysis", produces = "application/json")
	public Object getHotList() {
			List<Message> hotList = messageService.getHotList();
			
			return WoResultCode.getSuccess().setContent(hotList);
	}

	// 最新动态
	@ResponseBody
	@RequestMapping(value = "/newestAnalysis", produces = "application/json")
	public Object getNewestList() {
		try {
			List<Message> newestList = messageService.getNewestList();
			return WoResultCode.getSuccess().setContent(newestList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败！");
		}
	}

	// 明星动态
	@ResponseBody
	@RequestMapping(value = "/starAnalysis", produces = "application/json")
	public Object getStarList() {
		try {
			List<Message> newestList = messageService.getStarList();
			return WoResultCode.getSuccess().setContent(newestList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败！");
		}
	}

	// 搞笑动态
	@ResponseBody
	@RequestMapping(value = "/funnyAnalysis", produces = "application/json")
	public Object getFunnyList() {
		try {
			List<Message> newestList = messageService.getFunnyList();
			return WoResultCode.getSuccess().setContent(newestList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败！");
		}
	}

	// 情感动态
	@ResponseBody
	@RequestMapping(value = "/emotionAnalysis", produces = "application/json")
	public Object getEmotionList() {
		try {
			List<Message> newestList = messageService.getEmotionList();
			return WoResultCode.getSuccess().setContent(newestList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败！");
		}
	}

	// 军事动态
	@ResponseBody
	@RequestMapping(value = "/militaryAnalysis", produces = "application/json")
	public Object getMilitaryList() {
		try {
			List<Message> newestList = messageService.getMilitaryList();
			return WoResultCode.getSuccess().setContent(newestList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败！");
		}
	}

	// 社会动态
	@ResponseBody
	@RequestMapping(value = "/socialAnalysis", produces = "application/json")
	public Object getSocialList() {
		try {
			List<Message> newestList = messageService.getSocialList();
			return WoResultCode.getSuccess().setContent(newestList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败！");
		}
	}

	// 时尚动态
	@ResponseBody
	@RequestMapping(value = "/fashionAnalysis", produces = "application/json")
	public Object getFashionList() {
		try {
			List<Message> newestList = messageService.getFashionList();
			return WoResultCode.getSuccess().setContent(newestList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败！");
		}
	}

	// 运动动态
	@ResponseBody
	@RequestMapping(value = "/sportsAnalysis", produces = "application/json")
	public Object getSportsList() {
		try {
			List<Message> newestList = messageService.getSportsList();
			return WoResultCode.getSuccess().setContent(newestList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败！");
		}
	}

	// 动漫动态
	@ResponseBody
	@RequestMapping(value = "/cartoonAnalysis", produces = "application/json")
	public Object getCartoonList() {
		try {
			List<Message> newestList = messageService.getCartoonList();
			return WoResultCode.getSuccess().setContent(newestList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败！");
		}
	}

	// 动态详情
	@ResponseBody
	@RequestMapping(value = "/findByMessageId", produces = "application/json")
	public Object findByMessageId(String messageId) {
		try {
			Message message = messageService.findByMessageId(messageId);
			List<Comment> comments = messageService.findCommentByMessageId(messageId);
			List list = new ArrayList();
			list.add(comments);
			list.add(message);
			return WoResultCode.getSuccess().setContent(list);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败！");
		}
	}

	// 点赞
	@ResponseBody
	@RequestMapping(value = "/addPraise", produces = "application/json")
	public Object addPraise(String messageId, String userId) {
		try {
			Message message = messageService.addPraise(messageId, userId);
			int messagePraise = message.getMessagePraise();
			return WoResultCode.getSuccess().setContent(messagePraise);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("点赞失败！");
		}
	}

	// 收藏
	@ResponseBody
	@RequestMapping(value = "/collect", produces = "application/json")
	public Object collect(String messageId, String userId) {
		try {
			Message message = messageService.collect(messageId, userId);
			String messageCollect = message.getMessageCollect();
			return WoResultCode.getSuccess().setContent(messageCollect);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("收藏失败!");
		}
	}

	// 特别关注
	@ResponseBody
	@RequestMapping(value = "/attention", produces = "application/json")
	public Object attention(String userId) {
		try {
			List<Message> attentionList = messageService.attention(userId);
			return WoResultCode.getSuccess().setContent(attentionList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败!");
		}
	}

	// 纯文章
	@ResponseBody
	@RequestMapping(value = "/article", produces = "application/json")
	public Object article() {
		try {
			List<Message> articleList = messageService.article();
			return WoResultCode.getSuccess().setContent(articleList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败!");
		}
	}

	// 一张图片
	@ResponseBody
	@RequestMapping(value = "/singleImage", produces = "application/json")
	public Object singleImage() {
		try {
			List<Message> singleImageList = messageService.singleImage();
			return WoResultCode.getSuccess().setContent(singleImageList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败!");
		}
	}

	// 四张图片
	@ResponseBody
	@RequestMapping(value = "/fourImage", produces = "application/json")
	public Object fourImage() {
		try {
			List<Message> fourImageList = messageService.fourImage();
			return WoResultCode.getSuccess().setContent(fourImageList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败!");
		}
	}

	// 模糊查询
	@ResponseBody
	@RequestMapping(value = "/fuzzySearch", produces = "application/json")
	public Object fuzzySearch(String keyword) {
		try {
			List<Message> fuzzySearchList = messageService.fuzzySearch(keyword);
			return WoResultCode.getSuccess().setContent(fuzzySearchList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败!");
		}
	}

	// 我的收藏
	@ResponseBody
	@RequestMapping(value = "/myCollect", produces = "application/json")
	public Object myCollect(String userId) {
		try {
			List<Message> myCollectList = messageService.myCollect(userId);
			return WoResultCode.getSuccess().setContent(myCollectList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败!");
		}
	}

	// 我的赞
	@ResponseBody
	@RequestMapping(value = "/myPraise", produces = "application/json")
	public Object myPraise(String userId) {
		try {
			List<Message> myPraiseList = messageService.myPraise(userId);
			return WoResultCode.getSuccess().setContent(myPraiseList);
		} catch (WoException e) {
			return e.getCode();
		} catch (Exception e) {
			return WoResultCode.getUnknown().setMsg("微博载入失败!");
		}
	}
}
