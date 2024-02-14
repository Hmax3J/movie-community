package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.CommReply;

public interface CommReplyDao {
	List<CommReply> selectCommReplies(int communityNum);
	int insertCommReply(CommReply commReply);
}
