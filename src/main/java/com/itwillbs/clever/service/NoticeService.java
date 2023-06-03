package com.itwillbs.clever.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.clever.mapper.*;
import com.itwillbs.clever.vo.*;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper mapper;

	
	// 공지사항 등록
	public int registerNotice(NoticeVO notice) {
		
		return mapper.insertNotice(notice);
	}


	// 관리자 페이지 공지사항 조회
	public List<HashMap<String, String>> getNoticeList() {
		
		return mapper.selectNoticeList();
	}
	
}
