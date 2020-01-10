package com.joinlabs.action.zy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.joinlabs.entity.PageBean;
import com.joinlabs.entity.Video;
import com.joinlabs.service.zy.IMovieService;

@Controller
@RequestMapping("/movie")
@SessionAttributes(value={"movies","pageBean"})
public class MovieAction {
	
	@Resource
	IMovieService movieService;
	
	@RequestMapping("/showAllMovie")
	public ModelAndView showAllMovie(ModelMap modelMap,PageBean pageBean) {
		List<Video> list = movieService.findAllMovie(pageBean);
		//System.out.println(pageBean);
		modelMap.addAttribute("movies", list);
		modelMap.addAttribute("pageBean", pageBean);
		
		return new ModelAndView("/admin/underMovie");
	}
	
	@RequestMapping("/underMovie")
	@ResponseBody
	public Integer underMovie(int movieId) {
		
		int row = movieService.underMovie(movieId);
		
		return row;
	}
	
	@RequestMapping("/selectMovie")
	@ResponseBody
	public Object selectMovie(String mname,ModelMap modelMap,@ModelAttribute("pageBean")PageBean pageBean) {
		
		List<Video> list = movieService.selectMovieByName(mname,pageBean);
		//System.out.println(pageBean);
		modelMap.addAttribute("movies", list);
		modelMap.addAttribute("pageBean", pageBean);
		//System.out.println(pageBean);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", list.size());
		return map;
	}
	
	@RequestMapping("/showMovies")
	public ModelAndView showMovies() {
		
		return new ModelAndView("/admin/showUnderMovie");
	}
	
	@RequestMapping("/showUnderMovie")
	public ModelAndView showUnderMovie(ModelMap modelMap,@ModelAttribute("pageBean")PageBean pageBean) {
		List<Video> list = movieService.findAllMovie(pageBean);
		modelMap.addAttribute("movies", list);
		return new ModelAndView("redirect:/movie/showMovies");//"redirect:/movie/showMovies"
	}
	
	@RequestMapping("/pageRefresh")
	@ResponseBody
	public Object pageRefresh(ModelMap modelMap,@ModelAttribute("pageBean")PageBean pageBean,int page) {
		
		pageBean.setCurPage(page);
		pageBean.initData();
		modelMap.addAttribute("pageBean", pageBean);
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	
}
