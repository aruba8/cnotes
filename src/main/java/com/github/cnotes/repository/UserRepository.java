package com.github.cnotes.repository;

import com.github.cnotes.model.User;
import org.springframework.data.repository.Repository;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends Repository<User, Long> {
    Optional<User> findOneByEmail(String email);

    Optional<User> findOne(Long id);

    List<User> findAll();

    User save(User user);
}
