package com.itwillbs.clever.controller;

import java.io.*;
import java.nio.file.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.itwillbs.clever.common.util.*;
import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

@Controller
public class AuctionController {

	@Autowired
	private AuctionService auctionService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	FileUpload upload;
	
	@GetMapping(value = "auction")
	public String auction(Model model) {
		List imminentList = auctionService.selectImminent();
		List hotList = auctionService.selectHotList();
		List currentList = auctionService.selectCurrent();
		List fileList = auctionService.selectFiles();
		
		model.addAttribute("imminentList", imminentList);
		model.addAttribute("hotList", hotList);
		model.addAttribute("currentList", currentList);
		model.addAttribute("fileList", fileList);
		System.out.println(fileList);
		
		return "auction/auction";
	}
	
	@GetMapping(value = "auction_loginForm")
	public String auction_loginForm() {
		return "auction/auction_login_form";
	}
	
	@PostMapping(value = "auction_loginPro")
	public String LoginPro(MemberVO member, HttpSession session, Model model) {
			
			System.out.println("아이디 : " + member.getMember_id() + ", 패스워드 : " + member.getMember_passwd());
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String passwd = memberService.getPasswd(member);
			if(encoder.matches(member.getMember_passwd(), passwd)) {
				member.setMember_passwd(passwd);
				boolean isSuccess = memberService.isSuccessMember(member);
				System.out.println(isSuccess);
				if(isSuccess) {
					//로그인 성공 시 세션 객체에 아이디 저장 
					session.setAttribute("sId", member.getMember_id());
					return "redirect:/auction"; // 로그인 성공 시 -> main 페이지로 리다이렉트 이동 
				} else {
					model.addAttribute("msg","로그인 실패!");
					return "fail_back";
				}	
			} else {
				model.addAttribute("msg","로그인 실패!");
				return "fail_back";
			}
			
		}
	
	@GetMapping(value = "auction_list")
	public String auction_list() {
		return "auction/auction_list";
	}
	
	@GetMapping(value = "auction_detail")
	public String auction_detail(Model model, String auction_idx) {
		
		Map detailmap = auctionService.detailList(auction_idx);
		model.addAttribute("detailmap", detailmap);
		
		System.out.println("맵!!!!!!!!" + detailmap);
		
		return "auction/auction_detail";
	}
	
	@GetMapping(value = "auction_upload")
	public String auction_upload(Model model, HttpSession session) {
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("target", "loginForm.me");
			return "success";
		}
		return "auction/auction_upload";
	}
	
	@PostMapping(value = "auction_upload_pro")
	public String auction_upload_pro(@RequestParam Map<String, String> map
									, @RequestParam("auction_images") MultipartFile[] file
//									, @RequestParam("auction_images1") MultipartFile file1
//									, @RequestParam("auction_images2") MultipartFile file2
//									, @RequestParam("auction_images3") MultipartFile file3
//									, @RequestParam("auction_images4") MultipartFile file4
									, HttpSession session, Model model) {
//		MultipartFile[] file = {file1,file2,file3,file4};
//		System.out.println(file);
	
		
		String id = (String)session.getAttribute("sId");
		// 카테고리 분류
		String[] categorys = map.get("auction_category").split(" > ");
		map.put("auction_Lcategory", categorys[0]);
		map.put("auction_Mcategory", categorys[1]);
		map.put("auction_Scategory", categorys[2]);
		// 카테고리 분류 끝
		// 경매 시작일 및 경매 종료일 코드 입력
		map.put("auction_start", map.get("auction_start_date") + " " + map.get("auction_start_time"));
		map.put("auction_end", map.get("auction_end_date") + " " + map.get("auction_end_time"));
		System.out.println(map);
		int insertAuction = auctionService.insertAutcion(map,id);
		// 종료
		
		//---------- 파일 업로드 관련 작업 시작 -----------------------------------------------------------
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("file_div", "auction");
		paramMap.put("file_num", auctionService.selectMax());
		upload.upload(file, session, paramMap);
		//---------- 파일 업로드 관련 작업 끝 ------------------------------------------------------------
		
		if(insertAuction > 0) {
			model.addAttribute("msg", "경매 등록 성공!");
			model.addAttribute("target", "auction");
			return "success";
		} else {
			model.addAttribute("msg", "경매 등록 실패!");
			return "fail_back";
		}
//		return "";
	}
	
	@GetMapping(value = "auction_management")
	public String auction_management() {
		return "auction/auction_management";
	}
	
	@GetMapping(value = "auction_sell")
	public String auction_sell() {
		return "auction/auction_sell";
	}
	
	@GetMapping(value = "auction_buy")
	public String auction_buy() {
		return "auction/auction_buy";
	}
	
	@GetMapping(value = "auction_searchPro")
	public String auction_searchPro(@RequestParam Map<String, String> map,Model model) {
		
		List auction_product_search = auctionService.selectProductSearch(map.get("auction_search"));
		List fileList = auctionService.selectFiles();
		List auction_member_search = auctionService.selectMemberSearch(map.get("auction_search"));
		
		model.addAttribute("auction_search", map.get("auction_search"));
		model.addAttribute("auction_product_search", auction_product_search);
		model.addAttribute("auction_member_search", auction_member_search);
		model.addAttribute("fileList", fileList);
		return "auction/auction_search";
	}
	
}
