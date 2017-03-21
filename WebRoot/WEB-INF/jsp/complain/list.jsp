<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/common.jspf" %>
<html>

<script type="text/javascript" src="${basePath}js/CRUD.js"></script>
<script type="text/javascript">
	function doDeal(cId) {
		document.forms[0].action = "${basePath}complain/deal.action?cId="+cId;
		document.forms[0].submit();
	}
	function doAnnualStatistic() {
		document.forms[0].action = "${basePath}complain/statistic.action";
		document.forms[0].submit();
	}
	$(function(){
		$("#cState option[value='${page.keyEntity.cState}']").attr("selected","selected");
	})
</script>
<head>
    <title>投诉受理管理</title>
    
</head>
<body class="rightBody">
<form name="form1" action="" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>投诉受理管理</strong></div> </div>
                <div class="search_art">
                    <li>
                       	投诉标题：<input type="text" name="cTitle" id="cTitle"  value="${page.keyEntity.cTitle }" class="s_text"  style="width:160px;"/>
                    </li>
                    <li>
                       	投诉时间：<input type="text" id="startTime" name="startTime" css="s_text" style="width:160px;"/>
                              - 
                             <input type="text" id="endTime" name="endTime" css="s_text" style="width:160px;"/>
                    </li>
                    <li>
                       	状态：<select name="cState" id="cState">
                       	<c:forEach items="${states }" var="state">
                       		<option value="${state.key }">${state.value }</option>
                       	</c:forEach>
                       	
                       	</select>
                    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="doList('search')"/></li>
                    <li style="float:right;">
                    	<input type="button" value="统计" class="s_button" onclick="doAnnualStatistic()"/>&nbsp;
                    </li>

                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0">
                        <tr class="t_tit">
                            <td align="center">编号</td>
                            <td align="center">投诉标题</td>
                            <td width="120" align="center">被投诉部门</td>
                            <td width="120" align="center">被投诉人</td>
                            <td width="140" align="center">投诉时间</td>
                            <td width="100" align="center">受理状态</td>
                            <td width="100" align="center">操作</td>
                        </tr>
                          	<c:forEach items="${sessionScope.page.pageData }" varStatus="vs" var="complain">
                          		<tr bgcolor="f8f8f8">
                           		<td>&nbsp;${vs.count+sessionScope.page.startIndex }&nbsp;</td>
                           		<td>&nbsp;${complain.cTitle }&nbsp;</td>
                           		<td>&nbsp;${complain.cTodept.dName }&nbsp;</td>
                           		<td>&nbsp;${complain.cToname }&nbsp;</td>
                           		<td>&nbsp;<fmt:formatDate value="${complain.cTime }" type="BOTH" dateStyle="default" />&nbsp;</td>
                           		<td>&nbsp;
                           		<c:forEach items="${states }" var="state" varStatus="vs">
	                           		<c:if test="${state.key==complain.cState }">
	                           			${state.value } 
	                           		</c:if>
                           		</c:forEach>
                           		<c:if test="${complain.cState!='0' }">
	                           		(共${complain.cReplyCount }条回复)
	                           	</c:if>
                           		&nbsp;</td>
	                            <td align="center">
	                                <a href="javascript:doDeal('${complain.cId }')">受理</a>
	                            </td>
                          	</c:forEach>
                    </table>
                </div>
            </div>

        <div class="c_pate" style="margin-top: 5px;">
        <div id="tip" style="margin-left: 380px;color: red;">${tip }</div>
		<table width="100%" class="pageDown" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td align="right">
                 	总共
                 	${sessionScope.page.totalRecordsCount }条记录，当前第
                 	
                 	 ${sessionScope.page.currentPage }页，
                 	 
                 	 共${sessionScope.page.pageCount }页 &nbsp;&nbsp;
                            
                   	<a id="firstPage" href="javascript:doList('home')">首页</a>&nbsp;&nbsp;
                    <a id="prePage" href="javascript:doList('previous')">上一页</a>&nbsp;&nbsp;
                    
                    <a id="nextPage" href="javascript:doList('next')">下一页</a>&nbsp;&nbsp;
                    
                   	<a id="firstPage" href="javascript:doList('end')">尾页</a>&nbsp;&nbsp;
                    
					转到第&nbsp;<input id="currText" type="text" style="width: 30px;" onkeypress="if(event.keyCode == 13){doGoPage(this.value);}" min="1"
					max="${sessionScope.page.pageCount }" value="${sessionScope.page.currentPage }" />页 &nbsp;&nbsp;
			    </td>
			</tr>
		</table>	
        </div>

        </div>
    </div>
</form>

</body>
</html>