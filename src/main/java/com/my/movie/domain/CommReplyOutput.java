package com.my.movie.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class CommReplyOutput {
	private String communityReplyContent;
	private LocalDate communityReplyDate;
	private int userNum;
	private int communityNum;
	private String userId;
	private String nickname;
}
