package com.temportal.repository;

import com.temportal.model.entity.RoleEntity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RolesRepository extends JpaRepository<RoleEntity, Long> {

}
