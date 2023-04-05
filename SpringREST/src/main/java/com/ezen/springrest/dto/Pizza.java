package com.ezen.springrest.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class Pizza {
	private String name;
	private Integer price;
	private Double calories;
		
}
