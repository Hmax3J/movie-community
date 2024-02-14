package com.my.movie.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.Review;
import com.my.movie.domain.ReviewDto;
import com.my.movie.domain.User;
import com.my.movie.service.ReviewService;

@Controller
@RequestMapping("review")
public class ReviewController {

	@Autowired
	private ReviewService reivewService;

	@PostMapping
	public ModelAndView movieDetail(ModelAndView mv, @RequestParam(value = "movieNo") Integer movieNo, HttpSession session) {
		ReviewDto dto = reivewService.getReviewDtoByMovieId(movieNo);
		findLoginedUserReview(dto, (User) session.getAttribute("user"));

		if (dto.getMovie() == null) {
			mv.setViewName("../main");
		} else {
			mv.setViewName("review/review");
			mv.addObject("review", dto);
		}

		return mv;
	}

	private void findLoginedUserReview(ReviewDto dto, User user) {
		if(user == null) {
			return;
		}
		
		List<Review> reviews = dto.getReviews();
		Review writeReview = null;

		for (Review review : dto.getReviews()) {
			if (user.getUserNum() == review.getUserNum()) {
				writeReview = review;
				break;
			}
		}
		
		reviews.remove(writeReview);
		reviews.add(0, writeReview);
	}
}
