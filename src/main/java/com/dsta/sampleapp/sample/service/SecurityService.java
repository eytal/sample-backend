package com.dsta.sampleapp.sample.service;

public interface SecurityService {
    String findLoggedInUsername();

    // Auto login user after registration
    void autoLogin(String username, String password);
}
