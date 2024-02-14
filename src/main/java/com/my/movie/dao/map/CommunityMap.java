package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.Community;
import com.my.movie.domain.CommunityList;

public interface CommunityMap {
	List<CommunityList> selectCommunities();
	CommunityList selectCommunity(int communityNum);
	void insertCommunity(Community community);
	void deleteCommunity(int communityNum);
	void inspectionCommunity(int community);
}