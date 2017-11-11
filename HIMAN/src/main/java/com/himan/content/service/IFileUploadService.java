package com.himan.content.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.himan.others.WoResultCode;;

public interface IFileUploadService {

	/**
	 * @param file
	 * @param request
	 * @return
	 */
	public String uploadFile(MultipartFile file, HttpServletRequest request);

	public final static WoResultCode SAVE = new WoResultCode(201, "保存文件失败！");
}
