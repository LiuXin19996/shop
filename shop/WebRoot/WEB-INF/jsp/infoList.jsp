<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>网站公告</title>

<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet" type="text/css"/>
 


</head>
<body>
<div class="container header">
	
	<%@ include file="menu.jsp" %>
	
</div>	
<div class="container cart">

	<div id="content" class="Sub">
	 <div class="NewContainer771">
	   <div class="BoxHeader">
		  <div class="BoxHeader-center MarginTop10">网站公告</div>
		</div>
		
		<div class="Slot" style="height: 100%">
		  <table width="100%" cellpadding="0" cellspacing="0" border="0">
			 <s:iterator var="infomation" value="pageBean.list">
				     <tr>
				       <td height="28" id="roll-line-1607838439" width="100%">
				       <div class="" style="padding:2px 0px;">
				       <div class="f-left">
				       <img src="${pageContext.request.contextPath}/img/head-mark3.gif" style="width:5px;height:10px;" /> 
				       <a href="${pageContext.request.contextPath}/info_infoDetails.action?info_id=<s:property value="#infomation.info_id"/>" title="">
				       <span style=""><s:property value="#infomation.title"/></span>
				       </a>
				       </div>
				       <div class="clear">
				       </div>
				       </div>
				       </td>
				      </tr>
		    </s:iterator>
		 </table>
		</div>
	  </div>
	</div>
 
 
</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="${pageContext.request.contextPath}/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
</div>	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2019 网上商城 版权所有</div>
	</div>
</div>
</body>
</html>
