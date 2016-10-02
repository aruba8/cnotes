package com.github.cnotes.form;


import com.github.cnotes.model.Role;
import com.github.cnotes.model.User;
import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

public class UserEditForm {

    @NotNull
    @Size(min = 3, max = 80)
    private String firstName;
    @NotNull
    @Size(min = 3, max = 80)
    private String lastName;
    private String middleName;
    @NotNull
    @Email
    private String email;

    private Set<String> roles;

    public UserEditForm(User user) {
        this.firstName = user.getFirstName();
        this.lastName = user.getLastName();
        this.middleName = user.getMiddleName();
        this.email = user.getEmail();
        this.roles = new HashSet<>();
        for (Role role : user.getRoles()) {
            this.roles.add(role.getRoleName());
        }
    }

    public UserEditForm() {
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Set<String> getRoles() {
        return roles;
    }

    public void setRoles(Set<String> roles) {
        this.roles = roles;
    }
}
