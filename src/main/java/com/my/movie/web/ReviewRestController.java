package com.my.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.my.movie.dao.ReviewDao;
import com.my.movie.domain.Review;
import com.my.movie.domain.request.CreateReviewRequest;
import com.my.movie.domain.request.RemoveReviewRequest;
import com.my.movie.domain.request.ViewMoreReviewRequest;

@RestController
@RequestMapping("rev")
public class ReviewRestController {

	@Autowired
	private ReviewDao reviewDao;

	@PostMapping("add")
	public void addReview(@RequestBody CreateReviewRequest request) {
		reviewDao.insertReview(request);
	}

	@PostMapping("remove")
	public Boolean removeReview(@RequestBody RemoveReviewRequest request) {
		try {
			reviewDao.deleteReview(request.getReviewId());
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@PostMapping("morerev")
	public String viewMoreReview(@RequestBody ViewMoreReviewRequest request) {
		int movieId = request.getMovieId();
		int startIndex = request.getStartIndex();
		int rowCount = request.getRowCount();
		
		try {
			List<Review> reviews = reviewDao.selectReviewByMovieId(movieId, startIndex, rowCount);
			ObjectMapper mapper = new ObjectMapper();
			mapper.registerModule(new JavaTimeModule());
			return mapper.writeValueAsString(reviews);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "ERROR";
		}
	}
}
