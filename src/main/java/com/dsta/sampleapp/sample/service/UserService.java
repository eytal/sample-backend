package com.dsta.sampleapp.sample.service;

import com.dsta.sampleapp.sample.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
