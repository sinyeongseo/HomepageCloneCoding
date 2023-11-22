package com.spring.solinsystem.mypage;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.solinsystem.dao.MyPageDAO;
import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.util.FileUtil;

@Service
public class MyPageServiceImpl implements MyPageService{
	@Inject
	MyPageDAO dao;
	
	 @Override
	 public void editService(MemberDTO dto) throws Exception {
		 dao.editService(dto);
	}
	 @Override
	 public void deleteService(MemberDTO dto) throws Exception {
		 dao.deleteService(dto);
	}
	 @Override
		public int pwCheck(String login_pw) throws Exception{
			return dao.pwCheck(login_pw);
	}
	 @Override
	 public void pweditService(MemberDTO dto) throws Exception {
		 dao.pweditService(dto);
	}	 
	 @Override
	 public int updateProfile(Map<String, Object> map) throws IOException{
		 MultipartFile uploadImage = (MultipartFile) map.get("uploadImage");
		 String renameImage = null;
		 
		 renameImage = FileUtil.fileRename(uploadImage.getOriginalFilename());
		 System.out.println("renameImage의 값은" + renameImage);
		 map.put("profileImage", map.get("webPath")+renameImage);
		 
		 int result = dao.updateProfile(map);
		 
		 uploadImage.transferTo(new File(map.get("folderPath")+renameImage));
		 
		 return result;
	 }
	 
	 @Override
	 public String selectProfile(String mb_id) throws Exception {
		 return dao.selectProfile(mb_id);
	}
	 
}
