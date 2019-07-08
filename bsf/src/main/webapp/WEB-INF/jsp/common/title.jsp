<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 模态框（Modal） -->
<div class="modal fade" tabindex="-1" role="dialog" id="setting_modal" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">个人设置</h4>
            </div>
            <div class="modal-body">
                <form id="personage" method="post" action="${APP_PATH}/user/update" >
                    <input name="id"  type="hidden" value="${userInf.id}"/>
                    <input name="username"  type="hidden" value="${userInf.username}"/>
                    <input name="account"  type="hidden" value="${userInf.account}"/>
                    <input name="type"  type="hidden" value="${userInf.type}"/>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input style="margin-bottom: 20px" disabled="disabled" type="text" class="form-control" value="${userInf.username}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">账号</label>
                        <div class="col-sm-10">
                            <input style="margin-bottom: 20px" disabled="disabled" type="text" class="form-control"  value="${userInf.account}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">账号类型</label>
                        <div class="col-sm-10">
                            <input style="margin-bottom: 20px" disabled="disabled" type="text" class="form-control"  value="${userInf.type}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input name="password" style="margin-bottom: 20px"  type="text" class="form-control" value="${userInf.password}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input name="email" style="margin-bottom: 20px"  type="text" class="form-control"  value="${userInf.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-10">
                            <input name="phone" style="margin-bottom: 20px" type="text" class="form-control"  value="${userInf.phone}">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="document.getElementById('personage').submit() ">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">基础设施维护反馈平台</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i>${userInf.username} <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#" data-toggle="modal" data-target="#setting_modal"><i class="glyphicon glyphicon-cog"></i> 个人设置</a></li>
                            <li class="divider"></li>
                            <li><a href="${APP_PATH}/logout"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                        </ul>
                    </div>
                </li>
                <li style="margin-left:10px;padding-top:8px;">
                    <button type="button" class="btn btn-default btn-danger">
                        <span class="glyphicon glyphicon-question-sign"></span> 帮助
                    </button>
                </li>
            </ul>

        </div>
    </div>
</nav>

