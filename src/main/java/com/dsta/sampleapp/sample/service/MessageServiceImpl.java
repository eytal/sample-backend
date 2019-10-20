package com.dsta.sampleapp.sample.service;

import com.dsta.sampleapp.sample.model.Message;
import com.dsta.sampleapp.sample.repository.MessageRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
@ComponentScan("com.dsta.sampleapp.sample.repository")
@Service
public class MessageServiceImpl implements MessageService{

    @Autowired
    MessageRepository messageRepository;

    @Override
    public void save(Message message){
        messageRepository.save(message);
    }

	@Override
	public Message findTopByOrderByIdDesc() {
        
        Message received = messageRepository.findTopByOrderByIdDesc();

        if(received != null){
            messageRepository.delete(received);
        }

		return received;
    }
    
}