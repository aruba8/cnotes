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
                <@spring.bind "form"/>
                <@spring.showErrors '*', 'errors' />

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <div class="form-group">
                    <div class="col-sm-2 control-label">
                        <label for="firstName">First name</label>
                    </div>
                    <div class="col-sm-6">
                        <@spring.formInput "form.firstName","class=\"form-control\"" />
                        <@spring.showErrors "form.firstName","text-danger"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-2 control-label">
                        <label for="lastName">Last name</label>
                    </div>
                    <div class="col-sm-6">
                        <@spring.formInput "form.lastName","class=\"form-control\"" />
                        <@spring.showErrors "form.lastName", "text-danger"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2 control-label">
                        <label for="middleName">Middle name</label>
                    </div>
                    <div class="col-sm-6">
                        <@spring.formInput "form.middleName","class=\"form-control\"" />
                        <@spring.showErrors "form.middleName", "text-danger"/>
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