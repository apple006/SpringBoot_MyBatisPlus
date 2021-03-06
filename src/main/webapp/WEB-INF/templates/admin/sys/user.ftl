<!DOCTYPE html>
<html>
<head>
    <title>管理员管理</title>
    [#include "/admin/header.ftl"]
    <link rel="stylesheet" href="${base}/statics/common/bootstrap-table/bootstrap-table.min.css"/>
    <link rel="stylesheet" href="${base}/statics/common/icheck/flat/green.css"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>管理员列表</h5>
                    <div class="ibox-tools"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a> <a
                            class="close-link"><i class="fa fa-times"></i></a></div>
                </div>
                <div class="ibox-content form-horizontal">
                    <div class="row row-lg">
                        <div class="col-sm-12">
                            <div class="example-wrap">
                                <div class="example">
                                    <div id="toolbar" class="btn-group m-t-sm">
                  	 				[@shiro.hasPermission name="sys:user:save"]
                                        <button type="button" style="margin-right:10px;" class="btn btn-default"
                                                title="创建管理员" onclick="add($('#showHandle'))"><i
                                                class="glyphicon glyphicon-plus"></i> 创建管理员</button>
                                    [/@shiro.hasPermission]
                  	 				[@shiro.hasPermission name="sys:user:delete"]
                                        <button type="button" style="margin-right:10px;" class="btn btn-danger"
                                                title="批量删除管理员" onclick="del($('#table'))"><i
                                                class="glyphicon glyphicon-remove"></i> 批量删除管理员</button>
                                    [/@shiro.hasPermission]
                                    </div>
                                    <table id="table"
                                           data-toggle="table"
                                           data-height="600"
                                           data-search="true"
                                           data-search-on-enter-key="true"
                                           data-show-refresh="true"
                                           data-show-toggle="true"
                                           data-show-export="true"
                                           data-show-columns="true"
                                           data-url="${base}/admin/sys/user/list" [#-- 服务器数据URL --]
                                           data-pagination="true"
                                           data-page-size="20"
                                           data-page-list="[20, 50, 100, 200]"
                                           data-side-pagination="server"
                                           data-striped="true"
                                           data-pagination="true"
                                           data-sort-name="createTime" [#-- 默认排序字段 --]
                                           data-sort-order="desc" [#-- 默认排序顺序 可选asc desc --]
                                           data-toolbar="#toolbar" [#-- 指定工具类元素 --]
                                           data-click-to-select="true" [#-- 设置true 将在点击行时，自动选择rediobox 和 checkbox --]
                                           data-single-select="false" [#-- 设置True 将禁止多选 --]
                                           data-unique-id="userId" [#-- 填写主键ID即可 --][#-- 官方文档:http://bootstrap-table.wenzhixin.net.cn/zh-cn/documentation/ --]
                                           data-response-handler="defaultBootstarpTableHandler">
                                    <thead>
                                    <tr>
                                        <th data-checkbox="true"></th>
                                        <th data-field="username" data-halign="center" data-align="center"
                                            data-sortable="true">用户名
                                        </th>
                                        <th data-field="email" data-halign="center" data-align="center"
                                            data-sortable="true">邮箱
                                        </th>
                                        <th data-field="mobile"
                                            data-sortable="true" data-halign="center" data-align="center">手机号
                                        </th>
                                        <th data-field="status" data-formatter="formatStatus"
                                            data-sortable="true" data-halign="center" data-align="center">状态
                                        </th>
                                        <th data-field="lastLoginIp"
                                            data-sortable="true" data-halign="center" data-align="center">最后登录IP
                                        </th>
                                        <th data-field="lastLoginTime" data-formatter="BootstrapTableformatDate"
                                            data-sortable="true" data-halign="center" data-align="center">最后登录时间
                                        </th>
                                        <th data-field="createTime" data-formatter="BootstrapTableformatDate"
                                            data-sortable="true" data-halign="center" data-align="center">创建时间
                                        </th>
                                        <th data-formatter="actionFormatter" data-events="actionEvents"
                                            data-halign="center" data-align="center">操作
                                        </th>
                                    </tr>
                                    </thead>
                                    </table>
                   <input type='hidden' id="handle" 
                        [@shiro.hasPermission name="sys:user:update"] data-update="true"[/@shiro.hasPermission]
                        [@shiro.hasPermission name="sys:user:delete"] data-delete="true"[/@shiro.hasPermission]/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="showHandle" style="display:none;">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><span id="title">创建管理员<span><small></small></h5>
                <div class="ibox-tools"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a> <a
                        class="close-link"><i class="fa fa-times"></i></a></div>
            </div>
            <div class="ibox-content form-horizontal">
                <form id="form">
                    <input type='hidden' name="userId"/>
                    <div class="form-group m-t">
                        <label class="col-sm-2 col-xs-offset-1 control-label">用户名：</label>
                        <div class="col-sm-6">
                            <input type="text" maxlength="15" class="form-control" name="username">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-offset-1 control-label">密码：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="password">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-offset-1 control-label">邮箱：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="email">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-offset-1 control-label">手机号：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="mobile">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-offset-1 control-label">性别：</label>
                        <div class="col-sm-6">
                             <label class="radio-inline add-radio">
	                                    <input type="radio" name="sex" value="1">
	                                    男</label>
	                                <label class="radio-inline add-radio">
	                                    <input type="radio" name="sex" value="2">
	                                    女</label>
	                                <label class="radio-inline add-radio">
	                                    <input type="radio" name="sex" value="0">
	                                    保密</label>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-offset-1 control-label">角色：</label>
                        <div id="rolelist" class="col-sm-6">
                            
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-offset-1 control-label">状态：</label>
                        <div class="col-sm-6">  
	                        <label class="radio-inline add-radio">
	                                    <input type="radio" name="status" value="1">
	                                    正常</label>
	                                <label class="radio-inline add-radio">
	                                    <input type="radio" name="status" value="0">
	                                    禁用</label>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="col-sm-12 text-center">
                            <button type="submit" class="btn btn-success" onclick="saveOrUpdate(this);">提交
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- bootstrapvalidator-master前端验证框架 -->
<script src="${base}/statics/common/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<!-- Bootstrap table -->
<script src="${base}/statics/common/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${base}/statics/common/bootstrap-table/extensions/export/bootstrap-table-export.js"></script>
<script src="${base}/statics/common/bootstrap-table/tableExport.js"></script>
<script src="${base}/statics/common/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<!-- 自定义js -->
<script src="${base}/statics/js/admin/sys/admin.js"></script>
<!-- iCheck -->
<script src="${base}/statics/common/icheck/icheck.min.js"></script>
[#-- 自定义搜索框placeholder --]
[#assign searchText="用户名"]
[#include "/admin/bootstrapcommon.ftl"]
</body>
</html>