<#import "base.ftl" as layout>
<#import "/spring.ftl" as spring>


<@layout.base "Registration">

<div class="container">
    <div class="row main">
        <div class="panel-heading">
            <div class="panel-title text-center">
                <h1 class="title">Registration</h1>
                <hr/>
            </div>
        </div>
        <div class="main-login main-center">
            <form role="form" class="form-horizontal" method="post" action="">
                <@spring.bind "form"/>
                <@spring.showErrors '<br/>', 'text-danger' />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <div class="form-group">
                    <label for="firstName" class="cols-sm-2 control-label">Your first name</label>

                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                            <@spring.formInput "form.firstName","class=\"form-control\" placeholder=\"Enter your first name\"" />
                        </div>
                        <@spring.showErrors "form.firstName","text-danger"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastName" class="cols-sm-2 control-label">Your last name</label>

                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                            <@spring.formInput "form.lastName","class=\"form-control\" placeholder=\"Enter your last name\"" />
                        </div>
                        <@spring.showErrors "form.lastName","text-danger"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="middleName" class="cols-sm-2 control-label">Your middle name (optional)</label>

                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                            <@spring.formInput "form.middleName","class=\"form-control\" placeholder=\"Enter your middle name\"" />
                        </div>
                        <@spring.showErrors "form.middleName","text-danger"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="cols-sm-2 control-label">Your Email</label>

                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                            <@spring.formInput "form.email","class=\"form-control\" placeholder=\"Enter your Email\"" />
                        </div>
                        <@spring.showErrors "form.email","text-danger"/>
                    </div>
                </div>


                <div class="form-group">
                    <label for="password" class="cols-sm-2 control-label">Password</label>

                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                            <@spring.formPasswordInput "form.password","class=\"form-control\" placeholder=\"Enter your Password \"" />
                        </div>
                        <@spring.showErrors "form.password","text-danger"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="passwordRepeated" class="cols-sm-2 control-label">Confirm Password</label>

                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                            <@spring.formPasswordInput "form.passwordRepeated","class=\"form-control\" placeholder=\"Confirm your Password\"" />
                        </div>
                        <@spring.showErrors "This field","text-danger"/>
                    </div>
                </div>

                <div class="form-group ">
                    <input type="submit" class="btn btn-primary btn-lg btn-block login-button" value="Register"/>
                </div>
                <div class="login-register">
                    <a href="<@spring.url '/login'/>">Login</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</@layout.base>
