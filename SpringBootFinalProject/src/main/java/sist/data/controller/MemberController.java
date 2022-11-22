package sist.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sist.data.dto.AnimalDto;
import sist.data.dto.MemberDto;
import sist.data.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	//Id체크
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idCheckProcess(String mem_id) {
			
	Map<String, Integer> map=new HashMap<>();
			
	int n=service.getSearchId(mem_id);
	map.put("count", n);
			
	return map;
	}
	
	@PostMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto) {
		
		service.insertMember(dto);
		return "/member/membersuccess";
	}
	
	@GetMapping("/member/animalRegister")
	public String gologinform() {
		
		return "/member/animalform";
	}
	

}
