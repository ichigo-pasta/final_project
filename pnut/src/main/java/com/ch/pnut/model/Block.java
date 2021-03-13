package com.ch.pnut.model;

import lombok.Data;

@Data
public class Block {
	private String active;		// 차단 하는 사람
	private String passive;		// 차단 당하는 사람
}
