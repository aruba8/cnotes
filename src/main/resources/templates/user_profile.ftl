<#import "base.ftl" as layout>
<#import "spring.ftl" as spring>
<@layout.base "Home">

<#include "navigation.ftl" />

<div class="container">
    <div class="row">
        <div class="col-sm-4 col-md-4 user-details">
            <div class="user-info-block">
                <div class="user-heading">
                    <h3>${user.getUser().firstName} ${user.getUser().middleName} ${user.getUser().lastName}</h3>
                    <span class="help-block">address //TBD </span>
                </div>
                <ul class="navigation">
                    <li class="active">
                        <a data-toggle="tab" href="#information">
                            <span class="glyphicon glyphicon-user"></span>
                            info
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#settings">
                            <span class="glyphicon glyphicon-cog"></span>
                            settings
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="<@spring.url '/user/profile/docs/'/>">
                            <span class="glyphicon glyphicon-calendar"></span>
                            documents
                        </a>
                    </li>
                </ul>
                <div class="user-body">
                    <div class="tab-content">
                        <div id="information" class="tab-pane active">
                            <h4>Account Information</h4>
                        </div>
                        <div id="settings" class="tab-pane">
                            <h4>Settings</h4>
                        </div>
                        <div id="email" class="tab-pane">
                            <h4>Send Message</h4>
                        </div>
                        <div id="events" class="tab-pane">
                            <h4>Events</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</@layout.base>