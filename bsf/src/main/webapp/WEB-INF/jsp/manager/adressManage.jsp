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


<%--修改按钮的模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="update_modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改角色</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_modal_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">校区</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="update_modal_campus_select">
                                <option value="-1">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">场地类型</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="update_modal_type_select">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">具体位置</label>
                        <div class="col-sm-10">
                            <input type="text" id="update_modal_locate_input" class="form-control"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="update_modal_reset_btn">重置</button>
                <button type="button" class="btn btn-primary" id="update_modal_update_btn">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<%--新增按钮的模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="add_modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加角色</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="add_modal_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">校区</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="add_modal_campus_select">
                                <option value="-1">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">场地类型</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="add_modal_type_select">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">具体位置</label>
                        <div class="col-sm-10">
                            <input type="text" id="add_modal_locate_input" class="form-control"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="add_modal_reset_btn">重置</button>
                <button type="button" class="btn btn-primary" id="add_modal_add_btn">新增</button>
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
                    <button type="button" class="btn btn-danger" style="float:right;margin-left:10px;" id="delete_users_btn"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
                    <button type="button" class="btn btn-primary" style="float:right;" id="add_user_btn"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <form id="user_form">
                            <table class="table  table-bordered">
                                <thead>
                                <tr >
                                    <th width="30">#</th>
                                    <th width="30"><input type="checkbox" id="check_all_user"></th>
                                    <th>校区</th>
                                    <th>场地</th>
                                    <th>位置</th>
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

    //当新增按钮被点击时，弹出模态框
    $("#add_user_btn").click(function () {
        $("#add_modal").modal('show');
        var campus_selector= $("#add_modal_campus_select");
        campusBind(campus_selector,-1);
        var repairType_selector=$("#add_modal_repairType_select");
        repairType(repairType_selector,-1);
    });


    $("#add_modal_campus_select").change(function(){
        var campus = $("#add_modal_campus_select").val();
        if(campus==-1){
            return;
        }
        var type_selector=$("#add_modal_type_select");
        typeBind(type_selector,campus,-1);




    });


    $("#update_modal_campus_select").change(function(){
        var campus = $("#update_modal_campus_select").val();
        if(campus==-1){
            return;
        }
        var type_selector=$("#update_modal_type_select");
        typeBind(type_selector,campus,-1);
    });



    //为模态框里面的新增按钮添加点击事件
    $("#add_modal_add_btn").click(function(){
        //准备好数据
        var campus=$("#add_modal_campus_select").val();
        var type=$("#add_modal_type_select").val();
        var locate=$("#add_modal_locate_input").val();

        if(campus==-1){
            layer.msg('请选择校区',{time:3000,icon:5,shift:6},function () {});
            return;
        }
        if(type==-1){
            layer.msg('请选择场地',{time:3000,icon:5,shift:6},function () {});
            return;
        }

        $.ajax({
            type:"get",
            url:"${APP_PATH}/adress/query4Validate",
            data:{
                campus:campus,
                type:type,
                locate:locate
            },
            success:function (result) {
                if(result.success==true){
                    $.ajax({
                        url:"${APP_PATH}/adress/addAdress",
                        type:"post",
                        data:{
                            campus:campus,
                            type:type,
                            locate:locate
                        },
                        beforeSend:function () {
                            loadingIndex=layer.msg('处理中',{icon:16});
                        },
                        success:function () {
                            //只要请求发送成功，就取消加载的效果
                            layer.close(loadingIndex);
                            $("#add_modal").modal('hide');
                            pageQuery(1);
                        }
                    });
                }else{
                    layer.msg('地址信息重复，请重新输入',{time:3000,icon:5,shift:6},function () {});
                }
            }
        });
    });

    //为新增模态框里面的重置按钮添加点击事件
    $("#add_modal_reset_btn").click(function () {
        $("#add_modal_form")[0].reset();
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
            url:"${APP_PATH}/adress/pageQuery",
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
                    var adresses=userPage.datas;
                    $.each(adresses,function (i,adress) {
                        tbodyInf+='<tr>';
                        tbodyInf+='<td>'+(i+1)+'</td>';
                        tbodyInf+='<td><input type="checkbox" name="adressid" value="'+adress.id+'"/></td>';
                        tbodyInf+='<td>'+adress.campus+'</td>';
                        tbodyInf+='<td>'+adress.type+'</td>';
                        tbodyInf+='<td>'+adress.locate+'</td>';
                        tbodyInf+='<td>';
                        tbodyInf+='<button type="button" idClass= "'+adress.id+'" pageNumber="'+pageNumber+'" class="btn btn-primary btn-xs update_btn"><i class=" glyphicon glyphicon-pencil"></i></button>';
                        tbodyInf+='<button type="button" class="btn btn-danger btn-xs delete_btn"><i class=" glyphicon glyphicon-remove"></i></button>';
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

    function campusBind(campus_selector,defaultCampus){
        $.ajax({
            type:"get",
            url:"${APP_PATH}/dict/getDictsByType",
            data:{
                type:"campus"
            },
            success:function (result) {
                if (result.success == true) {
                    var campusDicts=result.data;
                    var select_campus_body =new Array();
                    select_campus_body[0]={
                        "id":-1,
                        "text":"请选择"
                    };
                    $.each(campusDicts,function (i,campusDict) {
                        select_campus_body[i+1]={
                            "id":campusDict.value,
                            "text":campusDict.label
                        };
                    });
                    campus_selector.select2({
                        data:select_campus_body
                    });

                    campus_selector.val(defaultCampus).select2();

                }
            }
        });
    }

    //type选择框绑定
    function typeBind(type_selector,campus,defaultBnum) {

        type_selector.html("");
        type_selector.select2({
            data:[
                {"id":-1,"text":"请选择"}
            ]
        });

        $.ajax({
            url:"${APP_PATH}/dict/getDictsByTypeAndParent",
            data:{
                type: "BNUM",
                ptype:"CAMPUS",
                pvalue:campus
            },
            type:"get",
            success:function(result) {
                var select_types_body=new Array();
                var typeDicts=result.data;
                $.each(typeDicts,function (i,typeDict) {
                    select_types_body[i]={
                        "id":typeDict.value,
                        "text":typeDict.label
                    };
                });
                type_selector.select2({
                    data:select_types_body
                });

                type_selector.val(defaultBnum).select2();
            }
        });
    }

    //给页面上的更新按钮的点击事件
    $(document).on("click",".update_btn",function (){

        var adressId= $(this).attr("idClass");
        $("#update_modal_update_btn").attr("idClass",adressId);
        var pageNumber=$(this).attr("pageNumber");
        $("#update_modal_update_btn").attr("pageNumber",pageNumber);
        $.ajax({
            type:"get",
            url:"${APP_PATH}/adress/getByIdNoCampus",
            data:{
                id:adressId
            },
            success:function (result) {
                if (result.success==true) {

                    var adress=result.data;
                    var campus=adress.campus;
                    var type=adress.type;
                    var locate=adress.locate;

                    var campus_selector= $("#update_modal_campus_select");
                    var type_selector=$("#update_modal_type_select");
                    $("#update_modal_locate_input").val(locate);

                    campusBind(campus_selector,campus);
                    typeBind(type_selector,campus,type);

                    $("#update_modal").modal('show');


                }
            }
        });

    });

    //给修改模态框的新增按钮按钮添加点击事件
    $("#update_modal_update_btn").click(function () {
        //准备好数据
        var adressId= $("#update_modal_update_btn").attr("idClass");
        var pageNumber=$(this).attr("pageNumber");
        var campus=$("#update_modal_campus_select").val();
        var type=$("#update_modal_type_select").val();
        var locate=$("#update_modal_locate_input").val();


        if(campus==-1){
            layer.msg('请选择校区',{time:3000,icon:5,shift:6},function () {});
            return;
        }
        if(type==-1){
            layer.msg('请选择场地',{time:3000,icon:5,shift:6},function () {});
            return;
        }

        $.ajax({
            type:"get",
            url:"${APP_PATH}/adress/query4Validate",
            data:{
                campus:campus,
                type:type,
                locate:locate
            },
            success:function (result) {
                if(result.success==true){
                    $.ajax({
                        url:"${APP_PATH}/adress/updateAdress",
                        type:"post",
                        data:{
                            id:adressId,
                            campus:campus,
                            type:type,
                            locate:locate
                        },
                        beforeSend:function () {
                            loadingIndex=layer.msg('处理中',{icon:16});
                        },
                        success:function () {
                            //只要请求发送成功，就取消加载的效果
                            layer.close(loadingIndex);
                            $("#update_modal").modal('hide');
                            pageQuery(pageNumber);
                        }
                    });
                }else{
                    layer.msg('地址信息重复，请重新输入',{time:3000,icon:5,shift:6},function () {});
                }
            }
        });
    });


    //给修改模态框里面的重置按钮添加点击事件
    $("#update_modal_reset_btn").click(function () {
        $("#update_modal_form")[0].reset();
    });

    //给页面上的删除按钮添加点击事件
    $(document).on("click",".delete_btn",function () {
        var adressId= $(this).parent("td").find("button:eq(0)").attr("idClass");
        var pageNumber=$(this).parent("td").find("button:eq(0)").attr("pageNumber");
        layer.confirm("删除该条地址信息,是否继续",{icon:3,title:"提示"},function (cindex) {
            $.ajax({
                url:"${APP_PATH}/adress/deleteAdress",
                type:"post",
                data:{
                    id:adressId
                },
                success:function (result) {
                    if(result.success){
                        layer.close(cindex);
                        pageQuery(pageNumber);
                    }else{
                        layer.msg('地址信息删除失败',{time:3000,icon:5,shift:6},function () {});
                    }
                }
            });
        }),function (cindex) {
            layer.close(cindex);
        }
    });


    //给全选多选框添加点击事件
    $("#check_all_user").click(function(){
        var flag=this.checked;
        $("#userData :checkbox").each(function () {
            this.checked=flag;
        });
    });

    //给页面的删除多个用户的按钮添加点击事件
    $("#delete_users_btn").click(function () {
        var checkboxs=$("#userData :checkbox");
        if(checkboxs==0){
            layer.msg('请选择删除的地址',{time:3000,icon:5,shift:6},function () {});
        }else{
            layer.confirm("删除已选择的地址信息,是否继续",{icon:3,title:"提示"},function (cindex) {
                $.ajax({
                    url:"${APP_PATH}/adress/deleteAdresses",
                    type:"post",
                    data:$("#user_form").serialize(),
                    success:function (result) {
                        if(result.success){
                            layer.close(cindex);
                            pageQuery(1);
                        }else{
                            layer.msg('地址信息删除失败',{time:3000,icon:5,shift:6},function () {});
                        }
                    }
                });
            }),function (cindex) {
                layer.close(cindex);
            }
        }
    });

</script>
</body>
</html>

