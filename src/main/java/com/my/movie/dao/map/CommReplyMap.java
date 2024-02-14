package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.CommReply;

public interface CommReplyMap {
	List<CommReply> selectCommReplies(int communityNum);
	int insertCommReply(CommReply commReply);
}