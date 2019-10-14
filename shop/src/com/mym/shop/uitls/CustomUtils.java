package com.mym.shop.uitls;

import java.util.ArrayList;
import java.util.List;

public class CustomUtils {

	public static List<String> splitStr(String str){
		
		List<String> strList=new ArrayList<String>();
		System.out.println("分割字符串开始：");
		for(String s:str.split("-")){
			strList.add(s);
		}
		return  strList;
	}
	
	  
}
