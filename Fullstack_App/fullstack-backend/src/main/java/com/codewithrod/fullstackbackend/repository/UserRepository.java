package com.codewithrod.fullstackbackend.repository;

import com.codewithrod.fullstackbackend.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository <User,Long> {

}
