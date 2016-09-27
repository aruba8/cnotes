package com.github.cnotes.controller;

import com.github.cnotes.form.UserEditForm;
import com.github.cnotes.model.User;
import com.github.cnotes.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
public class AdminController {

    private static final Logger LOGGER = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView adminPage(){
        List<User> users = (List<User>) userService.getAllUsers();
        return new ModelAndView("admin/admin_dashboard", "users", users);
    }


    @RequestMapping(value = "/admin/edit_user", method = RequestMethod.GET)
    public ModelAndView adminEditUserPage(@RequestParam("id") long userId, UserEditForm form){
        User user = userService.getUserById(userId).get();
        return new ModelAndView("admin/admin_edit_user", "form", new UserEditForm(user));
    }

    @RequestMapping(value = "/admin/edit_user", method = RequestMethod.POST)
    public ModelAndView adminEditUserPage(@ModelAttribute("form") @Valid UserEditForm form, BindingResult bindingResult) {
        User user = userService.getUserByEmail(form.getEmail()).get();

        if (bindingResult.hasErrors()){
            List<FieldError> errors = bindingResult.getFieldErrors();

            return new ModelAndView("admin/admin_edit_user", "form", form);
        }

        user.setFirstName(form.getFirstName());
        user.setLastName(form.getLastName());
        user.setMiddleName(form.getMiddleName());
        userService.save(user);





        return new ModelAndView("admin/admin_edit_user", "form", new UserEditForm(user));
    }

}
