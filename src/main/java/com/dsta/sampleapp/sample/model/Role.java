package com.dsta.sampleapp.sample.model;
import lombok.Data;


import javax.persistence.*;
import java.util.Set;
@Data
@Entity
@Table(name ="role")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;

    @ManyToMany(mappedBy = "roles")
    private Set<User> users;


}
