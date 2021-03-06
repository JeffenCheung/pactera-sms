<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务数据表演示-数据源2${fns:getLang('common.management', null)}</title>
	<meta name="decorator" content="default"/>	
	
	 <!-- CSS and JS for table fixed header -->
	<link rel="stylesheet" href="${ctxStatic}/bootstrap/table-fixed-header-master/table-fixed-header.min.css">
	<script src="${ctxStatic}/bootstrap/table-fixed-header-master/table-fixed-header.min.js"></script>
	<script src="${ctxStatic}/common/gridify.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
				
				
			// 删除选中行数据
			$("#btnDeleteChecked").click(function(){
				$.batPro("${ctx}/test/testDataDs2/deleteChecked", "${fns:getLang('common.delete', null)}");
			});

			// 复制选中行数据
			$("#btnCopyChecked").click(function(){
				$.batPro("${ctx}/test/testDataDs2/copyChecked", "${fns:getLang('common.copy', null)}");
			});
				
			// 双击记录进行编辑
			$("#contentTable tbody tr").on("dblclick", function() {
			    location.href="${ctx}/test/testDataDs2/form?id="+this.id;
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
	<ul id="mynav" class="nav nav-tabs">
		<li class="active"><a href="${ctx}/test/testDataDs2/">业务数据表演示-数据源2${fns:getLang('common.list', null)}</a></li>
		<shiro:hasPermission name="test:testDataDs2:edit"><li><a href="${ctx}/test/testDataDs2/form">业务数据表演示-数据源2${fns:getLang('common.add', null)}</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="testDataDs2" action="${ctx}/test/testDataDs2/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input id="name" path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="${fns:getLang('common.query', null)}"/></li>
			<li class="btns"><input id="btnSearchReset" class="btn btn-primary" type="reset" value="${fns:getLang('common.reset', null)}" onclick="searchReset('searchForm');"/></li>
			<li class="btns"><input id="btnDeleteChecked" class="btn btn-primary" type="button" value="${fns:getLang('common.delete', null)}" disabled="true" /></li>
			<shiro:hasPermission name="test:testDataDs2:dba"><li class="btns" style="padding-left:30px;"><input id="btnCopyChecked" class="btn btn-primary" type="button" value="${fns:getLang('common.copy', null)}" disabled="true" /></li></shiro:hasPermission>
			<shiro:hasPermission name="test:testDataDs2:dba"><li class="btns"><input id="btnTruncateTable" class="btn btn-warning" type="button" value="物理清空" onclick="truncateTable('${ctx}/test/testDataDs2/truncateTable');"/></li></shiro:hasPermission>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<form:form id="gridForm" modelAttribute="testDataDs2" action="${ctx}/test/testDataDs2/deleteChecked" method="post">
		<span id="cbRowDataIdsBox">
			<input name="cbRowDataIds" type="hidden" value=""/>
		</span>
		<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover table-fixed-header">
			<thead class="header">
				<tr>
					<th class="row-checkbox" title="${fns:getLang('common.checkall', null)}"><input type="checkbox" name="checkall" id="checkall" class="checkbox" /><label for="checkall"><span></span></label></th>
					<th class="row-number">No.</th>
					<th style="display:none;">ID</th>
					<th>名称</th>
					<th>更新时间</th>
					<th>备注信息</th>
					<shiro:hasPermission name="test:testDataDs2:edit"><th>
						${fns:getLang('common.operate', null)}
						<shiro:hasPermission name="test:testDataDs2:dba">
							[<form:checkbox id="physicalDelete" path="physicalDelete" label="物理删除" title="默认逻辑删除，勾选后进行物理删除" />]
						</shiro:hasPermission>
					</th></shiro:hasPermission>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="testDataDs2" varStatus="vs">
				<tr id="${testDataDs2.id}">
					<td class="row-checkbox"><input type="checkbox" name="cbRowData" id="cb_${testDataDs2.id}" class="checkbox" /><label for="cb_${testDataDs2.id}"><span></span></label></td></td>
					<td class="row-number">
						${vs.index + 1}
					</td>
					<td class="row-id" style="display:none;">${testDataDs2.id}</td>
					<td><a href="${ctx}/test/testDataDs2/form?id=${testDataDs2.id}">
						${testDataDs2.name}
					</a></td>
					<td>
						<fmt:formatDate value="${testDataDs2.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						${testDataDs2.remarks}
					</td>
					<shiro:hasPermission name="test:testDataDs2:edit"><td class="row-operate">
	    				<a href="${ctx}/test/testDataDs2/form?id=${testDataDs2.id}">${fns:getLang('common.edit', null)}</a>
						<a href="javascript:void(0)" onclick="rowDelete('${ctx}/test/testDataDs2/delete?id=${testDataDs2.id}');">${fns:getLang('common.delete', null)}</a>
						<shiro:hasPermission name="test:testDataDs2:dba">&nbsp;|&nbsp;<a href="${ctx}/test/testDataDs2/copy?id=${testDataDs2.id}" onclick="top.$.jBox.tip.mess=false;return this.href">${fns:getLang('common.copy', null)}</a></shiro:hasPermission>
					</td></shiro:hasPermission>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</form:form>
	<div class="pagination">${page}</div>
</body>
</html>