<#import "admin_base.ftl" as layout>
<@layout.admin_base>
<div class="col-md-8 content">
    <div class="panel panel-default">
        <div class="panel-heading">
            Edit user: ${user.firstName} ${user.firstName}
        </div>
        <div class="container">
            <form class="form-horizontal">
                <div class="form-group">
                    <div class="col-sm-2 control-label">
                        <label for="exampleInputEmail1">First name</label>
                    </div>
                    <div class="col-sm-6">
                        <input type="text" class="form-control"  value="${user.firstName}">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-2 control-label">
                        <label for="exampleInputPassword1">Last name</label>
                    </div>
                    <div class="col-sm-6">

                        <input type="text" class="form-control" value="${user.lastName}"">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2 control-label">
                        <label for="exampleInputPassword1">Middle name</label>
                    </div>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" value="${user.middleName}"">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2 control-label">
                        <label for="exampleInputPassword1">Email</label>
                    </div>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" value="${user.email}">
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
