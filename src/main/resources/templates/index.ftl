<#import "base.ftl" as layout>
<#import "spring.ftl" as spring>
<@layout.base "Home">
<#include "navigation.ftl" />
<div class="container">
    <div class="row">
        <ul>
            <#if !user??>
                <li><a href="<@spring.url '/login'/>">Log in</a></li>
                <li><a href="<@spring.url '/register'/>">Register</a></li>
            </#if>
            <#if user??>
                <li>
                    <form action="<@spring.url '/logout/'/>" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit">Log out</button>
                    </form>
                </li>
                <li><a href="<@spring.url '/user/profile/'/>">View myself</a></li>
            </#if>

            <li><a href="<@spring.url '/user/create/'/>">Create a new user</a></li>
        </ul>
    </div>
</div>
</@layout.base>

