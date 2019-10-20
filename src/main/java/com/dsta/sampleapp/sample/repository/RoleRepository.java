package com.dsta.sampleapp.sample.repository;

import com.dsta.sampleapp.sample.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


public interface RoleRepository extends JpaRepository<Role, Long> {

}
