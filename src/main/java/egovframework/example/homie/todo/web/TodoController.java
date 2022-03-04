package egovframework.example.homie.todo.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.homie.todo.service.TodoService;

@Controller
@RequestMapping(value="/todo")
public class TodoController {
	
	@Autowired
	private TodoService todoService;
	
	@RequestMapping(value="/index.do")
	public String todoIndex(HttpServletRequest req, HttpServletResponse resp, HttpSession session, ModelMap model){
		
		return "back/todo/todo";
	}
}
