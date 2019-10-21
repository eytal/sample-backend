package com.dsta.sampleapp.sample.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

import com.dsta.sampleapp.sample.model.Message;

import com.dsta.sampleapp.sample.service.MessageServiceImpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;


/*
* Controller used to communicate across different services
* */

@Controller
public class ApiController {

    @Autowired
    MessageServiceImpl messageService;

    @CrossOrigin
    @PostMapping(value="/api/post")
    ResponseEntity<String> returnNonce(@RequestBody Message received, HttpServletRequest request){

        System.out.println(received.toString());

        messageService.save(received);

        return new ResponseEntity<>(received.getNonce(),HttpStatus.OK);
    }
    @CrossOrigin
    @GetMapping(value="/api/retrieve")
    ResponseEntity<String> retrieve(){
        Message msg = messageService.findTopByOrderByIdDesc();

        String json = "fail";
        if (msg == null){
            msg = new Message();
            msg.setValid(false);
        }

        ObjectMapper mapper = new ObjectMapper();

        try {
            json = mapper.writeValueAsString(msg);
            // System.out.println("ResultingJSONstring = " + json);
            // System.out.println(json);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return new ResponseEntity<>(json, HttpStatus.OK);
    }

}
