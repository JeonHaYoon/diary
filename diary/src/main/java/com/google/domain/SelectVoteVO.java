package com.google.domain;

import lombok.Data;

@Data
public class SelectVoteVO {

	private int select_pk;
	private String voteId;
	private String memberId;
	private int option_check;
}
