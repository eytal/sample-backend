package com.dsta.sampleapp.sample.service;

import com.dsta.sampleapp.sample.model.Message;


public interface MessageService {
    void save(Message message);
    Message findTopByOrderByIdDesc();
}