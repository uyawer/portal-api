package com.temportal.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = {"/schedule"})
public class ScheduleController {

    @GetMapping
    public String get() {
        return "Hello";
    }
}
