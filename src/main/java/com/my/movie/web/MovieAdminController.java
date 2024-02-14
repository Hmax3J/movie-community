package com.my.movie.web;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.domain.Movie;
import com.my.movie.service.MovieService;

@Controller
@RequestMapping("admin/movie")
public class MovieAdminController {
	@Autowired private MovieService movieService;
	
	@Value("${attachPath}") private String attachPath;
	
	@RequestMapping("listMovie")
	public String listMovie() {
		return "admin/movie/listMovie";
	}
	
	@RequestMapping("addMovie")
	public String addMovie() {
		return "admin/movie/addMovie";
	}
	
	@RequestMapping("fixMovie")
	public String fixMovie() {
		return "admin/movie/fixMovie";
	}
	
	@ResponseBody
	@PostMapping("listMovie")
	public List<Movie> getAdminMoives() {
		return movieService.getAdminMovies();
	}
	
	@ResponseBody	
	@DeleteMapping("del/{movieNum}")
	public void delMovie(@PathVariable int movieNum) {
		movieService.delMovie(movieNum);
	}
	
//	@GetMapping("addMovie")
//	public ModelAndView login(ModelAdnView)
	
	@ResponseBody
	@PostMapping("addMovie")
	public ModelAndView addMovie(Movie movie, ModelAndView mv) throws IOException {
		try {
//		String movieFileName = movie.getMovieImgfile().getOriginalFilename();
//		
//		saveMovieFile(attachPath + "/" + movieFileName, movie.getMovieImgfile());
//		movie.setMovieImgfileName(movieFileName);
		
		movieService.addMovie(movie);
		} catch(NullPointerException e) {}
		mv.setViewName("admin/movie/listMovie");
		return mv;
	}
	
//	@ResponseBody
//	@PostMapping("/fix")
//	public void fixMovie(@RequestBody Movie movie, HttpServletRequest request, HttpServletResponse response) {
//		movieService.fixMovie(movie);
//	}
//
//	private void saveMovieFile(String movieFileName, MultipartFile movieFile) {
//		try {
//			movieFile.transferTo(new File(movieFileName));
//		} catch(IOException e) {}
//	}
	}
