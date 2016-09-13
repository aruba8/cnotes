package com.github.cnotes.model;


import java.util.Set;

public class CurrentUser extends org.springframework.security.core.userdetails.User {

    private User user;

    public CurrentUser(User user) {
        super(user.getEmail(), user.getPassword(), user.getAuthorities());
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public Long getId() {
        return user.getId();
    }

    public Set<Role> getRoles() {
        return user.getRoles();
    }

    public Boolean hasRole(String roleName){
        for (Role role : getRoles()){
            if (role.getRoleName().equals(roleName)){
                return true;
            }
        }
        return false;
    }

    @Override
    public String toString() {
        return "CurrentUser{" +
                "user=" + user +
                "} " + super.toString();
    }
}
