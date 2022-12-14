package com.google.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class AuthVO implements Serializable{

	private String memberId;
	private String auth;
}
