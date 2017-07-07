package ru.kpfu.itis.jblab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Марат on 07.07.2017.
 */
@Controller
public class MainController {
    @RequestMapping(value = "/")
    public String getMainPage() {
        return "main";
    }
}
