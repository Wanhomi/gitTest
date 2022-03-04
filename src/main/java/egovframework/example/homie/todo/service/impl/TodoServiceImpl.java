package egovframework.example.homie.todo.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.homie.todo.service.TodoService;

@Service
public class TodoServiceImpl implements TodoService {
	
	@Resource(name = "todoMapper")
	private TodoMapper mapper;
}
