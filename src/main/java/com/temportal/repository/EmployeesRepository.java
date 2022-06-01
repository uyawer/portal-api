package com.temportal.repository;

import com.temportal.model.entity.EmployeeEntity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface EmployeesRepository extends JpaRepository<EmployeeEntity, Long> {

    Optional<EmployeeEntity> findByLoginId(String loginId);
}
