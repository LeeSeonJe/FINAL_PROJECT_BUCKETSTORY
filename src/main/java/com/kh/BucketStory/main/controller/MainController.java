package com.kh.BucketStory.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	
	@RequestMapping("main.ho")
	public String Main(Model model, @RequestParam("menuNum") int menuNum, @RequestParam("category") int category) {
		
		
		if(menuNum == 1) {
			switch(category) {
			case 1: return "mainList";
			case 2: return "mainList2";
			case 3: return "mainList3";
			case 4: return "mainList4";
			case 5: return "mainList5";
			case 6: return "mainList6";
			case 7: return "mainList7";
			case 8: return "mainList8";
			case 9: return "mainList9";
			}
		} else if(menuNum == 2) {
			switch(category) {
			case 1: return "mainRanking";
			case 2: return "mainRanking2";
			case 3: return "mainRanking3";
			case 4: return "mainRanking4";
			case 5: return "mainRanking5";
			case 6: return "mainRanking6";
			case 7: return "mainRanking7";
			case 8: return "mainRanking8";
			case 9: return "mainRanking9";
			}
		} else if(menuNum == 3) {
			switch(category) {
			case 1: return "mainRecomment";
			case 2: return "mainRecomment2";
			case 3: return "mainRecomment3";
			case 4: return "mainRecomment4";
			case 5: return "mainRecomment5";
			case 6: return "mainRecomment6";
			case 7: return "mainRecomment7";
			case 8: return "mainRecomment8";
			case 9: return "mainRecomment9";
			}
		} else {
			switch(category) {
			case 1: return "mainCompany";
			case 2: return "mainCompany2";
			case 3: return "mainCompany3";
			case 4: return "mainCompany4";
			case 5: return "mainCompany5";
			case 6: return "mainCompany6";
			case 7: return "mainCompany7";
			case 8: return "mainCompany8";
			case 9: return "mainCompany9";
			}
		}
		
		return "mainList";
	}
	
}
