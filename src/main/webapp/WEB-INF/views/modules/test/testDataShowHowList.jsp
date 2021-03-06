<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务数据表演示upd${fns:getLang('common.management', null)}</title>
	<meta name="decorator" content="default"/>	
	
	 <!-- CSS and JS for table fixed header -->
	<link rel="stylesheet" href="${ctxStatic}/bootstrap/table-fixed-header-master/table-fixed-header.min.css">
	<script src="${ctxStatic}/bootstrap/table-fixed-header-master/table-fixed-header.min.js"></script>
	<script src="${ctxStatic}/common/gridify.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnCsvExport").click(function(){
				top.$.jBox.confirm("确认要导出数据文件吗？如果数据过大，可能需要一些时间。","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#exportCsvForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			$("#btnCsvImport").click(function(){
				$.jBox($("#importCsvBox").html(), {title:"导入数据", buttons:{"关闭":true}, 
					bottomText:"导入文件不能超过5M，仅允许导入“csv”格式文件！"});
			});
				
				
			// 删除选中行数据
			$("#btnDeleteChecked").click(function(){
				$.batPro("${ctx}/test/testDataShowHow/deleteChecked", "${fns:getLang('common.delete', null)}");
			});

			// 复制选中行数据
			$("#btnCopyChecked").click(function(){
				$.batPro("${ctx}/test/testDataShowHow/copyChecked", "${fns:getLang('common.copy', null)}");
			});
				
			// 双击记录进行编辑
			$("#contentTable tbody tr").on("dblclick", function() {
			    location.href="${ctx}/test/testDataShowHow/form?id="+this.id;
			});
			
			// make the header fixed on scroll
			$(".table-fixed-header").fixedHeader();
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
        	    
	    // 重置按钮
	    function searchReset(formId){
	    	// 重置所有输入框
	    	var inputDom = $("#" + formId).find(":input[type='text']");
	    	if(inputDom) inputDom.val("");
	    	
	    	// 重置下拉框
	    	//$("#type").val("");
	    	
	    	// 刷新表单
			$("#" + formId).submit();	    	
	    }
	</script>
</head>
<body>
	<div id="importCsvBox" class="hide">
		<form id="importCsvForm" action="${ctx}/test/testDataShowHow/import/csv" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');"><br/>
			<input id="uploadCsvFile" name="file" type="file" style="width:330px"/><br/><br/>　　
			<input id="btnImportCsvSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
			<a href="${ctx}/test/testDataShowHow/import/csv/template">下载模板</a>
		</form>
		<form id="exportCsvForm" action="${ctx}/test/testDataShowHow/export/csv" method="post" enctype="multipart/form-data">
		</form>
	</div>
	<ul id="mynav" class="nav nav-tabs">
		<li class="active"><a href="${ctx}/test/testDataShowHow/">业务数据表演示upd${fns:getLang('common.list', null)}</a></li>
		<shiro:hasPermission name="test:testDataShowHow:edit"><li><a href="${ctx}/test/testDataShowHow/form">业务数据表演示upd${fns:getLang('common.add', null)}</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="testDataShowHow" action="${ctx}/test/testDataShowHow/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>归属用户：</label>
				<sys:treeselect id="user" name="user.id" value="${testDataShowHow.user.id}" labelName="user.name" labelValue="${testDataShowHow.user.name}"
					title="${fns:getLang('common.user', null)}" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${testDataShowHow.office.id}" labelName="office.name" labelValue="${testDataShowHow.office.name}"
					title="${fns:getLang('common.dept', null)}" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>名称：</label>
				<form:input id="name" path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="${fns:getLang('common.query', null)}"/></li>
			<li class="btns"><input id="btnSearchReset" class="btn btn-primary" type="reset" value="${fns:getLang('common.reset', null)}" onclick="searchReset('searchForm');"/></li>
			<li class="btns"><input id="btnDeleteChecked" class="btn btn-primary" type="button" value="${fns:getLang('common.delete', null)}" disabled="true" /></li>
			<shiro:hasPermission name="test:testDataShowHow:dba"><li class="btns" style="padding-left:30px;"><input id="btnCopyChecked" class="btn btn-primary" type="button" value="${fns:getLang('common.copy', null)}" disabled="true" /></li></shiro:hasPermission>
			<shiro:hasPermission name="test:testDataShowHow:dba"><li class="btns"><input id="btnTruncateTable" class="btn btn-warning" type="button" value="物理清空" onclick="truncateTable('${ctx}/test/testDataShowHow/truncateTable');"/></li></shiro:hasPermission>
			<% // CSV管理： 模版下载、数据导入、导入数据校验、数据导出 %>
			<li><label></label></li>
			<shiro:hasPermission name="test:testDataShowHow:io"><li class="btns"><input id="btnCsvExport" class="btn btn-primary" type="button" value="CSV数据导出"/></li></shiro:hasPermission>
			<shiro:hasPermission name="test:testDataShowHow:io"><li class="btns"><input id="btnCsvImport" class="btn btn-primary" type="button" value="CSV数据导入"/></li></shiro:hasPermission>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<form:form id="gridForm" modelAttribute="testDataShowHow" action="${ctx}/test/testDataShowHow/deleteChecked" method="post">
		<span id="cbRowDataIdsBox">
			<input name="cbRowDataIds" type="hidden" value=""/>
		</span>
		<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover table-fixed-header">
			<thead class="header">
				<tr>
					<th class="row-checkbox" title="${fns:getLang('common.checkall', null)}"><input type="checkbox" name="checkall" id="checkall" class="checkbox" /><label for="checkall"><span></span></label></th>
					<th class="row-number">No.</th>
					<th style="display:none;">ID</th>
					<th>归属用户</th>
					<th>归属部门</th>
					<th>归属区域</th>
					<th>名称</th>
					<th>加入日期</th>
					<th>创建者</th>
					<th>更新时间</th>
					<th>备注信息</th>
					<shiro:hasPermission name="test:testDataShowHow:edit"><th>
						${fns:getLang('common.operate', null)}
						<shiro:hasPermission name="test:testDataShowHow:dba">
							[<form:checkbox id="physicalDelete" path="physicalDelete" label="物理删除" title="默认逻辑删除，勾选后进行物理删除" />]
						</shiro:hasPermission>
					</th></shiro:hasPermission>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="testDataShowHow" varStatus="vs">
				<tr id="${testDataShowHow.id}">
					<td class="row-checkbox"><input type="checkbox" name="cbRowData" id="cb_${testDataShowHow.id}" class="checkbox" /><label for="cb_${testDataShowHow.id}"><span></span></label></td></td>
					<td class="row-number">
						${vs.index + 1}
					</td>
					<td class="row-id" style="display:none;">${testDataShowHow.id}</td>
					<td><a href="${ctx}/test/testDataShowHow/form?id=${testDataShowHow.id}">
						${testDataShowHow.user.name}
					</a></td>
					<td>
						${testDataShowHow.office.name}
					</td>
					<td>
						${testDataShowHow.area.name}
					</td>
					<td>
						${testDataShowHow.name}
					</td>
					<td>
						<fmt:formatDate value="${testDataShowHow.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						${testDataShowHow.createBy.id}
					</td>
					<td>
						<fmt:formatDate value="${testDataShowHow.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						${testDataShowHow.remarks}
					</td>
					<shiro:hasPermission name="test:testDataShowHow:edit"><td class="row-operate">
	    				<a href="${ctx}/test/testDataShowHow/form?id=${testDataShowHow.id}">${fns:getLang('common.edit', null)}</a>
						<a href="javascript:void(0)" onclick="rowDelete('${ctx}/test/testDataShowHow/delete?id=${testDataShowHow.id}');">${fns:getLang('common.delete', null)}</a>
						<shiro:hasPermission name="test:testDataShowHow:dba">&nbsp;|&nbsp;<a href="${ctx}/test/testDataShowHow/copy?id=${testDataShowHow.id}" onclick="top.$.jBox.tip.mess=false;return this.href">${fns:getLang('common.copy', null)}</a></shiro:hasPermission>
					</td></shiro:hasPermission>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</form:form>
	<div class="pagination">${page}</div>
</body>
</html>