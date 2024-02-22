package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.Community;
import com.my.movie.domain.CommunityList;

public interface CommunityService {
	List<CommunityList> getCommunities();
	CommunityList getCommunity(int communityNum);
	void addCommunity(Community community);
	void fixCommunityContent(Community communityContent);
	void delCommunity(int communityNum);
	void inspectionCommunity(int communityNum);
}
