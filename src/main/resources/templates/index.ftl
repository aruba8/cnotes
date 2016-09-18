<#import "base.ftl" as layout>
<#import "/spring.ftl" as spring>

<@layout.base "Home page">


<nav role="navigation">
    <ul>
        <#if !user??>
            <li><a href="<@spring.url '/login'/>">Log in</a></li>
            <li><a href="<@spring.url '/register'/>">Register</a></li>
        </#if>
        <#if user??>
            <li>
                <form action="<@spring.url '/logout'/>" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit">Log out</button>
                </form>
            </li>
            <li><a href="/user/${user.id}">View myself</a></li>
        </#if>
        <#if user?? && user.hasRole("ADMIN")>
            <li><a href="<@spring.url '/user/create'/>">Create a new user</a></li>
        </#if>
    </ul>
</nav>

</@layout.base>