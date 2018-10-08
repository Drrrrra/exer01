package controllers;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import models.ShowtimeDao;

@Controller
@RequestMapping("/ticket")
public class TicketController {

	/*@RequestMapping("/index.do")
	public String welcome(WebRequest webRequest) {
		System.out.println("index.do");
		if(webRequest.getAttribute("auth", webRequest.SCOPE_SESSION)==null) {
			return "auth";
		}else {			
			return "index";
		}
	}
*/	
	@Autowired
	ShowtimeDao showtimeDao;
	
	@GetMapping("/index.do")
	public String indexHandle(ModelMap modelMap) {
		
		modelMap.put("movies", showtimeDao.getAllTitle());
		return "index";
	}
	
	/*@GetMapping
	@RequestMapping("/seat.do")
	public String reservSeat(WebRequest webRequest) {
		System.out.println("seat.do");
		
		String movie = webRequest.getParameter("movie");
		String time = webRequest.getParameter("time");
		String person = webRequest.getParameter("person");
		
		webRequest.setAttribute("movie", movie, webRequest.SCOPE_SESSION);
		webRequest.setAttribute("time", time, webRequest.SCOPE_SESSION);
		webRequest.setAttribute("person", person, webRequest.SCOPE_SESSION);
		
		return "seat";
	}*/
	
	@GetMapping("/seat.do")
	public String indexHandle(@RequestParam Map param, WebRequest req) {
		if(req.getAttribute("auth", WebRequest.SCOPE_SESSION) == null) {
			req.setAttribute("reserve", param, WebRequest.SCOPE_SESSION);
			return "redirect:/ticket/auth.do";
		}else {
			return "seat";	
		}
	}
	
	/*
	@GetMapping
	@RequestMapping("/auth.do")
	public String authDo(WebRequest webRequest){
		System.out.println("auth.do");
		
		String name = webRequest.getParameter("name");
		String phone = webRequest.getParameter("phone");
		
		webRequest.setAttribute("name", name, webRequest.SCOPE_SESSION);
		webRequest.setAttribute("phone",phone, webRequest.SCOPE_SESSION);
		webRequest.setAttribute("auth",true,webRequest.SCOPE_SESSION);
				
		return "redirect:index.do";
	}
	*/
	
	@GetMapping("/auth.do")
	public String authHandle() {
		return "auth";
	}
	@PostMapping("/auth.do")
	public String authHandle(@RequestParam Map param, HttpSession session, Map map) {
		session.setAttribute("user", param);
		session.setAttribute("auth", true);
		
		Map reserve = (Map)session.getAttribute("reserve");
		map.putAll(reserve);
		
		return "redirect:/ticket/seat.do";
	}
	
	/*
	@RequestMapping("/order.do")
	public String ordered(WebRequest webRequest) {
		System.out.println("order.do");
		
		//String movie = webRequest.getParameter("movie");
		//String time = webRequest.getParameter("time");
		String[] seat = webRequest.getParameterValues("seat");
		
		
		//webRequest.setAttribute("movie", movie, webRequest.SCOPE_SESSION);
		//webRequest.setAttribute("time", time, webRequest.SCOPE_SESSION);
		webRequest.setAttribute("seat", seat, webRequest.SCOPE_SESSION);
		
	
		return "order";
	}
	*/
	@RequestMapping("/order.do")
	public String orderHandle(@RequestParam String[] seat, WebRequest webRequest) {
		Map user = (Map)webRequest.getAttribute("user", WebRequest.SCOPE_SESSION);
		Map reserve = (Map)webRequest.getAttribute("reserve", WebRequest.SCOPE_SESSION);
		System.out.println("user = " + user);
		System.out.println("reserve = " + reserve);
		for(int i=0; i<seat.length; i++) {
			System.out.println("seat = "+ seat[i]);
		}
		return "";
	}
	 
	 
	
	
	 
	 
	
	
}
