<#import "base.ftl" as layout>
<#import "/spring.ftl" as spring>

<@layout.base "Login">

<div class="container">
    <div class="row main">
        <div class="panel-heading">
            <div class="panel-title text-center">
                <h1 class="title">Log in</h1>
                <hr/>
            </div>
        </div>
        <div class="main-login main-center">
            <form role="form" class="form-horizontal" method="post" action="<@spring.url '/login'/>">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <div class="form-group">
                    <label for="email" class="cols-sm-2 control-label">Your Email</label>

                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="email" id="email"
                                   placeholder="Enter your Email" value=""/>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label for="password" class="cols-sm-2 control-label">Password</label>

                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                            <input type="password" class="form-control" name="password" id="password"
                                   placeholder="Enter your Password"/>
                        </div>
                    </div>
                </div>

                <div>
                    <label for="remember-me">Remember me</label>
                    <input type="checkbox" name="remember-me" id="remember-me"/>
                </div>


                <div class="form-group ">
                    <input type="submit" class="btn btn-primary btn-lg btn-block login-button" value="Log in"/>
                </div>
                <div class="login-register">
                    <a href="<@spring.url '/register'/>">Register</a>
                </div>
            </form>
        </div>
    </div>
</div>
    <#if error.isPresent()>
    <p>The email or password you have entered is invalid, try again.</p>
    ${error.get()}
    </#if>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</@layout.base>
