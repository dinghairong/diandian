package com.v8.utils;

import java.util.List;


public class ListUtils {

	public static final boolean isEmpty(List<?> list) {
		return list == null || list.size() == 0;
	}
}
