package com.my.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.Movie;
import com.my.movie.service.MovieService;

@RestController
@RequestMapping("movie")
public class MovieController {
	@Autowired private MovieService movieService;
	
//	@Value("${attachPath}") private String attachPath;
	
//	@RequestMapping("searchMovie")
//	public String searchMovie() {
//		return "/movie/searchMovie";
//	}
	
	@GetMapping("searchMovie")
	public ModelAndView movie(ModelAndView mv) {
		mv.setViewName("movie/searchMovie");
		return mv;
	}
	
//	@ResponseBody
//	@PostMapping("/saveHashtag")
//	public void saveHashtag(@RequestParam("hashtag") String hashtag, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		session.setAttribute("hashtag", hashtag);
//	}
//	
//	@ResponseBody
//	@PostMapping("/searchMovie")
//	public List<Movie> showSearchResult(HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		String hashtag = (String) session.getAttribute("hashtag");
//		List<Movie> result = movieService.searchHashtag(hashtag);
//		
//		return result;
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="/fix")
//	public void fixMovie(@RequestBody Movie movie, HttpServletRequest request, HttpServletResponse response) {
//		movieService.fixMovie(movie);
//	}
	
}
