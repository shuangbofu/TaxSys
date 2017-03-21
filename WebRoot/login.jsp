<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>login.jsp</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body><%--
    <form action="${pageContext.request.contextPath }/admin/login.action" method="POST">
    <fieldset style="margin-left: 400px;width:80px;">
    <legend>login</legend>
    <div id="tip" style="color: red">${msg }</div>
    <label style="margin-top:20px">name:</label><div><input type="text" name="name"/></div>
    <label>password:</label><div><input type="text" name="password"/></div>
    <div style="margin-left:120px;margin-top:20px"><input type="submit" value="login"/></div>
    </fieldset>
    </form>
    	--%><sf:form commandName="admin" action="${pageContext.request.contextPath }/admin/login.action" method="POST">
		    <fieldset style="margin-left: 400px;width:80px;">
		    <legend>login</legend>
		    <div id="tip" style="color: red">${msg }</div>
		    <label style="margin-top:20px">name:</label><div><sf:input cssErrorClass="errorBox" path="name" id="name"/></div>
		    <label>password:</label><div><sf:password path="password" id="password"/></div>
		    <div style="margin-left:120px;margin-top:20px"><input type="submit" value="login"/></div>
		    </fieldset>
    	</sf:form>
    	
    
  </body>
</html>
