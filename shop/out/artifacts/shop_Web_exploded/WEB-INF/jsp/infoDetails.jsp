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
		      <tr>
		      <td height="28" id="roll-line-1607838439" width="100%">
	              <div style="font-size:25px; line-height:30px; color:#358100; text-align:center; padding:20px 0; font-weight:bolder">
	               <s:property value="infoma.title"/>
	               </div>
	              
				    <div style="border-top:1px solid #B4E190; padding:20px;font-size:14px;">
				      <s:property value="infoma.content" escape="false"/>
				    </div>
				    
				    <div style="text-align:right">
							 <s:property value="infoma.pub_time"/>&nbsp;&nbsp;&nbsp; 
					</div>
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
