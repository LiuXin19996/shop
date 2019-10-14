<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta charset="utf-8">
   <title>商品评价</title> 
   <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
   <link href="${pageContext.request.contextPath}/css/cart.css"  rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/css/product.css"  rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="container header">
		

		<%@ include file="menu.jsp"%>

	</div>
	
   <div class="container cart">
   
           <ul style="float:right;">
           	<li style="display:inline;"><a href="${ pageContext.request.contextPath }/order_findByEvalCode.action?evalCode=1&page=1">已评价商品&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
           	<li style="display:inline;"><a href="${ pageContext.request.contextPath }/order_findByEvalCode.action?evalCode=2&page=1">待评价商品</a></li>
           </ul>
	       
	       	<s:if test="evalCode==1">				
			     <strong sytle="float:left">已评价商品列表</strong> 
			</s:if>
			<s:elseif test="evalCode==2">			
				 <strong sytle="float:left">待评价商品列表</strong> 
			</s:elseif>
	       
	        
	 
            <table>
            	<tbody>
					<s:iterator var="orderItem" value="pageBean.list">
						<tr>
							<th colspan="8">订单编号:<s:property value="#orderItem.order.oid" />&nbsp;&nbsp;&nbsp;&nbsp;订单金额:<font
								color="red"><s:property value="#orderItem.subtotal" />
							</font>
							&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">
								交易成功
							</font>
							</th>
							
						</tr>
						<tr>
							<th>图片</th>
							<th>商品</th>
							<th>价格</th>
							<th>颜色</th>
						<th>尺寸</th>
							<th>数量</th>
							<th>小计</th>
							<th>操作</th>
						</tr>
						 
							<tr>
								<td width="60">
								<a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#orderItem.product.pid"/>"><img
									src="${ pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>" />
									</a>
								</td>
								<td>
								<a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#orderItem.product.pid"/>">
								<s:property value="#orderItem.product.pname" />
								</a>
								</td>
								<td><s:property value="#orderItem.product.shop_price" /></td>
								<td>
								<s:property value="#orderItem.color"/>
							</td>
							<td>
								<s:property value="#orderItem.size"/>
							</td>
								
								<td class="quantity" width="60"><s:property
										value="#orderItem.count" /></td>
								<td width="140"><span class="subtotal">￥<s:property
											value="#orderItem.subtotal" />
								</span></td>
								<s:if test="evalCode==1">
								
								<td>
								<a href="${ pageContext.request.contextPath }/product_showComments.action?statusCode=2&proId=<s:property value="#orderItem.product.pid"/>&evalCode=1&page=1">查看评价</a></td>
								
								</s:if>
								<s:elseif test="evalCode==2">
								
								<td><a href="${ pageContext.request.contextPath }/order_evalGoods.action?ordItId=<s:property value="#orderItem.itemid" />&evalCode=1&page=1">去评价</a></td>
								</s:elseif>

								
							 
							</tr>
						 
					</s:iterator>
					
            	</tbody>
            	
            </table>
            
      <div class="pagination">
       <s:if test="evalCode==1">
       <span>第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/> 页</span>
	   <s:if test="pageBean.page != 1">
		    <a href="${ pageContext.request.contextPath }/order_findByEvalCode.action?evalCode=1&page=1" class="firstPage">&nbsp;</a>
			<a href="${ pageContext.request.contextPath }/order_findByEvalCode.action?evalCode=1&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>
	   </s:if>
			
		<s:iterator var="i" begin="1" end="pageBean.totalPage">
			<s:if test="pageBean.page != #i">
				<a href="${ pageContext.request.contextPath }/order_findByEvalCode.action?evalCode=1&page=<s:property value="#i"/>"><s:property value="#i"/></a>
			</s:if>
			<s:else>
				<span class="currentPage"><s:property value="#i"/></span>
			</s:else>
		</s:iterator>
			
		<s:if test="pageBean.page != pageBean.totalPage">	
			<a class="nextPage" href="${ pageContext.request.contextPath }/order_findByEvalCode.action?evalCode=1&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
			<a class="lastPage" href="${ pageContext.request.contextPath }/order_findByEvalCode.action?evalCode=1&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
		</s:if>
	
	  </s:if>
	  <s:elseif test="evalCode==2">
	   <span>第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/> 页</span>
	   <s:if test="pageBean.page != 1">
		    <a href="${ pageContext.request.contextPath }/order_findByEvalCode.action?evalCode=2&page=1" class="firstPage">&nbsp;</a>
			<a href="${ pageContext.request.contextPath }/order_findByEvalCode.action?evalCode=2&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>
	   </s:if>
			
		<s:iterator var="i" begin="1" end="pageBean.totalPage">
			<s:if test="pageBean.page != #i">
				<a href="${ pageContext.request.contextPath }/order_findByEvalCode.action?evalCode=2&page=<s:property value="#i"/>"><s:property value="#i"/></a>
			</s:if>
			<s:else>
				<span class="currentPage"><s:property value="#i"/></span>
			</s:else>
		</s:iterator>
			
		<s:if test="pageBean.page != pageBean.totalPage">	
			<a class="nextPage" href="${ pageContext.request.contextPath }/order_findByEvalCode.action?evalCode=2&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
			<a class="lastPage" href="${ pageContext.request.contextPath }/order_findByEvalCode.action?evalCode=2&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
		</s:if>
	  
	  
	  </s:elseif>
	</div>
		 

	</div>
	

	
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