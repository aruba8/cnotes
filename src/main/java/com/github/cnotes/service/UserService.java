package com.github.cnotes.service;

import com.github.cnotes.form.UserCreateForm;
import com.github.cnotes.model.User;

import java.util.Collection;
import java.util.Optional;

public interface UserService {

    Optional<User> getUserById(long id);

    Optional<User> getUserByEmail(String email);

    Collection<User> getAllUsers();

    User create(UserCreateForm form);
}
