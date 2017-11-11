package com.himan.content.service.impl;
import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.himan.content.service.IFileUploadService;
import com.himan.others.WoException;
import com.himan.others.WoResultCode;

@Service
@Primary
@Transactional
public class FileUploadService implements IFileUploadService {
	/**
	 * Recording the log of this class.
	 */
	private final static Logger LOG = LogManager.getLogger(FileUploadService.class);

	private final static String UPLOAD_DIR = "upload";
	private final static WoResultCode SAVE = new WoResultCode(201,"保存文件失败");
	@Override
	public String uploadFile(MultipartFile file, HttpServletRequest request) {
		// TODO Auto-generated method stub
		//获得服务端upload实际路径
		String path = request.getSession().getServletContext().getRealPath(UPLOAD_DIR);
		File dir = new File(path);
		if(!dir.exists()){
			dir.mkdirs();
		}
		//获取文件上传文件名
		String filename = file.getOriginalFilename();
		File targetFile = new File(path,filename);
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			// TODO: handle exception
			LOG.error("",e);
			throw new WoException(e,SAVE);
		}
		return UPLOAD_DIR+"/"+filename;
	}
}
