package com.github.cnotes.form;


import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class UserEditForm {
    @NotNull
    @Size(min = 2, max = 80)
    private String firstName = "";

    @NotNull
    @Size(min = 2, max = 80)
    private String lastName = "";

    private String middleName = "";

    @NotNull
    @Email
    private String email = "";


}
