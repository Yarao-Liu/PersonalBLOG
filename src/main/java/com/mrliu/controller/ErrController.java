package com.mrliu.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/error")
public class ErrController implements ErrorController{
    
    @Override
    public String getErrorPath() {
        return "error/error";
    }

    @RequestMapping
    public String error() {
        return getErrorPath();
    }
}
