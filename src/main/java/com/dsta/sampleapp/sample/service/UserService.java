package com.dsta.sampleapp.sample.service;

import java.util.List;

import com.dsta.sampleapp.sample.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);

    List<User> findAllById();
}
