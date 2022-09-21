<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="http://localhost:8080${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>基于 Spring Boot 的通讯录管理系统</title>
		
		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"></script> 
    <script src="https://cdn.bootcss.com/proj4js/2.4.3/proj4.js"></script>
    <script src="https://cdn.bootcss.com/proj4leaflet/1.0.1/proj4leaflet.min.js"></script>
	<script type="text/javascript" src="${contextPath}/static/ext/examples/shared/tileLayer.baidu.js"></script>	
		
		<link rel="stylesheet" type="text/css" href="${contextPath}/static/ext/examples/portal/portal.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/static/ext/examples/shared/example.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/static/css/forestry-style.css"  />
	   <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=C09c918bbe0b24d988da51a15644d98a"></script>	 
	    <script type="text/javascript" src="${contextPath}/static/ext/examples/shared/include-ext.js"></script>
	    <script type="text/javascript" src="${contextPath}/static/ext/locale/ext-lang-zh_CN.js"></script>
	    <script type="text/javascript" src="${contextPath}/static/ext/examples/shared/options-toolbar.js"></script>
	    <script type="text/javascript" src="${contextPath}/static/ext/examples/shared/examples.js"></script>
	    <script type="text/javascript">
	  		var userName = '${SESSION_SYS_USER.userName}';
	  		var globalRoleId = '${SESSION_SYS_USER.role}';
	    	var appBaseUri = '${contextPath}';
	    	var appName = '基于 Spring Boot 的通讯录管理系统';
	        Ext.Loader.setPath('Ext.app', '${contextPath}/static/ext/examples/portal/classes');
	        Ext.Loader.setPath('Ext.ux', '${contextPath}/static/ext/examples/ux');
	        Ext.Loader.setPath('Forestry.app', '${contextPath}/static/ext/examples/portal');
	    </script>
	    <script type="text/javascript" src="${contextPath}/static/ext/examples/portal/portal.js"></script>
	    <script type="text/javascript">
	    var selectedDepartmentIdInMap=5;//默认区域参数departmentId
	    function showDepartmentTenant(departmentId,departmentName) {
	    	//alert(Ext.getCmp("forestryTenantInMapHome").items.items[2].title);
	    	Ext.getCmp("forestryTenantInMapHome").items.items[2].setTitle(departmentName+"通讯录情况明细")
	        var store=Ext.getCmp("forestryTenantInMapStoreId").getStore()
	        var params={
					start : '0',
					limit : '100000000',
					departmentId:departmentId
				}
	        Ext.apply(store.proxy.extraParams, params);//重新设置地图图标对应对区域参数departmentId
	        store.reload();
	    }

	        Ext.require([
	            'Ext.layout.container.*',
	            'Ext.resizer.Splitter',
	            'Ext.fx.target.Element',
	            'Ext.fx.target.Component',
	            'Ext.window.Window',
	            'Ext.app.Portlet',
	            'Ext.app.PortalColumn',
	            'Ext.app.PortalPanel',
	            'Ext.app.Portlet',
	            'Ext.app.PortalDropZone'
	        ]);
	     	// alert("<spring:message code='g_operateFailure' />");
	    </script>
	<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"59444",secure:"59453"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
	<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-0" data-genuitec-path="/ZwzTelSystem/WebContent/WEB-INF/page/back/main.jsp">
		<span id="app-msg" style="display:none;" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-0" data-genuitec-path="/ZwzTelSystem/WebContent/WEB-INF/page/back/main.jsp"></span>
	    <form id="history-form" class="x-hide-display">
	        <input type="hidden" id="x-history-field" />
	        <iframe id="x-history-frame"></iframe>
	    </form>
	</body>
</html>
