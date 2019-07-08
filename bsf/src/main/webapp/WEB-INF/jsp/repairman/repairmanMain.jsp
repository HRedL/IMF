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
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        table tbody tr:nth-child(odd){background:#F4F4F4;}
        table tbody td:nth-child(even){color:#C00;}
    </style>
</head>

<body>


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
                        <label class="col-sm-4 control-label">反馈时间</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_createTime"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">地址信息</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_adress"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">维修类型</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_type"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">详细信息</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_detailInf"></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">是否已经维修</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_hasRepair"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">提交人用户名</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_user_username"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">提交人邮箱</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_user_email"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">提交人电话</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_user_phone"></p>
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
                <%@ include file="/WEB-INF/jsp/repairman/common/menu.jsp"%>
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
                                <input class="form-control has-success" type="text" id="query_repair_input" placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button type="button" class="btn btn-warning" id="query_user_btn"><i class="glyphicon glyphicon-search"></i> 查询</button>
                    </form>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <form id="repair_form">
                        <table class="table  table-bordered">
                            <thead>
                            <tr >
                                <th width="30">#</th>
                                <%--<th width="30"><input type="checkbox" id="check_all_repair"></th>--%>
                                <th>创建时间</th>
                                <th>地址</th>
                                <th>反馈人</th>
                                <th>是否已经修理</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>

                            <tbody id="repairData">
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
        var userId=${userInf.id};

        var jsonData={
            "pageNumber":pageNumber,
            "pageSize":5,
            "userId":userId
        };
        if(likeflag==true){
            jsonData.queryText=$("#query_repair_input").val();
        }
        var select_campus_body =new Array();

        select_campus_body[0]={
            "id":1,
            "text":"维修中"
        };
        select_campus_body[1]={
            "id":3,
            "text":"已完成"
        };


        $.ajax({
            type:"get",
            url:"${APP_PATH}/repair/pageQuery2",
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
                    var repairPage=result.data;
                    var repairs=repairPage.datas;
                    $.each(repairs,function (i,repair) {
                       tbodyInf+='<tr>';
                       tbodyInf+='<td>'+(i+1)+'</td>';
                        // tbodyInf+='<td><input type="checkbox" name="repairid" value="'+repair.id+'"/></td>';
                       tbodyInf+='<td>'+repair.createTime+'</td>';
                       tbodyInf+='<td>'+repair.adress.campus+repair.adress.type+repair.adress.locate+'</td>';
                       tbodyInf+='<td>'+repair.user.username+'</td>';
                       if(repair.hasRepair==3){
                           tbodyInf+='<td>已完成</td>';
                       }else{
                           tbodyInf+='<td><select hasRepair="'+repair.hasRepair+'" id="hasRepair'+i+'" class="hasRepair" style="width:120px;" idClass="'+repair.id+'" pageNumber="'+pageNumber+'"></select></td>';
                       }

                       tbodyInf+='<td>';
                       tbodyInf+='<button type="button" idClass="'+repair.id+'" class="btn btn-success btn-xs detail_btn"><i class=" glyphicon glyphicon-check"></i></button>';
                       // tbodyInf+='<button type="button" idClass= "'+repair.id+'" pageNumber="'+pageNumber+'" class="btn btn-danger btn-xs delete_btn"><i class=" glyphicon glyphicon-remove"></i></button>';
                       tbodyInf+='</td>';
                       tbodyInf+='</tr>';
                    });
                    if(pageNumber>1){
                        pageInf+='<li><a href="#" onclick="pageQuery('+(pageNumber-1)+')">上一页</a></li>';
                    }

                    $.each(repairPage.showNumber,function (index,item) {
                        if(item==pageNumber){
                            pageInf+='<li class="active"><a href="#">'+item+'</a></li>';
                        }else {
                            pageInf+='<li><a href="#" onclick="pageQuery('+ item +')">'+item+'</a></li>';
                        }
                    });



                    var number=Number(pageNumber)+1;
                    if(pageNumber<repairPage.totalNumber){
                        pageInf+='<li><a href="#" onclick="pageQuery('+(number)+')">下一页</a></li>';
                    }
                    $("#repairData").html(tbodyInf);
                    $("#pageInf").html(pageInf);

                    var hasRepair_selector=$(".hasRepair");
                    hasRepair_selector.select2({
                        data:select_campus_body
                    });


                    for(var i=0;i<5;i++){
                        var selector="#hasRepair"+i;
                        var hasRepairVal= $(selector).attr("hasRepair");
                        $(selector).val(hasRepairVal).select2();
                    }
                }else{
                    layer.msg('分页查询失败',{time:3000,icon:5,shift:6},function () {});
                }
            }
        });

    }


    $(document).on("change",".hasRepair",function (){
        var hasRepair=$(this).val();
        var repairId=$(this).attr("idClass");
        var pageNumber= $(this).attr("pageNumber");

        layer.confirm("修改报修信息,是否继续",{icon:3,title:"提示"},function (cindex) {
            $.ajax({
                url:"${APP_PATH}/repair/updateHasRepairType",
                type:"post",
                data:{
                    id:repairId,
                    hasRepair:hasRepair
                },
                success:function (result) {
                    if(result.success){
                        layer.close(cindex);
                        pageQuery(pageNumber);
                    }else{
                        layer.msg('报修信息修改失败',{time:3000,icon:5,shift:6},function () {});
                    }
                }
            });
        },function(cindex){
            layer.close(cindex);
            pageQuery(pageNumber);
        });

    });



    //给详细信息按钮添加点击事件
    $(document).on("click",".detail_btn",function (){
        var repairId= $(this).attr("idClass");
        $.ajax({
            type:"get",
            url:"${APP_PATH}/repair/getById",
            data:{
                id:repairId
            },
            success:function (result) {
                if(result.success==true){
                    var repair=result.data;

                    $("#detail_modal_createTime").html(repair.createTime);

                    $("#detail_modal_adress").html(repair.adress.campus+repair.adress.type+repair.adress.locate);

                    $("#detail_modal_detailInf").html(repair.detailInf);

                    $("#detail_modal_user_username").html(repair.user.username);

                    $("#detail_modal_user_email").html(repair.user.email);

                    $("#detail_modal_user_phone").html(repair.user.phone);

                    $("#detail_modal_hasRepair").html(repair.hasRepair);

                    $("#detail_modal_type").html(repair.type.repairType);
                    $("#detail_modal").modal('show');

                }else{
                    layer.msg(result.msg,{time:3000,icon:5,shift:6},function () {});
                }
            }
        });
    });


    <%--//给页面上的删除按钮添加点击事件--%>
    <%--$(document).on("click",".delete_btn",function () {--%>
        <%--var repairId= $(this).parent("td").find("button:eq(1)").attr("idClass");--%>
        <%--var pageNumber=$(this).parent("td").find("button:eq(1)").attr("pageNumber");--%>

        <%--layer.confirm("删除此条报修信息",{icon:3,title:"提示"},function (cindex) {--%>
            <%--$.ajax({--%>
               <%--url:"${APP_PATH}/repair/deleteRepair",--%>
               <%--type:"post",--%>
               <%--data:{--%>
                 <%--id:repairId--%>
               <%--},--%>
                <%--success:function (result) {--%>
                   <%--if(result.success){--%>
                       <%--layer.close(cindex);--%>
                       <%--pageQuery(pageNumber);--%>
                   <%--}else{--%>
                       <%--layer.msg('报修信息删除失败',{time:3000,icon:5,shift:6},function () {});--%>
                   <%--}--%>
                <%--}--%>
            <%--});--%>
        <%--}),function (cindex) {--%>
            <%--layer.close(cindex);--%>
        <%--}--%>
    <%--});--%>


    <%--//给全选多选框添加点击事件--%>
    <%--$("#check_all_repair").click(function(){--%>
        <%--var flag=this.checked;--%>
        <%--$("#repairData :checkbox").each(function () {--%>
            <%--this.checked=flag;--%>
        <%--});--%>
    <%--});--%>

    <%--//给页面的删除多个用户的按钮添加点击事件--%>
    <%--$("#delete_repairs_btn").click(function () {--%>
        <%--var checkboxs=$("#repairData :checkbox");--%>
        <%--if(checkboxs==0){--%>
            <%--layer.msg('请选择删除的报修信息',{time:3000,icon:5,shift:6},function () {});--%>
        <%--}else{--%>
            <%--layer.confirm("删除已选择的报修信息,是否继续",{icon:3,title:"提示"},function (cindex) {--%>
                <%--$.ajax({--%>
                    <%--url:"${APP_PATH}/repair/deleteRepairs",--%>
                    <%--type:"post",--%>
                    <%--data:$("#repair_form").serialize(),--%>
                    <%--success:function (result) {--%>
                        <%--if(result.success){--%>
                            <%--layer.close(cindex);--%>
                            <%--pageQuery(1);--%>
                        <%--}else{--%>
                            <%--layer.msg('报修信息删除失败',{time:3000,icon:5,shift:6},function () {});--%>
                        <%--}--%>
                    <%--}--%>
                <%--});--%>
            <%--}),function (cindex) {--%>
                <%--layer.close(cindex);--%>
            <%--}--%>
        <%--}--%>
    <%--});--%>


</script>
</body>
</html>

