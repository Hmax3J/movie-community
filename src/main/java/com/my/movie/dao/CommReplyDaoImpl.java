package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.CommReplyMap;
import com.my.movie.domain.CommReply;

@Repository
public class CommReplyDaoImpl implements CommReplyDao {
	@Autowired private CommReplyMap commReplyMap;

	@Override
	public List<CommReply> selectCommReplies(int communityNum) {
		return commReplyMap.selectCommReplies(communityNum);
	}
	
	@Override
	public int insertCommReply(CommReply commReply) {
		return commReplyMap.insertCommReply(commReply);
	}
}