<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta charset="utf-8">
   <title>商品评价</title> 
   <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="container header">
		

		<%@ include file="menu.jsp"%>

	</div>
	
 
	
<div class="container comments">

  <form action ="${ pageContext.request.contextPath }/order_saveComments.action">
     <input type="hidden"  name="evalCode"  value=<s:property  value="evalCode"/>  ><br>
     <input type="hidden"  name="page"  value=<s:property  value="page"/>  ><br>
     <input type="hidden"  name="ordItId"  value=<s:property  value="ordItId"/>  ><br>
     <label>分享你的个购买心得</label><br>
     <textarea rows="10" cols="30"   name="comments"></textarea><br>
     <input type="submit" value="提交评论">
  </form>
	
	 
	 
	
</div>
	
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
			<img src="image\r___________renleipic_01/footer.jpg" alt="我们的优势"
					title="我们的优势" height="52" width="950">
		</div>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2019 网上商城 版权所有</div>
	</div>
</div>
</body>
</html>