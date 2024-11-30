package com.example.fireservicee.repositories;

import com.example.fireservicee.models.Fire;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FireRepository extends JpaRepository<Fire, Long> {
    List<Fire> findBySubject(String subject);
}
