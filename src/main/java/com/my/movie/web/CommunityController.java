package com.my.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.Community;
import com.my.movie.domain.CommunityList;
import com.my.movie.service.CommunityService;

@RestController
@RequestMapping("community")
public class CommunityController {
	@Autowired private CommunityService communityService;
	
	@GetMapping("list")
	public ModelAndView communities(ModelAndView mv) {
		mv.setViewName("community/list");
		return mv;
	}
	
	@GetMapping("getCommunities")
	public List<CommunityList> communities() {
		return communityService.getCommunities();
	}
	
	@GetMapping("content")
	public ModelAndView content(ModelAndView mv) {
		mv.setViewName("community/content");
		return mv;
	}
	
	@PostMapping("getContent")
	public CommunityList getContent(@RequestBody Community communityNum) {
		System.out.println(communityService.getCommunity(communityNum.getCommunityNum()));
		return communityService.getCommunity(communityNum.getCommunityNum());
	}
	
	@GetMapping("write")
	public ModelAndView write(ModelAndView mv) {
		mv.setViewName("community/write");
		return mv;
	}
	
	@PostMapping("write")
	public void addWrite(@RequestBody Community community) {
	    communityService.addCommunity(community);
	}
	
	@DeleteMapping("del/{communityNum}")
	public void delCommunity(@PathVariable int communityNum) {
		communityService.delCommunity(communityNum);
	}
}