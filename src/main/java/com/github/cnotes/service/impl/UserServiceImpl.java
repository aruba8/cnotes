package com.github.cnotes.service.impl;

import com.github.cnotes.form.UserCreateForm;
import com.github.cnotes.model.Role;
import com.github.cnotes.model.User;
import com.github.cnotes.repository.RoleRepository;
import com.github.cnotes.repository.UserRepository;
import com.github.cnotes.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    private final RoleRepository roleRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @Override
    public Optional<User> getUserById(long id) {
        return userRepository.findOne(id);
    }

    @Override
    public Optional<User> getUserByEmail(String email) {
        return userRepository.findOneByEmail(email);
    }

    @Override
    public Collection<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public User createNewUser(UserCreateForm form) {
        User user = new User();
        Role roleUser = roleRepository.findOne(1l).get();
        Set<Role> roles = new HashSet<>();
        roles.add(roleUser);
        user.setRoles(roles);
        user.setFirstName(form.getFirstName());
        user.setLastName(form.getLastName());
        user.setMiddleName(form.getMiddleName());
        user.setEmail(form.getEmail());
        user.setPassword(new BCryptPasswordEncoder().encode(form.getPassword()));
        user.setEnabled(true);
        user.setRegistrationDate(new Date());
        return userRepository.save(user);
    }

    @Override
    public void save(User user) {
        userRepository.save(user);
    }
}
