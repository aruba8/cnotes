<#import "admin_base.ftl" as layout>
<#import "../spring.ftl" as spring>

<@layout.admin_base>

<div class="col-md-8 content">
    <div class="panel panel-default">
        <div class="panel-heading">
            Edit user: ${form.firstName} ${form.lastName}
        </div>
        <div class="panel-body">
            <form class="form-horizontal" action method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="form-group">
                    <div class="col-sm-2 control-label">
                        <label for="firstName">First name</label>
                    </div>
                    <div class="col-sm-6">
                        <input name="firstName" id="firstName" type="text" class="form-control"  value="${form.firstName}">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-2 control-label">
                        <label for="lastName">Last name</label>
                    </div>
                    <div class="col-sm-6">

                        <input name="lastName" id="lastName" type="text" class="form-control" value="${form.lastName}"">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2 control-label">
                        <label for="middleName">Middle name</label>
                    </div>
                    <div class="col-sm-6">
                        <input name="middleName" id="middleName" type="text" class="form-control" value="${form.middleName}"">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2 control-label">
                        <label for="email">Email</label>
                    </div>
                    <div class="col-sm-6">
                        <input readonly name="email" id="email" type="email" class="form-control" value="${form.email}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-6">
                        <input type="submit" class="btn btn-default" value="Submit"/>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
</@layout.admin_base>
