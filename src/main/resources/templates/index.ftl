<#import "base.ftl" as layout>
<@layout.base "Home">
<nav role="navigation">
    <ul>
        <#if !user??>
            <li><a href="/login">Log in</a></li>
            <li><a href="/register">Register</a></li>
        </#if>
        <#if user??>
            <li>
                <form action="/logout/" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit">Log out</button>
                </form>
            </li>
            <li><a href="/user/1">View myself</a></li>
        </#if>

        <li><a href="/user/create'/">Create a new user</a></li>
    </ul>
</nav>
</@layout.base>

