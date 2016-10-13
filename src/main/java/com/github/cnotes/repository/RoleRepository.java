package com.github.cnotes.repository;

import com.github.cnotes.model.Role;
import org.springframework.data.repository.Repository;

import java.util.Optional;

public interface RoleRepository extends Repository<Role, Long>{

    Optional<Role> findOne(Long id);
}
