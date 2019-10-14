<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/css/left.css" rel="stylesheet" type="text/css"/>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
</head>
<body>
<table width="100" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td>
<div class="dtree">

	<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
	<script type="text/javascript">
		<!--
		d = new dTree('d');
		d.add('01',-1,'后台管理');
		
		d.add('0101','01','用户管理','','','mainFrame');
		d.add('010101','0101','会员用户管理','${pageContext.request.contextPath}/userAdmin_findAll.action?page=1','','mainFrame');
	    d.add('010102','0101','会员用户积分管理','${pageContext.request.contextPath}/userAdmin_findAllMemberPoints.action?page=1','','mainFrame');
		d.add('010103','0101','管理员用户管理','${pageContext.request.contextPath}/adminUser_findAll.action?page=1','','mainFrame');
		
		
		d.add('0102','01','分类管理','','','mainFrame');
		d.add('010201','0102','一级分类管理','${pageContext.request.contextPath}/adminCategory_findAll.action','','mainFrame');
		d.add('010202','0102','二级分类管理','${pageContext.request.contextPath}/adminCategorySecond_findAll.action?page=1','','mainFrame');
		
		d.add('0103','01','商品管理');
		d.add('010301','0103','商品管理','${pageContext.request.contextPath}/adminProduct_findAll.action?page=1','','mainFrame');
		d.add('010302','0103','商品访问排名','${pageContext.request.contextPath}/adminProduct_findAllByVisits.action?page=1','','mainFrame');
		d.add('010303','0103','商品销售排名','${pageContext.request.contextPath}/adminProduct_findAllBySales.action?page=1','','mainFrame');
		
		
		d.add('0104','01','订单管理');
		d.add('010401','0104','订单管理','${pageContext.request.contextPath}/adminOrder_findAll.action?page=1','','mainFrame');
		
		d.add('0105','01','信息管理');
		d.add('010501','0105','公告管理','${pageContext.request.contextPath}/adminInfo_findAll.action?adminName=<s:property value="#session.existAdminUser.username"/>&page=1','','mainFrame');
		
		document.write(d);
		//-->
	</script>
</div>	</td>
  </tr>
</table>
</body>
</html>
