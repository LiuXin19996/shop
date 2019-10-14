<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
		<script type="text/javascript">
			function addProduct(){
				window.location.href = "${pageContext.request.contextPath}/adminProduct_addPage.action";
			}
		</script>
	</HEAD>
	<body>
		<br>
	    <form action="${ pageContext.request.contextPath }/adminProduct_findByPname.action?page=1" method="post">
		     <input type="text" name="proname" value="" id="" />
		     <input type="submit" value="搜索">
	    </form>
		<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/product/list.jsp" method="post">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>商品列表</strong>
						</TD>
					</tr>
					<tr>
					  <td align="right">          
					     <input class="btn" id="submit" value="添加" type="button" style="margin-left:800px" onclick="addProduct()">
                      </td>
					</tr>
				
	 
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="4%">
										序号
									</td>
									<td align="center" width="10%">
										商品图片
									</td>
									<td align="center" width="10%">
										商品名称
									</td>
									<td align="center" width="4%">
										商品价格
									</td>
									<td align="center" width="4%">
										是否热门
									</td>
									<td width="4%" align="center">
										编辑
									</td>
									<td width="4%" align="center">
										删除
									</td>
								</tr>
									<s:iterator var="p" value="pageBean.list" status="status">
										<tr onmouseover="this.style.backgroundColor = 'white'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="4%">
												<s:property value="#status.count"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												<img width="60" height="65" src="${ pageContext.request.contextPath }/<s:property value="#p.image"/>">
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												<s:property value="#p.pname"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="4%">
												<s:property value="#p.shop_price"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="4%">
												<s:if test="#p.is_hot==1">
													是
												</s:if>
												<s:else>
													否
												</s:else>
											</td>
											<td align="center" style="HEIGHT: 22px">
												<a href="${ pageContext.request.contextPath }/adminProduct_edit.action?pid=<s:property value="#p.pid"/>">
													<img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0" style="CURSOR: hand">
												</a>
											</td>
									
											<td align="center" style="HEIGHT: 22px">
												<a href="${ pageContext.request.contextPath }/adminProduct_delete.action?pid=<s:property value="#p.pid"/>">
													<img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
												</a>
											</td>
										</tr>
									</s:iterator>	
							</table>
						</td>
					</tr>
					
				</TBODY>
			</table>
			
			<div class="pagination"  align="center">
				<span>第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页 </span>
				<s:if test=" proname =='123'.toString() ">
				     <s:if test="pageBean.page != 1">
					 <a href="${ pageContext.request.contextPath }/adminProduct_findAll.action?page=1">首页</a>|
					 <a href="${ pageContext.request.contextPath }/adminProduct_findAll.action?page=<s:property value="pageBean.page-1"/>">上一页</a>|
			    </s:if>
				<s:iterator var="i" begin="1" end="pageBean.totalPage">
				<s:if test="pageBean.page != #i">
					<a href="${ pageContext.request.contextPath }/adminProduct_findAll.action?page=<s:property value="#i"/>"><s:property value="#i"/></a>
				</s:if>
				<s:else>
					<span class="currentPage"><s:property value="#i"/></span>
				</s:else>
			  </s:iterator>			
			 <s:if test="pageBean.page != pageBean.totalPage">
				<a href="${ pageContext.request.contextPath }/adminProduct_findAll.action?page=<s:property value="pageBean.page+1"/>">下一页</a>|
				<a href="${ pageContext.request.contextPath }/adminProduct_findAll.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>|
			 </s:if>
			 </s:if>
						   
			<s:if test=" proname !='123'.toString() ">
				<s:if test="pageBean.page != 1">
				<a href="${ pageContext.request.contextPath }/adminProduct_findByPname.action?proname=<s:property value="proname"/>&page=1">首页</a>|
				<a href="${ pageContext.request.contextPath }/adminProduct_findByPname.action?proname=<s:property value="proname"/>&page=<s:property value="pageBean.page-1"/>">上一页</a>|
				</s:if> 
			    <s:iterator var="i" begin="1" end="pageBean.totalPage">
				<s:if test="pageBean.page != #i">
					<a href="${ pageContext.request.contextPath }/adminProduct_findByPname.action?proname=<s:property value="proname"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a>
				</s:if>
				<s:else>
					<span class="currentPage"><s:property value="#i"/></span>
				</s:else>
			   </s:iterator>
				<s:if test="pageBean.page != pageBean.totalPage">
					<a href="${ pageContext.request.contextPath }/adminProduct_findByPname.action?proname=<s:property value="proname"/>&page=<s:property value="pageBean.page+1"/>">下一页</a>|
					 <a href="${ pageContext.request.contextPath }/adminProduct_findByPname.action?proname=<s:property value="proname"/>&page=<s:property value="pageBean.totalPage"/>">尾页</a>|
				 </s:if>
				</s:if>
		        <a href="${ pageContext.request.contextPath }/adminProduct_findAll.action?proname=123&page=1">全部商品</a>
			</div>
		</form>
	</body>
</HTML>

