package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.Community;
import com.my.movie.domain.CommunityList;

public interface CommunityDao {
	List<CommunityList> selectCommunities();
	CommunityList selectCommunity(int communityNum);
	void insertCommunity(Community community);
	void updateCommunityContent(Community communityContent);
	void deleteCommunity(int communityNum);
	void inspectionCommunity(int community);
}
