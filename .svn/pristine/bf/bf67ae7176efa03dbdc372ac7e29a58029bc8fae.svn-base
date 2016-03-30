<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>AGS工作站状态管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/Highcharts/highcharts.js" type="text/javascript"></script>
	<script src="${ctxStatic}/Highcharts/highcharts-more.js" type="text/javascript"></script>
	<script src="${ctxStatic}/Highcharts/modules/exporting.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#container').highcharts({

		        chart: {
		            polar: true,
		            type: 'line'
		        },
		
		        title: {
		            text: 'AGS工作站状态监控',
		            x: -80
		        },
		
		        pane: {
		            size: '80%'
		        },
		
		        xAxis: {
		            categories: [
		            	<c:forEach items="${page.list}" var="qarAgsSite" varStatus="status">
		            		'${qarAgsSite.site}'
		            		<c:choose>
		            			<c:when test="${status.last}">
		            			</c:when>
		            			<c:otherwise>
		            				,
		            			</c:otherwise>
		            		</c:choose>
		            	</c:forEach>
		            ],
		            tickmarkPlacement: 'on',
		            lineWidth: 0
		        },
		
		        yAxis: {
		            gridLineInterpolation: 'polygon',
		            lineWidth: 0,
		            min: 0
		        },
		
		        tooltip: {
		            shared: true,
		            pointFormat: '<span style="color:{series.color}">{series.name}: <b>{point.y:,.0f} %</b><br/>'
		        },
		
		        legend: {
		            align: 'right',
		            verticalAlign: 'top',
		            y: 70,
		            layout: 'vertical'
		        },
		
		        series: [{
		            name: '负载(load)',
		            data: [
		            	<c:forEach items="${page.list}" var="qarAgsSite" varStatus="status">
		            		${qarAgsSite.load}
		            		<c:choose>
		            			<c:when test="${status.last}">
		            			</c:when>
		            			<c:otherwise>
		            				,
		            			</c:otherwise>
		            		</c:choose>
		            	</c:forEach>
		            ],
		            pointPlacement: 'on'
		        }, {
		            name: '配额(Quota)',
		            data: [
		            	<c:forEach items="${page.list}" var="qarAgsSite" varStatus="status">
		            		${qarAgsSite.quota}
		            		<c:choose>
		            			<c:when test="${status.last}">
		            			</c:when>
		            			<c:otherwise>
		            				,
		            			</c:otherwise>
		            		</c:choose>
		            	</c:forEach>
		            ],
		            pointPlacement: 'on'
		        }]
		
		    });
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
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/qar/qarAgsSite/">AGS工作站状态列表</a></li>
		<shiro:hasPermission name="qar:qarAgsSite:edit"><li><a href="${ctx}/qar/qarAgsSite/form">AGS工作站状态添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="qarAgsSite" action="${ctx}/qar/qarAgsSite/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>链接状态：</label>
				<form:input path="status" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>负载：</label>
				<form:input path="load" htmlEscape="false" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="${fns:getLang('common.query', null) }"/></li>
			<li class="btns"><input id="btnSearchReset" class="btn btn-primary" type="reset" value="${fns:getLang('common.reset', null) }" onclick="searchReset('searchForm');"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<div id="container" style="min-width: 400px; max-width: 600px; height: 400px; margin: 0 auto"></div>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
		<thead>
			<tr>
				<th>序号</th>
				<th>工作站</th>
				<th class="sort-column status" title="${fns:getLang('common.sortable', null)}">链接状态</th>
				<th class="sort-column load" title="${fns:getLang('common.sortable', null)}">负载</th>
				<th class="sort-column quota" title="${fns:getLang('common.sortable', null)}">配额</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="qar:qarAgsSite:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="qarAgsSite">
			<tr>
				<td style="text-align:center"><a href="${ctx}/qar/qarAgsSite/form?id=${qarAgsSite.id}">
					${qarAgsSite.no}
				</a></td>
				<td>
					${qarAgsSite.site}
				</td>
				<td>
					${qarAgsSite.status}
				</td>
				<td style="text-align:right">
					${qarAgsSite.load} %
				</td>
				<td style="text-align:right">
					${qarAgsSite.quota} %
				</td>
				<td>
					<fmt:formatDate value="${qarAgsSite.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${qarAgsSite.remarks}
				</td>
				<shiro:hasPermission name="qar:qarAgsSite:edit"><td>
    				<a href="${ctx}/qar/qarAgsSite/form?id=${qarAgsSite.id}">修改</a>
					<a href="${ctx}/qar/qarAgsSite/delete?id=${qarAgsSite.id}" onclick="return confirmx('确认要删除该AGS工作站状态吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>