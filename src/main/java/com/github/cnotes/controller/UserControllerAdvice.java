package com.github.cnotes.controller;

import com.github.cnotes.model.CurrentUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class UserControllerAdvice {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserControllerAdvice.class);

    @ModelAttribute("user")
    public CurrentUser getCurrentUser(Authentication authentication) {
        CurrentUser user = null;
        if (authentication != null) {
            user = (CurrentUser) authentication.getPrincipal();
        }
        return (authentication == null) ? null : user;
    }
}
