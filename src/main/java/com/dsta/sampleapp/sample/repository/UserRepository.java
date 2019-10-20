package com.dsta.sampleapp.sample.repository;

import com.dsta.sampleapp.sample.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
