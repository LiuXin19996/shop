<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>购物车</title>

<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet" type="text/css"/>


</head>
<body>
<div class="container header">
	
	
	<%@ include file="menu.jsp" %>
	
</div>	
<div class="container cart">
		<s:if test="#session.cart.cartItems.size() != 0">
		<div class="span24">
			<div class="step step1">
				<strong>购物车信息</strong>
			</div>
				<table>
					<tbody>
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
						<s:iterator var="cartItem" value="#session.cart.cartItems">
						<tr>
					
							<td width="60">
							<a  href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#cartItem.product.pid"/>" target="_blank">
								<img src="${pageContext.request.contextPath}/<s:property value="#cartItem.product.image"/>"></a>
							</td>
							<td>
								<a  href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#cartItem.product.pid"/>" target="_blank"><s:property value="#cartItem.product.pname"/></a>
							</td>
						
							<td>
								￥<s:property value="#cartItem.product.shop_price"/>
							</td>
							<td>
								<s:property value="#cartItem.color"/>
							</td>
							<td>
								<s:property value="#cartItem.size"/>
							</td>
							
							<td class="quantity" width="60">
								<s:property value="#cartItem.count"/>
							</td>
							<td width="140">
								<span class="subtotal">￥<s:property value="#cartItem.subtotal"/></span>
							</td>
							<td>
								<a href="${ pageContext.request.contextPath }/cart_removeCart.action?pid=<s:property value="#cartItem.product.pid"/>" class="delete">删除</a>
							</td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
							<em>
								登录后确认是否享有优惠
							</em>
					赠送积分: <em id="effectivePoint"><s:property value="#session.cart.total"/></em>
					商品金额: <strong id="effectivePrice">￥<s:property value="#session.cart.total"/>元</strong>
				</div>
				<div class="bottom">
					<a href="${ pageContext.request.contextPath }/cart_clearCart.action" id="clear" class="clear">清空购物车</a>
					<a href="${ pageContext.request.contextPath }/order_saveOrder.action" id="submit" class="submit">提交订单</a>
				</div>
				
		</div>
		</s:if>
		<s:else>
			<div class="span24">
				<div class="step step1">
					<span><h2>亲!您还没有购物!请先去购物!</h2></span>
				</div>
			</div>
		</s:else>
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
</body></html>
