package com.itwillbs.clever.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

public interface AuctionMapper {

	int insertAutcion(@Param("map") Map<String, String> map, @Param("id") String id);

	List selectImminent();

	List selectHotList();

	List selectCurrent();

	Object selectMax();

	List selectFiles();
	
	Map<String, String> selectDetailList(String auction_idx);

	List selectProductSearch(String auction_search);

	List selectMemberSearch(String auction_search);


}
