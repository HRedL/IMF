<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${APP_PATH}/tools/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/tools/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/tools/css/main.css">
    <link rel="stylesheet" href="${APP_PATH}/tools/select2/dist/css/select2.min.css">

</head>
<body>


<%--给用户添加角色信息按钮的模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="add_role_modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">维修信息分配</h4>
            </div>
            <div class="modal-body">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form id="add_role_form" role="form" class="form-inline">
                            <input type="hidden" id="add_role_id" name="id"/>

                            <div class="form-group">
                                <label>未分配维修信息列表</label><br>
                                <select id="left_select" name="unassignRoleIds" class="form-control" multiple size="10" style="width:200px;overflow-y:auto;">

                                </select>
                            </div>
                            <div class="form-group">
                                <ul>
                                    <li id="left2right_btn" class="btn btn-default glyphicon glyphicon-chevron-right"></li>
                                    <br>
                                    <li id="right2left_btn" class="btn btn-default glyphicon glyphicon-chevron-left" style="margin-top:20px;"></li>
                                </ul>
                            </div>
                            <div class="form-group" style="margin-left:40px;">
                                <label>已分配维修信息列表</label><br>
                                <select id="right_select" name="assignRoleIds" class="form-control" multiple size="10" style="width:200px;overflow-y:auto;">

                                </select>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="add_role_modal_close_btn">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<%--查看详细信息模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="detail_modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">详细信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="detail_modal_form">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">创建时间</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_createTime"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">用户名</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_username"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">账号</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_account"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">密码</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_password"></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">邮箱</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_email"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">电话</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_phone"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">用户类型</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_type"></p>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<%@include file="/WEB-INF/jsp/common/title.jsp"%>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <%@ include file="/WEB-INF/jsp/manager/common/menu.jsp"%>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input class="form-control has-success" type="text" id="query_user_input" placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button type="button" class="btn btn-warning" id="query_user_btn"><i class="glyphicon glyphicon-search"></i> 查询</button>
                    </form>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <form id="user_form">
                        <table class="table  table-bordered">
                            <thead>
                            <tr >
                                <th width="30">#</th>
                                <th>创建时间</th>
                                <th>账号</th>
                                <th>名称</th>
                                <th>邮箱地址</th>
                                <th>电话</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>

                            <tbody id="userData">
                            </tbody>

                            <tfoot>
                            <tr >
                                <td colspan="6" align="center">
                                    <ul id="pageInf" class="pagination">

                                    </ul>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${APP_PATH}/tools/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/tools/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/tools/script/docs.min.js"></script>
<script src="${APP_PATH}/tools/layer/layer.js"></script>
<script src="${APP_PATH}/tools/select2/dist/js/select2.min.js"></script>
<script type="text/javascript">
    var likeflag=false;
    $(function () {

        //在文档加载完成之后，进入第一页
        pageQuery(1);
        $("#query_user_btn").click(function () {
            var queryText=$("#query_user_input").val();
            if(queryText==""){
                likeflag=false;
            }else {
                likeflag=true;
            }
            pageQuery(1);
        });


    });


    //翻页
    function pageQuery(pageNumber) {
        var loadingIndex=null;

        var jsonData={
            "pageNumber":pageNumber,
            "pageSize":5
        };
        if(likeflag==true){
            jsonData.queryText=$("#query_user_input").val();
        }

        $.ajax({
            type:"get",
            url:"${APP_PATH}/user/pageQueryOnlyRepairman",
            data:jsonData,
            beforeSend: function () {
                loadingIndex=layer.msg('处理中',{icon:16});
            },
            success:function (result) {
                layer.close(loadingIndex);
                if(result.success){
                    //局部刷新页面数据（即将页面信息补充完整）
                    var tbodyInf="";
                    var pageInf="";
                    var userPage=result.data;
                    var users=userPage.datas;
                    $.each(users,function (i,user) {
                       tbodyInf+='<tr>';
                       tbodyInf+='<td>'+(i+1)+'</td>';
                       tbodyInf+='<td>'+user.createTime+'</td>';
                       tbodyInf+='<td>'+user.account+'</td>';
                       tbodyInf+='<td>'+user.username+'</td>';
                       tbodyInf+='<td>'+user.email+'</td>';
                       tbodyInf+='<td>'+user.phone+'</td>';
                       tbodyInf+='<td>';
                       tbodyInf+='<button type="button" idClass="'+user.id+'" class="btn btn-success btn-xs detail_btn"><i class=" glyphicon glyphicon-check"></i></button>';
                       tbodyInf+='<button type="button" idClass= "'+user.id+'" pageNumber="'+pageNumber+'" class="btn btn-primary btn-xs add_role_btn"><i class=" glyphicon glyphicon-pencil"></i></button>';
                       tbodyInf+='</td>';
                       tbodyInf+='</tr>';
                    });
                    if(pageNumber>1){
                        pageInf+='<li><a href="#" onclick="pageQuery('+(pageNumber-1)+')">上一页</a></li>';
                    }

                    $.each(userPage.showNumber,function (index,item) {
                        if(item==pageNumber){
                            pageInf+='<li class="active"><a href="#">'+item+'</a></li>';
                        }else {
                            pageInf+='<li><a href="#" onclick="pageQuery('+ item +')">'+item+'</a></li>';
                        }
                    });

                    var number=Number(pageNumber)+1;
                    if(pageNumber<userPage.totalNumber){
                        pageInf+='<li><a href="#" onclick="pageQuery('+(number)+')">下一页</a></li>';
                    }
                    $("#userData").html(tbodyInf);
                    $("#pageInf").html(pageInf);

                }else{
                    layer.msg('分页查询失败',{time:3000,icon:5,shift:6},function () {});
                }
            }

        });

    }

    //给页面上的更新按钮的点击事件
    $(document).on("click",".update_btn",function (){

        var userId= $(this).attr("idClass");
        var pageNumber= $(this).attr("pageNumber");
        $("#update_modal_update_btn").attr("idClass",userId);
        $("#update_modal_update_btn").attr("pageNumber",pageNumber);
       $.ajax({
           type:"get",
           url:"${APP_PATH}/user/getUserByIdNoType",
           data:{
               id:userId
           },
           success:function (result) {
               if (result.success==true) {
                   var user =result.data;
                   $("#update_modal_username_input").val(user.username);
                   $("#update_modal_account_input").val(user.account);
                   $("#update_modal_password_input").val(user.password);
                   $("#update_modal_email_input").val(user.email);
                   $("#update_modal_phone_input").val(user.phone);

                   $.ajax({
                       type:"get",
                       url:"${APP_PATH}/dict/getDictsByType",
                       data:{
                           type:"userType"
                       },
                       success:function (result) {

                           var userType_selector=$("#update_modal_type_select");
                           var userTypeDicts=result.data;
                           var select_userType_body =new Array();
                           select_userType_body[0]={
                               "id":-1,
                               "text":"请选择"
                           };
                           $.each(userTypeDicts,function (i,userTypeDict) {
                               select_userType_body[i+1]={
                                   "id":userTypeDict.value,
                                   "text":userTypeDict.label
                               };
                           });
                           userType_selector.select2({
                               data:select_userType_body
                           });
                           userType_selector.val(user.type).select2();

                       }
                   });
                   $("#update_modal").modal('show');

               }
           }
       });

    });
    
    //给修改模态框的新增按钮按钮添加点击事件
    $("#update_modal_update_btn").click(function () {
        var userId=$("#update_modal_update_btn").attr("idClass");
        var account=$("#update_modal_account_input").val();
        var username=$("#update_modal_username_input").val();
        var email=$("#update_modal_email_input").val();
        var type=$("#update_modal_type_select").val();
        var password=$("#update_modal_password_input").val();
        var phone=$("#update_modal_phone_input").val();
        var pageNumber=$("#update_modal_update_btn").attr("pageNumber");
        $.ajax({
            type:"post",
            url:"${APP_PATH}/user/usernameValidate",
            data:{
                username:username,
                account:account
            },
            success:function (result) {
                if(result.success==true){
                    $.ajax({
                        url:"${APP_PATH}/user/updateUser",
                        type:"post",
                        data:{
                            id:userId,
                            username:username,
                            account:account,
                            password:password,
                            type:type,
                            email:email,
                            phone:phone
                        },
                        beforeSend:function () {
                            loadingIndex=layer.msg('处理中',{icon:16});
                        },
                        success:function () {
                            //只要请求发送成功，就取消加载的效果
                            layer.close(loadingIndex);
                            //关闭模态框,坑啊，关闭竟然是hide，不是close，好吧，，确实应该是hide
                            $("#update_modal").modal('hide');
                            pageQuery(pageNumber);
                        }
                    });

                }else{
                    layer.msg('用户名或者用户账号重复，请重新输入',{time:3000,icon:5,shift:6},function () {});
                }
            }
        });
    });

    //给详细信息按钮添加点击事件
    $(document).on("click",".detail_btn",function (){
        var userId= $(this).attr("idClass");
        $.ajax({
            type:"get",
            url:"${APP_PATH}/user/getUserById",
            data:{
                id:userId
            },
            success:function (result) {
                if(result.success==true){
                    var user=result.data;
                    $("#detail_modal_createTime").html(user.createTime);
                    $("#detail_modal_username").html(user.username);
                    $("#detail_modal_account").html(user.account);
                    $("#detail_modal_password").html(user.password);
                    $("#detail_modal_email").html(user.email);
                    $("#detail_modal_phone").html(user.phone);
                    $("#detail_modal_type").html(user.type);
                    $("#detail_modal").modal('show');

                }else{
                    layer.msg(result.msg,{time:3000,icon:5,shift:6},function () {});
                }
            }
        });
    });

    //给页面上的添加角色的按钮添加点击事件
    $(document).on("click",".add_role_btn",function () {
        var userId=$(this).attr("idClass");
        $("#add_role_id").val(userId);
        $.ajax({
            url:"${APP_PATH}/repair/query4AssignRepair",
            type:"post",
            data:{
                userId:userId
            },
            success:function (result) {
                if(result.success){
                    var leftSelect="";
                    var rightSelect="";
                    var unassignedRepairs=result.data.unassignedRepairs;
                    var assignedRepairs=result.data.assignedRepairs;
                    $.each(unassignedRepairs,function (index,item) {
                        leftSelect+='<option value="'+item.id+'">'+item.adress.campus+item.adress.type+item.adress.locate+item.type.repairType+'</option>';
                    });
                    $.each(assignedRepairs,function (index,item) {
                        rightSelect+='<option value="'+item.id+'">'+item.adress.campus+item.adress.type+item.adress.locate+item.type.repairType+'</option>';
                    });

                    $("#left_select").html(leftSelect);
                    $("#right_select").html(rightSelect);
                    $("#add_role_modal").modal('show');
                }else{
                    layer.msg('角色查询失败',{time:3000,icon:5,shift:6},function () {});
                }
            }
        });
    });

    $("#left2right_btn").click(function () {
        var opts=$("#left_select :selected");
        if(opts.length==0){
            layer.msg('请选择维护信息',{time:3000,icon:5,shift:6},function () {});
        }else{
            $.ajax({
                url:"${APP_PATH}/repair/doAssign",
                type:"post",
                data:$("#add_role_form").serialize(),
                success:function (result) {
                    if(result.success){
                        $("#right_select").append(opts);
                    }else{
                        layer.msg('维护信息分配失败',{time:3000,icon:5,shift:6},function () {});
                    }
                }
            });
        }
    });

    $("#right2left_btn").click(function () {
        var opts=$("#right_select :selected");
        if(opts.length==0){
            layer.msg('请选择维护信息',{time:3000,icon:5,shift:6},function () {});
        }else{
            $.ajax({
                url:"${APP_PATH}/repair/doUnassign",
                type:"post",
                data:$("#add_role_form").serialize(),
                success:function (result) {
                    if(result.success){
                        $("#left_select").append(opts);
                    }else{
                        layer.msg('维护信息分配失败',{time:3000,icon:5,shift:6},function () {});
                    }
                }
            });
        }
    });

    $("#add_role_modal_close_btn").click(function () {
        $("#add_role_modal").modal('hide');
    });



</script>
</body>
</html>

