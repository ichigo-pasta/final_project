package com.ch.pnut.model;

import lombok.Data;

@Data
public class Follow {
	private String active;		// 팔로우 하는 사람
	private String passive;		// 팔로우 당하는 사람
}
