<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>会员信息修改</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet" type="text/css"/>
<script>
	function checkForm(){
		// 校验用户名:
		// 获得用户名文本框的值:
		var username = document.getElementById("username").value;
		if(username == null || username == ''){
			alert("用户名不能为空!");
			return false;
		}
		// 校验密码:
		// 获得密码框的值:
		var password = document.getElementById("password").value;
		if(password == null || password == ''){
			alert("密码不能为空!");
			return false;
		}
		
	   if(password !=null && password !=''){
		if(password.length <5){
		    alert("密码不能少于5位！");
			return false;
		   }
		}
		
		// 校验确认密码:
		var repassword = document.getElementById("repassword").value;
		if(repassword != password){
			alert("两次密码输入不一致!");
			return false;
		}
	}
	
	
	function checkUsername(){
		// 获得文件框值:
		var username = document.getElementById("username").value;
		// 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					document.getElementById("span1").innerHTML = xhr.responseText;
				}
			}
		}
		// 3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/user_findByName.action?time="+new Date().getTime()+"&username="+username,true);
		// 4.发送
		xhr.send(null);
	}
	
	function createXmlHttp(){
		   var xmlHttp;
		   try{ // Firefox, Opera 8.0+, Safari
		        xmlHttp=new XMLHttpRequest();
		    }
		    catch (e){
			   try{// Internet Explorer
			         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			      }
			    catch (e){
			      try{
			         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			      }
			      catch (e){}
			      }
		    }

			return xmlHttp;
		 }
	
</script>
</head>
<body>
<div class="container header">
	
	
	<%@ include file="menu.jsp" %>

</div>	

<div class="container register">
		<div class="span24">
			<div class="wrap">
				<div class="main clearfix">
					<div class="title">
						<strong>会员个人信息</strong>USER INFO
					</div>
					<div>
						<s:actionerror />
					</div>
					<form id="updateInfoForm" action="${ pageContext.request.contextPath }/user_updateInfo.action?usid=<s:property value="#session.existUser.uid"/>"  method="post" novalidate="novalidate" onsubmit="return checkForm();">
						<input type="hidden" name="uid" value="<s:property value="#session.existUser.uid"/>"/>
						<table>
							<tbody>
							
							<tr>
								<th>
									<span class="requiredField">*</span>用户名:
								</th>
								<td>
									<input type="text" id="username" value="<s:property value="#session.existUser.username"/>" name="username" class="text" maxlength="20" onblur="checkUsername()"/>
									<span id="span1"></span>
								</td>
								
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>密&nbsp;&nbsp;码:
								</th>
								<td>
									<input type="password"  id="password" value="<s:property value="#session.existUser.password"/>" name="password"  class="text" maxlength="20" autocomplete="off"/>
									<span><s:fielderror fieldName="password"/></span>
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>确认密码:
								</th>
								<td>
									<input id="repassword" type="password"  value="<s:property value="#session.existUser.password"/>" name="repassword" class="text" maxlength="20" autocomplete="off"/>
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>真实姓名:
								</th>
								<td>
									<input type="text" value="<s:property value="#session.existUser.name"/>" id="name" name="name" class="text" maxlength="200">
									<span><s:fielderror fieldName="name"/></span>
								</td>
							</tr>
							
							<tr>
								<th>
									<span class="requiredField">*</span>E-mail:
								</th>
								<td>
									<input type="text" value="<s:property value="#session.existUser.email"/>" id="email" name="email" class="text" maxlength="200">
									<span><s:fielderror fieldName="email"/></span>
								</td>
							</tr>
									
									<tr>
										<th>
											电话:
										</th>
										<td>
												<input type="text" value="<s:property value="#session.existUser.phone"/>" name="phone" class="text" />
										</td>
									</tr>
									
									<tr>
										<th>
											地址:
										</th>
										<td>
												<input type="text" name="addr" class="text" value="<s:property value="#session.existUser.addr"/>" maxlength="200"/>
												<span><s:fielderror fieldName="addr"/></span>
										</td>
									</tr>
									
								   <tr>
								      	<th>&nbsp;
									
								       </th>
	 
								      <td>
								      <input  type="submit" class="submit" value="修改">	
								     
								     </td>		 
								   </tr>
			 
						</tbody>
						
						 
			
			</table>
	  </form>				 
 
     </div>
   </div>
  </div>
 </div>
 
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
		   <img src="${pageContext.request.contextPath}/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
       </div>	
    </div>
	<div class="span24">
		<div class="copyright">Copyright © 2019 网上商城 版权所有</div>
	</div>
</div>

<div id="_my97DP" style="position: absolute; top: -1970px; left: -1970px;"><iframe style="width: 190px; height: 191px;" src="./会员注册 - Powered By Mango Team_files/My97DatePicker.htm" frameborder="0" border="0" scrolling="no"></iframe>
</div>
</body>
</html>