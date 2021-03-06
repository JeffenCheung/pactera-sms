<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>QAR超限事件poi-ac管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/qar/qarEvent/">QAR超限事件poi-ac列表</a></li>
		<li class="active"><a href="${ctx}/qar/qarEvent/form?id=${qarEvent.id}">QAR超限事件poi-ac<shiro:hasPermission name="qar:qarEvent:edit">${not empty qarEvent.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="qar:qarEvent:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="qarEvent" action="${ctx}/qar/qarEvent/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">FLT_FILENO：</label>
			<div class="controls">
				<form:input path="fltFileno" htmlEscape="false" maxlength="7" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_STARTTIME：</label>
			<div class="controls">
				<input name="evtStarttime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${qarEvent.evtStarttime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_PRONO：</label>
			<div class="controls">
				<form:input path="evtProno" htmlEscape="false" maxlength="4" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_CLASS：</label>
			<div class="controls">
				<form:input path="evtClass" htmlEscape="false" maxlength="1" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_PHASE：</label>
			<div class="controls">
				<form:input path="evtPhase" htmlEscape="false" maxlength="3" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_FLTDEPARTURE：</label>
			<div class="controls">
				<form:input path="evtFltdeparture" htmlEscape="false" maxlength="4" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_FLTARRIVAL：</label>
			<div class="controls">
				<form:input path="evtFltarrival" htmlEscape="false" maxlength="4" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_FLTNO：</label>
			<div class="controls">
				<form:input path="evtFltno" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_ACTAIL：</label>
			<div class="controls">
				<form:input path="evtActail" htmlEscape="false" maxlength="6" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_FLTSTATUS：</label>
			<div class="controls">
				<form:input path="evtFltstatus" htmlEscape="false" maxlength="1" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_PROTYPE：</label>
			<div class="controls">
				<form:input path="evtProtype" htmlEscape="false" maxlength="1" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_FLTRUNWAYLDG：</label>
			<div class="controls">
				<form:input path="evtFltrunwayldg" htmlEscape="false" maxlength="3" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_FLTRUNWAYTO：</label>
			<div class="controls">
				<form:input path="evtFltrunwayto" htmlEscape="false" maxlength="3" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_VALID：</label>
			<div class="controls">
				<form:input path="evtValid" htmlEscape="false" maxlength="1" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_LIMIT：</label>
			<div class="controls">
				<form:input path="evtLimit" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_MAXVAL：</label>
			<div class="controls">
				<form:input path="evtMaxval" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_DURATION：</label>
			<div class="controls">
				<form:input path="evtDuration" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_TIMETOPEAK：</label>
			<div class="controls">
				<form:input path="evtTimetopeak" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_AVGGAP：</label>
			<div class="controls">
				<form:input path="evtAvggap" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_FLTIDTERASED：</label>
			<div class="controls">
				<form:input path="evtFltidterased" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_ARLCODE：</label>
			<div class="controls">
				<form:input path="evtArlcode" htmlEscape="false" maxlength="2" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_NOTE：</label>
			<div class="controls">
				<form:input path="evtNote" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">EVT_MAIL：</label>
			<div class="controls">
				<form:input path="evtMail" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="qar:qarEvent:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>