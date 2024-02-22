package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.CommunityMap;
import com.my.movie.domain.Community;
import com.my.movie.domain.CommunityList;

@Repository
public class CommunityDaoImpl implements CommunityDao {
	@Autowired private CommunityMap communityMap;
	
	@Override
	public List<CommunityList> selectCommunities() {
		return communityMap.selectCommunities();
	}
	
	@Override
	public CommunityList selectCommunity(int communityNum) {
		return communityMap.selectCommunity(communityNum);
	}
	
	@Override
	public void insertCommunity(Community community) {
		communityMap.insertCommunity(community);
	}

	@Override
	public void updateCommunityContent(Community communityContent) {
		communityMap.updateCommunityContent(communityContent);
	}

	@Override
	public void deleteCommunity(int communityNum) {
		communityMap.deleteCommunity(communityNum);
	}
	
	@Override
	public void inspectionCommunity(int community) {
		communityMap.inspectionCommunity(community);
	}
}
