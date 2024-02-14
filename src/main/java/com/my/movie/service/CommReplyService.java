package com.my.movie.service;

import java.util.List;

import com.my.movie.domain.CommReply;

public interface CommReplyService {
	List<CommReply> getCommReplies(int communityNum);
	void addCommReply(CommReply commReply);
}