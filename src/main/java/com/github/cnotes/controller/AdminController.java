package com.github.cnotes.controller;

import com.github.cnotes.model.User;
import com.github.cnotes.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AdminController {

    private static final Logger LOGGER = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView adminPage(){
        List<User> users = (List<User>) userService.getAllUsers();
        return new ModelAndView("admin", "users", users);
    }


    @RequestMapping(value = "/admin/edit_user", method = RequestMethod.GET)
    public ModelAndView adminEditUserPage(@RequestParam("id") long userId){
        List<User> users = (List<User>) userService.getAllUsers();
        return new ModelAndView("admin", "users", users);
    }

}
