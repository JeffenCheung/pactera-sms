<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>QAR超限事件poi-ac${fns:getLang('common.management', null)}</title>
	<meta name="decorator" content="default"/>	
	
	 <!-- CSS and JS for table fixed header -->
	<link rel="stylesheet" href="${ctxStatic}/bootstrap/table-fixed-header-master/table-fixed-header.min.css">
	<script src="${ctxStatic}/bootstrap/table-fixed-header-master/table-fixed-header.min.js"></script>
	<script src="${ctxStatic}/common/gridify.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$( "#evtFltarrival" ).autocomplete({
		        minLength: 1,
		        delay: 500,
		        //define callback to format results
		        source: function (request, response) {
		            $.getJSON("${ctx}/qar/qarEvent/getEvtFltarrivalList", request, function(result) {
		                response($.map(result, function(item) {
		                    return {
		                        // following property gets displayed in drop down
		                        label: item.evtFltarrival,
		                        // following property gets entered in the textbox
		                        value: item.evtFltarrival
		                    }
		                }));
		            });
		        },
		 
		        //define select handler
		        select : function(event, ui) {
		            if (ui.item) {
		                event.preventDefault();
		                $("#evtFltarrival").val(ui.item.value);
		                $("#evtFltarrival").blur();
		                return false;
		            }
		        }
		    });
			$( "#evtFltno" ).autocomplete({
		        minLength: 1,
		        delay: 500,
		        //define callback to format results
		        source: function (request, response) {
		            $.getJSON("${ctx}/qar/qarEvent/getEvtFltnoList", request, function(result) {
		                response($.map(result, function(item) {
		                    return {
		                        // following property gets displayed in drop down
		                        label: item.evtFltno,
		                        // following property gets entered in the textbox
		                        value: item.evtFltno
		                    }
		                }));
		            });
		        },
		 
		        //define select handler
		        select : function(event, ui) {
		            if (ui.item) {
		                event.preventDefault();
		                $("#evtFltno").val(ui.item.value);
		                $("#evtFltno").blur();
		                return false;
		            }
		        }
		    });
				
			$("#btnExcelExport").click(function(){
				top.$.jBox.confirm("确认要导出数据文件吗？如果数据过大，可能需要一些时间。","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#exportExcelForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			$("#btnExcelImport").click(function(){
				$.jBox($("#importExcelBox").html(), {title:"导入数据", buttons:{"关闭":true}, 
					bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
			});
				

				
			// 双击记录进行编辑
			$("#contentTable tbody tr").on("dblclick", function() {
			    location.href="${ctx}/qar/qarEvent/form?id="+this.id;
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
	<div id="importExcelBox" class="hide">
		<form id="importExcelForm" action="${ctx}/qar/qarEvent/import/excel" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');"><br/>
			<input id="uploadExcelFile" name="file" type="file" style="width:330px"/><br/><br/>　　
			<input id="btnImportExcelSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
			<a href="${ctx}/qar/qarEvent/import/excel/template">下载模板</a>
		</form>
		<form id="exportExcelForm" action="${ctx}/qar/qarEvent/export/excel" method="post" enctype="multipart/form-data">
		</form>
	</div>
	<ul id="mynav" class="nav nav-tabs">
		<li class="active"><a href="${ctx}/qar/qarEvent/">QAR超限事件poi-ac${fns:getLang('common.list', null)}</a></li>
		<shiro:hasPermission name="qar:qarEvent:edit"><li><a href="${ctx}/qar/qarEvent/form">QAR超限事件poi-ac${fns:getLang('common.add', null)}</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="qarEvent" action="${ctx}/qar/qarEvent/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>FLT_FILENO：</label>
				<form:input id="fltFileno" path="fltFileno" htmlEscape="false" maxlength="7" class="input-medium"/>
			</li>
			<li><label>EVT_STARTTIME：</label>
				<input name="evtStarttime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${qarEvent.evtStarttime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>EVT_PRONO：</label>
				<form:input id="evtProno" path="evtProno" htmlEscape="false" maxlength="4" class="input-medium"/>
			</li>
			<li><label>EVT_CLASS：</label>
				<form:input id="evtClass" path="evtClass" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>EVT_PHASE：</label>
				<form:input id="evtPhase" path="evtPhase" htmlEscape="false" maxlength="3" class="input-medium"/>
			</li>
			<li><label>EVT_FLTDEPARTURE：</label>
				<form:input id="evtFltdeparture" path="evtFltdeparture" htmlEscape="false" maxlength="4" class="input-medium"/>
			</li>
			<li><label>EVT_FLTARRIVAL：</label>
				<form:input id="evtFltarrival" path="evtFltarrival" htmlEscape="false" maxlength="4" class="input-medium" onFocus="inputFocus(this)" onBlur="inputBlur(this)"/>
			</li>
			<li><label>EVT_FLTNO：</label>
				<form:input id="evtFltno" path="evtFltno" htmlEscape="false" maxlength="10" class="input-medium" onFocus="inputFocus(this)" onBlur="inputBlur(this)"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="${fns:getLang('common.query', null)}"/></li>
			<li class="btns"><input id="btnSearchReset" class="btn btn-primary" type="reset" value="${fns:getLang('common.reset', null)}" onclick="searchReset('searchForm');"/></li>
			<shiro:hasPermission name="qar:qarEvent:dba"><li class="btns"><input id="btnTruncateTable" class="btn btn-warning" type="button" value="物理清空" onclick="truncateTable('${ctx}/qar/qarEvent/truncateTable');"/></li></shiro:hasPermission>
			<% // Excel导入导出 %>
			<li><label></label></li>
			<shiro:hasPermission name="qar:qarEvent:io"><li class="btns"><input id="btnExcelExport" class="btn btn-primary" type="button" value="Excel数据导出"/></li></shiro:hasPermission>
			<shiro:hasPermission name="qar:qarEvent:io"><li class="btns"><input id="btnExcelImport" class="btn btn-primary" type="button" value="Excel数据导入"/></li></shiro:hasPermission>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<form:form id="gridForm" modelAttribute="qarEvent" action="${ctx}/qar/qarEvent/deleteChecked" method="post">
		<span id="cbRowDataIdsBox">
			<input name="cbRowDataIds" type="hidden" value=""/>
		</span>
		<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover table-fixed-header">
			<thead class="header">
				<tr>
					<th style="display:none;">ID</th>
					<th class="sort-column flt_fileno" title="${fns:getLang('common.sortable', null)}">FLT_FILENO</th>
					<th class="sort-column evt_starttime" title="${fns:getLang('common.sortable', null)}">EVT_STARTTIME</th>
					<th>EVT_PRONO</th>
					<th class="sort-column evt_class" title="${fns:getLang('common.sortable', null)}">EVT_CLASS</th>
					<th class="sort-column evt_phase" title="${fns:getLang('common.sortable', null)}">EVT_PHASE</th>
					<th>EVT_FLTDEPARTURE</th>
					<th>EVT_FLTARRIVAL</th>
					<th>EVT_FLTNO</th>
					<th>EVT_ACTAIL</th>
					<th>EVT_FLTSTATUS</th>
					<th>EVT_PROTYPE</th>
					<th>EVT_FLTRUNWAYLDG</th>
					<th>EVT_FLTRUNWAYTO</th>
					<th>EVT_VALID</th>
					<th>EVT_LIMIT</th>
					<th>EVT_MAXVAL</th>
					<th>EVT_DURATION</th>
					<th>EVT_TIMETOPEAK</th>
					<th>EVT_AVGGAP</th>
					<th>EVT_FLTIDTERASED</th>
					<th>EVT_ARLCODE</th>
					<th>EVT_NOTE</th>
					<th>EVT_MAIL</th>
					<th>更新时间</th>
					<th>备注信息</th>
					<shiro:hasPermission name="qar:qarEvent:edit"><th>
						${fns:getLang('common.operate', null)}
						<shiro:hasPermission name="qar:qarEvent:dba">
							[<form:checkbox id="physicalDelete" path="physicalDelete" label="物理删除" title="默认逻辑删除，勾选后进行物理删除" />]
						</shiro:hasPermission>
					</th></shiro:hasPermission>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="qarEvent" varStatus="vs">
				<tr id="${qarEvent.id}">
					<td class="row-id" style="display:none;">${qarEvent.id}</td>
					<td><a href="${ctx}/qar/qarEvent/form?id=${qarEvent.id}">
						${qarEvent.fltFileno}
					</a></td>
					<td>
						<fmt:formatDate value="${qarEvent.evtStarttime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						${qarEvent.evtProno}
					</td>
					<td>
						${qarEvent.evtClass}
					</td>
					<td>
						${qarEvent.evtPhase}
					</td>
					<td>
						${qarEvent.evtFltdeparture}
					</td>
					<td>
						${qarEvent.evtFltarrival}
					</td>
					<td>
						${qarEvent.evtFltno}
					</td>
					<td>
						${qarEvent.evtActail}
					</td>
					<td>
						${qarEvent.evtFltstatus}
					</td>
					<td>
						${qarEvent.evtProtype}
					</td>
					<td>
						${qarEvent.evtFltrunwayldg}
					</td>
					<td>
						${qarEvent.evtFltrunwayto}
					</td>
					<td>
						${qarEvent.evtValid}
					</td>
					<td>
						${qarEvent.evtLimit}
					</td>
					<td>
						${qarEvent.evtMaxval}
					</td>
					<td>
						${qarEvent.evtDuration}
					</td>
					<td>
						${qarEvent.evtTimetopeak}
					</td>
					<td>
						${qarEvent.evtAvggap}
					</td>
					<td>
						${qarEvent.evtFltidterased}
					</td>
					<td>
						${qarEvent.evtArlcode}
					</td>
					<td>
						${qarEvent.evtNote}
					</td>
					<td>
						${qarEvent.evtMail}
					</td>
					<td>
						<fmt:formatDate value="${qarEvent.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						${qarEvent.remarks}
					</td>
					<shiro:hasPermission name="qar:qarEvent:edit"><td class="row-operate">
	    				<a href="${ctx}/qar/qarEvent/form?id=${qarEvent.id}">${fns:getLang('common.edit', null)}</a>
						<a href="javascript:void(0)" onclick="rowDelete('${ctx}/qar/qarEvent/delete?id=${qarEvent.id}');">${fns:getLang('common.delete', null)}</a>
					</td></shiro:hasPermission>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</form:form>
	<div class="pagination">${page}</div>
</body>
</html>