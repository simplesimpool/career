package com.bookmarket.app.controller.sw;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bookmarket.app.dto.sw.UserSW;
import com.bookmarket.app.service.sw.UserServiceSW;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserControllerSW {
	@Autowired
	private UserServiceSW uss;
	
	@Autowired
	private BCryptPasswordEncoder bpe;


	@GetMapping("/join/selectJoinForm")
	public String SelectJoinForm() {
		return "/join/selectJoinForm";
	}
	
	@GetMapping("/join/userJoinForm")
	public String userJoinForm() {
		return "/join/userJoinForm";
	}
	

	@GetMapping("/login/selectLoginForm")
	public String SelectLoginForm() {
		return "/login/selectLoginForm";
	}


	@GetMapping("/login/userLoginForm")
	public String userLoginForm() {
		return "/login/userLoginForm";
	}
	
	/*
	 * @GetMapping("/userlist/userList") public void userList(Model model) {
	 * List<UserSW> userList = uss.selectlist(); model.addAttribute("userList",
	 * userList); }
	 */
    
    @GetMapping("/userlist/userDetail") 
    public void userDetail(@RequestParam("userId") String userId, Model model) {
    	UserSW user = uss.select(userId);
    	model.addAttribute("user", user);

    }
    
	@GetMapping("/update/userUpdateForm")
	public String userUpdateForm(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		UserSW user = uss.select(userId);
		if (user.getUserImg()==null || user.getUserImg().equals("")) {
			user.setUserImg("default_profile.JPG");
		}
		model.addAttribute("user", user);
		return "/update/userUpdateForm";
	}
	
	
	@PostMapping("/update/userUpdate")
	public void userUpdate(UserSW user, Model model, @RequestParam("userUploadImg") MultipartFile userUploadImg, HttpSession session) {
		/* public void userUpdate(UserSW user, Model model) { */
		if (!userUploadImg.isEmpty()) {
		        try {
		            // 1. 저장할 경로
		            String uploadDir = "C:\\spring\\sts4Src\\bookmarket\\uploads\\userimage";

		            // 2. 원래 파일명
		            String originalName = userUploadImg.getOriginalFilename();

		            // 3. 새로 저장할 파일 이름 만들기 (UUID + 확장자 유지)
		            String uuid = UUID.randomUUID().toString();
		            String newFileName = uuid + "_" + originalName;

		            // 4. 파일 저장
		            File saveFile = new File(uploadDir, newFileName);
		            userUploadImg.transferTo(saveFile);
		            

		            // 5. DB에 저장할 파일 이름을 User 객체에 주입
		            user.setUserImg(newFileName);

		        } catch (IOException e) {
		            e.printStackTrace();
		            model.addAttribute("result", 0);
		            return;
		        }
		    }
	    // 이메일 중복 검사 (본인 이메일은 예외)
	    String userId = (String) session.getAttribute("userId");
	    UserSW user2 = uss.selectEmail(user.getUserEmail());
	    if (user2  != null && !user2 .getUserId().equals(userId)) {
	        model.addAttribute("result", -1); // 중복 이메일
	        return;
	    }
	    	int result = uss.update(user);
	    	model.addAttribute("result", result);
	    	session.setAttribute("userImg", user.getUserImg() != null ? user.getUserImg() : "default_profile.JPG");
	}
	
	
	@PostMapping("/login/userLogin")
	public void userLogin(UserSW user, Model model, HttpSession session) {
		int result = 0;
		UserSW user2 = uss.select(user.getUserId());

		if (user2 == null || "y".equals(user2.getUserDel())) {
			result = -1;
		} 
		// ✅ 암호화된 비밀번호 비교
		else if (
				user.getUserPw().equals(user2.getUserPw()) || bpe.matches(user.getUserPw(), user2.getUserPw()) 
			) {
			result = 1;
			session.setAttribute("userId", user2.getUserId());
			session.setAttribute("userImg", 
			user2.getUserImg() != null ? user2.getUserImg() : "default_profile.JPG");
		} 
		

		model.addAttribute("result", result);
	}
	
	@GetMapping("/login/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/login/logout";
	    
	}
	
	@PostMapping("/join/userJoin")
	public void userJoin(UserSW user, Model model) {
	     int result = 0;
	    if(uss.select(user.getUserId()) != null || uss.selectEmail(user.getUserEmail())!= null )  {
	    	result  = -1;
	    } else  {
	     result = uss.insert(user);
	    }
	     model.addAttribute("result", result);
	}
	
	@GetMapping("/update/userDelete") 
	public void userDelete(@RequestParam("userId") String userId, Model model, HttpSession session ) {
		int result = 0;
		result = uss.delete(userId);
		if (result > 0) {
			session.invalidate();
		}
			
		model.addAttribute("result", result);
	}
	
	

	@PostMapping(value = "/userIdDupChk",produces = "text/html;charset=utf-8" )  // 문자열로 존재 여부 판단
	@ResponseBody
	public String idChk(@RequestParam("userId") String userId) {
		String data = "";
		UserSW user = uss.select(userId);
		if (user == null) 
			data = "사용가능한 아이디 입니다";
		else
			data ="사용중인 아이디 입니다";
		return 
				data;
	}
	

	
	@PostMapping(value = "/userEmailDupChk",produces = "text/html;charset=utf-8" )  // 문자열로 존재 여부 판단
	@ResponseBody
	public String emialChk(@RequestParam("userEmail") String userEmail) {
		String data = "";
		UserSW user = uss.selectEmail(userEmail);
		if (user == null) 
			data = "사용가능한 이메일 입니다";
		else
			data ="사용중인 이메일 입니다";
		return 
				data;
	}
	
	

	
}
