package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.NewEntity;

// ko co @Repository do JpaRepository da co
public interface NewRepository extends JpaRepository<NewEntity, Long>{

}
