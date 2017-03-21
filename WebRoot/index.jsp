<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>index.jsp</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    This is my JSP page. <br>这是一个index
    
    
    <%--<form action="${pageContext.request.contextPath }/admin/insert.action" method="POST">
    	id:<input type="text" name="id"/><br/>
    	name:<input type="text" name="name"/><br/>
    	password:<input type="text" name="password"/><br/>
    	<input type="submit" value="OK"/>
    	
    	info:<br/>
    	${admin.id }<br/>
    	${admin.name }<br/>
    	${admin.password }<br/>
    </form>
  --%>
  <a href="${pageContext.request.contextPath }/user/loginIndex.action"><h1>进入登录页面</h1></a>
  
  </body>
</html>
