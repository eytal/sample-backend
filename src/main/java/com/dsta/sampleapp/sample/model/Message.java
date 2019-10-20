package com.dsta.sampleapp.sample.model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "message")
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    public String origin;
    public String destination;
    public String nonce;
    private Boolean valid = true;
}
