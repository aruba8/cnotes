<#--@ftlvariable name="_csrf" type="org.springframework.security.web.csrf.CsrfToken"-->
<#--@ftlvariable name="form" type="com.github.cnotes.form.UserCreateForm"-->
<#import "/spring.ftl" as spring>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- Website CSS style -->
    <link rel="stylesheet" type="text/css" href="<@spring.url 'css/main.css'/>">

    <!-- Website Font style -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

    <title>Registration</title>
</head>
<body>
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
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="form-group">
                    <label for="firstName" class="cols-sm-2 control-label">Your first name</label>

                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="firstName" id="firstName"
                                   placeholder="Enter your first name" value="${form.firstName}"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastName" class="cols-sm-2 control-label">Your last name</label>

                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="lastName" id="lastName"
                                   placeholder="Enter your last name" value="${form.lastName}"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="middleName" class="cols-sm-2 control-label">Your middle name (optional)</label>

                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="middleName" id="middleName"
                                   placeholder="Enter your middle name" value="${form.middleName}"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="cols-sm-2 control-label">Your Email</label>

                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="email" id="email"
                                   placeholder="Enter your Email" value="${form.email}"/>
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

                <div class="form-group">
                    <label for="passwordRepeated" class="cols-sm-2 control-label">Confirm Password</label>

                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                            <input type="password" class="form-control" name="passwordRepeated" id="passwordRepeated"
                                   placeholder="Confirm your Password"/>
                        </div>
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
</body>
</html>
<@spring.bind "form" />
<#if spring.status.error>
<ul>
    <#list spring.status.errorMessages as error>
        <li>${error}</li>
    </#list>
</ul>
</#if>

</body>
</html>