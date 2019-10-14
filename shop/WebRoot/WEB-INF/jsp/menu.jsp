<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="span5">
   <div class="logo">
	  <font size=4.5 color="Teal" style="font-weight:bold;font-style:italic;">体育用品销售系统</font>
   </div>
</div>
<div class="span9">
<div class="headerAd">
	<img src="${pageContext.request.contextPath}/image/header.jpg" width="300" height="50" alt="正品保障" title="正品保障"/>
</div>	
</div>
<div class="span10 last">
	<div class="topNav clearfix">
		<ul>
			<s:if test="#session.existUser == null">
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/user_loginPage.action">登录</a>|</li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="${ pageContext.request.contextPath }/user_registPage.action">注册</a>|
			</li>
			</s:if>
			<s:else>
				
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/order_findByUid.action?page=1">我的订单</a>
			|</li>
			
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/order_findByEvalCode.action?evalCode=1&page=1">商品评价</a>
			|</li>
			
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/order_findByUidMemberPoints.action?proname=123&page=1">积分明细</a>
			|</li>
			
			<li><a href="${ pageContext.request.contextPath }/user_show.action">会员中心</a>
			|</li>
			
			<li><a href="${ pageContext.request.contextPath }/user_quit.action">退出</a>
			|</li>
			
			</s:else>
		        <li><a href="${ pageContext.request.contextPath }/info_findAll.action?page=1">网站公告</a>
			</li>
		</ul>
	</div>
	
	<div class="cart">
		<a href="${ pageContext.request.contextPath }/cart_myCart.action">购物车</a>
	</div>
	
	<form action="${ pageContext.request.contextPath }/product_findByPname.action?page=1" method="post">
		<input type="text" name="proname" value="" id="" />
		<input type="submit" value="搜索">
	 </form>
 
</div>
<div class="span24">
	<ul class="mainNav">
		<li><a href="${ pageContext.request.contextPath }/index.action">首页</a> </li>
		<s:iterator var="c" value="#session.cList">
			<li><a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a> </li>
		</s:iterator>
		
		<li>
	
 
	</ul>
</div>