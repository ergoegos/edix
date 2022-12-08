package rest.ful.person.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import rest.ful.person.entity.Person;

@Controller
public class PersonController {
	
	@Autowired
	Person person;
}
