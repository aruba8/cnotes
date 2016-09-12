 <#--@ftlvariable name="_csrf" type="org.springframework.security.web.csrf.CsrfToken"-->
 <#--@ftlvariable name="form" type="com.github.cnotes.form.UserCreateForm"-->
<#import "/spring.ftl" as spring>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Create a new user</title>
</head>
<body>
<nav role="navigation">
    <ul>
        <li><a href="/">Home</a></li>
    </ul>
</nav>

<h1>Create a new user</h1>

<form role="form" name="form" action="" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

    <div>
        <label for="firstName">First name</label>
        <input type="text" name="firstName" id="firstName" value="${form.firstName}"/>
    </div>
    <div>
        <label for="lastName">Last name</label>
        <input type="text" name="lastName" id="lastName" value="${form.lastName}"/>
    </div>
    <div>
        <label for="middleName">Middle name</label>
        <input type="text" name="middleName" id="middleName" value="${form.middleName}"/>
    </div>
    <div>
        <label for="email">Email address</label>
        <input type="email" name="email" id="email" value="${form.email}"/>
    </div>
    <div>
        <label for="password">Password</label>
        <input type="password" name="password" id="password" required/>
    </div>
    <div>
        <label for="passwordRepeated">Repeat</label>
        <input type="password" name="passwordRepeated" id="passwordRepeated" required/>
    </div>
    <button type="submit">Save</button>
</form>

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