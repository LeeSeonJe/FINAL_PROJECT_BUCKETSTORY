package com.kh.BucketStory.admin.controller;


import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.BucketStory.admin.model.exception.BoardException;
import com.kh.BucketStory.admin.model.service.BoardService;
import com.kh.BucketStory.admin.model.vo.Festival;
import com.kh.BucketStory.bucket.model.vo.Media;

@Controller
public class AdminController {
	
	@Autowired
	private BoardService bService;
	
	
	@RequestMapping("admin.ad")
	public String admintest() {
		return "festivalWrite";
	}
	
	/* 메인 페이지 에서 페스티벌페이지*/
	@RequestMapping("list.ad")
	public String adminfestivalList() {

		return "festivalView";
	}
	
	/* 페스티벌 작성 페이지 */
	@RequestMapping("feinsert.ad")
	public String festivalInsert(@ModelAttribute Festival f, @RequestParam("feUploadFile") MultipartFile uploadFile, HttpServletRequest request) {
		
		Media m = new Media();
		
		System.out.println(f);
		System.out.println(uploadFile);
		System.out.println(uploadFile.getOriginalFilename()); // 실제 사진 파일이 있는지 없는지를 확인 하는 방법
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				m.setMorigin(uploadFile.getOriginalFilename());
				m.setMweb(renameFileName);
			}
		}
				
		int result = bService.insertfestival(f, m);
		
			return "redirect:list.ad";
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								 + "."
								 + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
}
