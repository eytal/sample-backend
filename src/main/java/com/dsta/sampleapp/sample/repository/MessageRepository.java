package com.dsta.sampleapp.sample.repository;

import com.dsta.sampleapp.sample.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Repository;


public interface MessageRepository extends JpaRepository<Message, Long> {
    @Nullable
    Message findTopByOrderByIdDesc();
}
