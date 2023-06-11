package com.itwillbs.clever.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

@Controller
public class MypageController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private ProductService productService;
	
	@Value("${client_id}")
	private String client_id;
	
	// 마이페이지 포워딩
	@GetMapping("/myPage.me")
	public String myPage(HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("target", "loginForm.me");
			return "success";
		}
		
		MemberVO member = memberService.selectMember(sId);
		
		model.addAttribute("member", member);
		
		List<HashMap<String, String>> onSaleproduct = mypageService.selectOnSaleProduct(sId);
		model.addAttribute("onSaleproduct", onSaleproduct);
		
		List<HashMap<String, String>> productBuyList = mypageService.selectProductBuyList(sId);
		model.addAttribute("productBuyList", productBuyList);
		
		List<HashMap<String, String>> fileList = productService.selectFile(); //파일테이블에서 중고상품의 첫번째등록한 이미지만 select
		model.addAttribute("fileList", fileList);
		
//		List<HashMap<String, String>> auctionDibsList = mypageService.selectAutionDibs(sId);
//		model.addAttribute("auctionDibsList", auctionDibsList);
//		System.out.println("경매 찜 " + auctionDibsList);
		
		List<HashMap<String, String>> dibsList = mypageService.selectDibsList(sId);
		model.addAttribute("dibsList", dibsList);
		System.out.println("찜 목록 " + dibsList);
		
		// 굿즈 구매 내역
		List<HashMap<String, String>> goodsList = mypageService.selectGoodsList(sId);
		model.addAttribute("goodsList", goodsList);
			
		
		return "mypage/my_page";
	}
		
	// 회원정보 포워딩
	@GetMapping("/memberModify.me")
	public String customerModify(HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		
		HashMap<String, String> member = memberService.selectModifyMember(sId);
		model.addAttribute("member", member);
		System.out.println(member);
		
		// 클라이언트 id 저장 
		model.addAttribute("client_id", client_id);
		
		return "mypage/memberModify";
	}
	
	//회원정보 수정
	@PostMapping(value = "/memberModifyPro.me")
    public String customerModifyPro(HttpSession session, Model model, @RequestParam String modifypasswd ,MemberVO member) {
		System.out.println("memberModifyPro.me");
		String sId = (String)session.getAttribute("sId");
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        System.out.println("member 변수 확인 " + member);
        String passwd = memberService.getModifyPasswd(sId);
					
		if(passwordEncoder.matches(member.getMember_passwd(), passwd)) {
			if(!modifypasswd.equals("")) {
				modifypasswd = passwordEncoder.encode(modifypasswd);  // 변경된 비밀번호를 암호화해서 변수에 저장
        		}
			int updateCount = memberService.updateMember(sId, member, modifypasswd);
			if(updateCount > 0) { // 정보 수정이 되었을 때
	    		model.addAttribute("msg", "회원 정보 수정 완료!");
	    		model.addAttribute("target","myPage.me");
	    		return "success";
			} else { // 정보 수정이 되지 않았을 때
				model.addAttribute("msg", "회원 정보 수정 실패!");
				return "fail_back";
			}
		} else { // 변경할 비밀번호가 비밀번호 확인과 동일 하지 않음 
    		model.addAttribute("msg", "변경할 비밀번호가 동일하지 않습니다!");
    		return "fail_back";
    	}
	}
	
}
