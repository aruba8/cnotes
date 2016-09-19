<#import "admin_base.ftl" as layout>

<@layout.admin_base>

<div class="col-md-8 content">
    <div class="panel panel-default">
        <div class="panel-heading">
            Dashboard
        </div>
        <div class="panel-body">
            <ul class="list-group">
            <#list users as user>
                <li class="list-group-item">
                ${user.firstName} ${user.middleName} ${user.lastName}

                    <div class="pull-right action-buttons">
                        <a href="/admin/edit_user?id=${user.id}" class="edit_user" name="${user.id}">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </a>
                        <a href="" class="trash">
                                    <span
                                            class="glyphicon glyphicon-trash">

                                    </span></a>
                        <a href="" class="flag"><span
                                class="glyphicon glyphicon-flag"></span></a>
                    </div>
                </li>

            </#list>
            </ul>

        </div>
    </div>
</div>
</@layout.admin_base>
