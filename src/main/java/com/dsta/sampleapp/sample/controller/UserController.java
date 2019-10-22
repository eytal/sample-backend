package com.dsta.sampleapp.sample.controller;

import java.util.List;

import com.dsta.sampleapp.sample.model.User;
import com.dsta.sampleapp.sample.service.SecurityService;
import com.dsta.sampleapp.sample.service.UserService;
import com.dsta.sampleapp.sample.utils.UserValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

//https://hellokoding.com/registration-and-login-example-with-spring-security-spring-boot-spring-data-jpa-hsql-jsp/
@ComponentScan("com.dsta.sampleapp.sample.utils")
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            System.out.println("has errors");
            return "registration";
        }
        userService.save(userForm);
        // securityService.autoLogin(userForm.getUsername(),
        // userForm.getPasswordConfirm());
        // System.out.println("redirect to welcome");
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Your username and password is invalid.");
        }

        if (logout != null) {
            model.addAttribute("message", "You have been logged out successfully.");
        }
        // if (error == null && logout == null){
        // return "welcome";
        // }
        return "login";
    }

    @PostMapping("delete/{username}")
    public String delete(Model model, @PathVariable(value = "username") String username) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        //System.out.println(auth.getName());
        if (!auth.getName().equals(username)) {
            User toDelete = userService.findByUsername(username);
            userService.delete(toDelete);
            model.addAttribute("message", "User has been deleted successfully");
        }
        return "redirect:/welcome";
    }

    @GetMapping({ "/", "/welcome" })
    public String welcome(Model model, String message) {
        List<User> userList = userService.findAllById();
        model.addAttribute("userList", userList);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("loggedInUser", auth.getName());
        if(message != null){
            model.addAttribute("message", "User has been deleted successfully");
        }
        return "welcome";
    }

}
