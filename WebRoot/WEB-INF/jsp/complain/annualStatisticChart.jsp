<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/common.jspf" %>

<!DOCTYPE HTML>
<html>
  <head>
    <title>年度投诉统计图</title>
  </head>
  
  <body>
  	<br>
    <s:select id="year" list="{2015}" onchange="doAnnualStatistic()"></s:select>
    <select>
    
    </select>
    <br>
    <div id="chartContainer"></div>
  </body>
</html>
