<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Home page</title>
</head>
<body>
<nav role="navigation">
    <ul>
    <#if !user??>
        <li><a href="/login">Log in</a></li>
    </#if>
    <#if user??>
        <li>
            <form action="/logout" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit">Log out</button>
            </form>
        </li>
        <li><a href="/user/${user.id}">View myself</a></li>
    </#if>
    <#if user?? && user.hasRole("ADMIN")>
        <li><a href="/user/create">Create a new user</a></li>
    </#if>
    </ul>
</nav>
</body>
</html>