package com.github.cnotes.controller;

import com.github.cnotes.form.UserCreateForm;
import com.github.cnotes.form.UserCreateFormValidator;
import com.github.cnotes.config.StorageService;
import com.github.cnotes.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.stream.Collectors;

@Controller
public class UserController {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

    private final UserService userService;

    private final UserCreateFormValidator userCreateFormValidator;

    private final StorageService storageService;

    @Autowired
    public UserController(UserService userService, UserCreateFormValidator userCreateFormValidator, StorageService storageService) {
        this.userService = userService;
        this.userCreateFormValidator = userCreateFormValidator;
        this.storageService = storageService;
    }

    @InitBinder("form")
    public void initBinder(WebDataBinder binder) {
        binder.addValidators(userCreateFormValidator);
    }

    @GetMapping("/register")
    public ModelAndView getUserCreatePage() {
        LOGGER.debug("Getting user create form");
        return new ModelAndView("user_create", "form", new UserCreateForm());
    }

    @PostMapping("/register")
    public String handleUserCreateForm(@Valid @ModelAttribute("form") UserCreateForm form, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "user_create";
        }
        try {
            userService.createNewUser(form);
        } catch (DataIntegrityViolationException e) {
            bindingResult.reject("email.exists", "Email already exists");
            return "user_create";
        }
        return "redirect:/success/";
    }

    @GetMapping("/success/")
    public ModelAndView successPage(@ModelAttribute ModelMap map) {
        LOGGER.debug("Getting success page");
        return new ModelAndView("success");
    }

    @GetMapping("/user/profile/")
    public ModelAndView userProfilePage(@ModelAttribute ModelMap map) {
        LOGGER.debug("Getting success page");
        //todo add file uploader form

        map.addAttribute("files" ,storageService.loadAll()
                .map(path -> MvcUriComponentsBuilder
                                .fromMethodName(UserController.class, "serveFile", path.getFileName().toString())
                                .build().toString())
                .collect(Collectors.toList()));

        return new ModelAndView("user_profile");
    }

    @PostMapping("/user/profile/docs")
    public String documentsPage(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {

        storageService.store(file);
        redirectAttributes.addFlashAttribute("message", "You successfully uploaded " + file.getOriginalFilename() + "!");

        return "redirect:/user/profile/";
    }

    @GetMapping("/files/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable String filename) {

        Resource file = storageService.loadAsResource(filename);
        return ResponseEntity
                .ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
                .body(file);
    }


}
