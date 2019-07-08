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
                        <label class="col-sm-4 control-label">维修工用户名</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_user_username"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">维修工邮箱</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="detail_modal_user_email"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">维修工电话</label>
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


<%--新增按钮的模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="add_modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">我要申报</h4>
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
                            <select class="form-control" id="add_modal_locate_select">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">报修类型</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="add_modal_repairType_select">
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">具体信息</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" id="add_modal_detailInf_textarea"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="add_modal_reset_btn">重置</button>
                <button type="button" class="btn btn-primary" id="add_modal_add_btn">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<%@include file="/WEB-INF/jsp/common/title.jsp"%>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <%@ include file="/WEB-INF/jsp/user/common/menu.jsp"%>
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
                    <button type="button" class="btn btn-danger" style="float:right;margin-left:10px;" id="delete_repairs_btn"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
                    <button type="button" class="btn btn-primary" style="float:right;" id="add_repair_btn"><i class="glyphicon glyphicon-plus"></i> 报修</button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <form id="repair_form">
                        <table class="table  table-bordered">
                            <thead>
                            <tr >
                                <th width="30">#</th>
                                <th width="30"><input type="checkbox" id="check_all_repair"></th>
                                <th>创建时间</th>
                                <th>地址</th>
                                <th>反馈人</th>
                                <th>维修状态</th>
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



    //当新增按钮被点击时，弹出模态框
    $("#add_repair_btn").click(function () {
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
        var locate_selector=$("#add_modal_locate_select");
        locateBind(locate_selector,-1,-1);



    });

    $("#add_modal_type_select").change(function(){
        var type=$("#add_modal_type_select").val();
        if(type==-1){
            return ;
        }
        var locate_selector=$("#add_modal_locate_select");
        locateBind(locate_selector,type,-1);
    });


    //为模态框里面的新增按钮添加点击事件
    $("#add_modal_add_btn").click(function(){
        //准备好数据
        var adressId=$("#add_modal_locate_select").val();
        var detailInf=$("#add_modal_detailInf_textarea").val();
        var userId=${userInf.id};
        var typeId=$("#add_modal_repairType_select").val();
        if(adressId==null){
            layer.msg('请选择地址信息',{time:3000,icon:5,shift:6},function () {});
            return;
        }
        if(detailInf==null){
            layer.msg('请输入详细信息',{time:3000,icon:5,shift:6},function () {});
            return;
        }
        //当新增按钮被点击时，验证用户信息是否输入正确
        $.ajax({
            type:"get",
            url:"${APP_PATH}/repair/query4Validate",
            data:{
                adressId:adressId,
                userId:userId,
                typeId:typeId,
                detailInf:detailInf
            },
            success:function (result) {
                if(result.success==true){
                    $.ajax({
                        url:"${APP_PATH}/repair/addRepair",
                        type:"post",
                        data:{
                            adressId:adressId,
                            detailInf:detailInf,
                            userId:userId,
                            typeId:typeId
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
                    layer.msg(result.msg,{time:3000,icon:5,shift:6},function () {});
                }
            }
        });

    });

    //为新增模态框里面的重置按钮添加点击事件
    $("#add_modal_reset_btn").click(function () {
        $("#add_modal_form")[0].reset();
    });

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

    //locate选择框绑定
    function locateBind(locate_selector,type,defaultLocate) {

        locate_selector.html("");
        locate_selector.select2({
            data:[
                {"id":-1,"text":"请选择"}
            ]
        });
        if(type==-1){
            return;
        }

        $.ajax({
            url:"${APP_PATH}/adress/getAdressesByCondition",
            data:{
                type: type
            },
            type:"get",
            success:function(result) {
                var select_locates_body=new Array();
                var adresses=result.data;
                $.each(adresses,function (i,adress) {
                    select_locates_body[i]={
                        "id":adress.id,
                        "text":adress.locate
                    };
                });
                locate_selector.select2({
                    data:select_locates_body
                });
                locate_selector.val(defaultLocate).select2();
            }
        });
    }

    //locate选择框绑定
    function repairType(repairType_selector,defaultType) {

        repairType_selector.html("");
        repairType_selector.select2({
            data:[
                {"id":-1,"text":"请选择"}
            ]
        });

        $.ajax({
            url:"${APP_PATH}/type/getAllType",
            type:"get",
            success:function(result) {
                var select_types_body=new Array();
                var types=result.data;
                $.each(types,function (i,type) {
                    select_types_body[i]={
                        "id":type.id,
                        "text":type.repairType
                    };
                });
                repairType_selector.select2({
                    data:select_types_body
                });
                repairType_selector.val(defaultType).select2();
            }
        });
    }



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

        $.ajax({
            type:"post",
            url:"${APP_PATH}/repair/pageQuery3",
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
                        if(repair.hasRepair=="维修中"){
                            tbodyInf+='<td></td>';
                        }else{
                            tbodyInf+='<td><input type="checkbox" name="repairid" value="'+repair.id+'"/></td>';
                        }

                       tbodyInf+='<td>'+repair.createTime+'</td>';
                       tbodyInf+='<td>'+repair.adress.campus+repair.adress.type+repair.adress.locate+'</td>';

                       tbodyInf+='<td>'+repair.user.username+'</td>';
                       tbodyInf+='<td>'+repair.hasRepair+'</td>';
                       tbodyInf+='<td>';
                       tbodyInf+='<button type="button" idClass="'+repair.id+'" class="btn btn-success btn-xs detail_btn"><i class=" glyphicon glyphicon-check"></i></button>';
                        if(repair.hasRepair=="维修中"){

                        }else{
                            tbodyInf+='<button type="button" idClass= "'+repair.id+'" pageNumber="'+pageNumber+'"  class="btn btn-danger btn-xs delete_btn"><i class=" glyphicon glyphicon-remove"></i></button>';
                        }


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

                }else{
                    layer.msg('分页查询失败',{time:3000,icon:5,shift:6},function () {});
                }
            }
        });

    }


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

                    $("#detail_modal_hasRepair").html(repair.hasRepair);

                    $("#detail_modal_type").html(repair.type.repairType);


                    $("#detail_modal_user_username").html(repair.repairman.username);

                    $("#detail_modal_user_email").html(repair.repairman.email);

                    $("#detail_modal_user_phone").html(repair.repairman.phone);

                    $("#detail_modal").modal('show');

                }else{
                    layer.msg(result.msg,{time:3000,icon:5,shift:6},function () {});
                }
            }
        });
    });

    //给页面上的删除按钮添加点击事件
    $(document).on("click",".delete_btn",function () {
        var repairId= $(this).parent("td").find("button:eq(1)").attr("idClass");
        var pageNumber=$(this).parent("td").find("button:eq(1)").attr("pageNumber");

        layer.confirm("删除此条报修信息",{icon:3,title:"提示"},function (cindex) {
            $.ajax({
               url:"${APP_PATH}/repair/deleteRepair",
               type:"post",
               data:{
                 id:repairId
               },
                success:function (result) {
                   if(result.success){
                       layer.close(cindex);
                       pageQuery(pageNumber);
                   }else{
                       layer.msg('报修信息删除失败',{time:3000,icon:5,shift:6},function () {});
                   }
                }
            });
        }),function (cindex) {
            layer.close(cindex);
        }
    });


    //给全选多选框添加点击事件
    $("#check_all_repair").click(function(){
        var flag=this.checked;
        $("#repairData :checkbox").each(function () {
            this.checked=flag;
        });
    });

    //给页面的删除多个用户的按钮添加点击事件
    $("#delete_repairs_btn").click(function () {
        var checkboxs=$("#repairData :checkbox");
        if(checkboxs==0){
            layer.msg('请选择删除的报修信息',{time:3000,icon:5,shift:6},function () {});
        }else{
            layer.confirm("删除已选择的报修信息,是否继续",{icon:3,title:"提示"},function (cindex) {
                $.ajax({
                    url:"${APP_PATH}/repair/deleteRepairs",
                    type:"post",
                    data:$("#repair_form").serialize(),
                    success:function (result) {
                        if(result.success){
                            layer.close(cindex);
                            pageQuery(1);
                        }else{
                            layer.msg('报修信息删除失败',{time:3000,icon:5,shift:6},function () {});
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

