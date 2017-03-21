<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/common.jspf" %>
<html>
<head>
    <title>信息发布管理</title>
    <script type="text/javascript" src="${basePath}js/CRUD.js"></script>
    <script type="text/javascript">
	  	function ajaxReverseState(iId) {
			var iState = false;
			var iStateText = $("#iState"+iId).text();
			if(iStateText=="停用") {
				iState = true;
			}
			$.ajax({
				url : "${basePath}info/ajaxReverseState.action",
				type : "POST",
				data:{
					"iId":iId,
					"iState":iState,
					"dataType":"JSON",
				},
				success:function(data) {
					$("#iState"+iId).text(data);
					var data2 = "停用"; 
					if(data=='停用') {
						data2 = "发布";
					}
					$("#iState"+iId+"Show").text(data2);
				},
				error:function(textStatus,errorThrown) {
					alert(errorThrown);
				}
			});
		}
    </script>
</head>
<body class="rightBody">
<form name="form1" action="" method="POST">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>信息发布管理</strong></div> </div>
                <div class="search_art">
                    <li>
                        信息标题：<input type="text" name="iTitle" class="s_text" id="key" value="" style="width:160px;"/>
                    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="doList('search')"/></li>
                    <li style="float:right;">
                        <input type="button" value="刷新" class="s_button" onclick="doRefresh()"/>&nbsp;
                        <input type="button" value="新增" class="s_button" onclick="doAdd()"/>&nbsp;
                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll('deletedInfo')"/>&nbsp;
                    </li>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0">
                        <tr class="t_tit">
                            <td width="30" align="center"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td align="center" width="20">编号</td>
                            <td align="center">信息标题</td>
                            <td width="120" align="center">信息分类</td>
                            <td width="120" align="center">创建人</td>
                            <td width="140" align="center">创建时间</td>
                            <td width="80" align="center">状态</td>
                            <td width="120" align="center">操作</td>
                        </tr>
                        <c:forEach items="${sessionScope.page.pageData }" var="info" varStatus="vs">
                        	<tr>
                        	 <td align="center"><input type="checkbox" name="selectedRow" id="selectedRow" value="${info.iId }"/></td>
	                        	<td align="center">${vs.count+sessionScope.page.startIndex }</td>
	                        	<td align="center">${info.iTitle }</td>
	                        	<td align="center">
	                        		<c:forEach items="${types }" var="type">
	                        			<c:if test="${type.key==info.iType }">
	                        				${type.value }
	                        			</c:if>
	                        		</c:forEach>
	                        	</td>
	                        	<td align="center">${info.iCreator }</td>
	                        	<td align="center"><fmt:formatDate value="${info.iCreatetime }" dateStyle="default" type="BOTH" /></td>
	                        	<td align="center"><label id="iState${info.iId }Show">${info.iState?'发布':'停用' }</label></td>
	                        	
	                        	   <td align="center">
                                	<a href="javascript:ajaxReverseState('${info.iId }')" id="iState${info.iId }">${info.iState?'停用':'发布' }</a>
                                	</span>
                                    <a href="javascript:doEdit('iId','${info.iId }')">编辑</a>
                                    <a href="javascript:doDelete('iId','${info.iId }')">删除</a>
                                </td>
                        	</tr>
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
                            
                   	<a id="firstPage" href="javascript:doList('home','info')">首页</a>&nbsp;&nbsp;
                    <a id="prePage" href="javascript:doList('previous','info')">上一页</a>&nbsp;&nbsp;
                    
                    <a id="nextPage" href="javascript:doList('next','info')">下一页</a>&nbsp;&nbsp;
                    
                   	<a id="firstPage" href="javascript:doList('end','info')">尾页</a>&nbsp;&nbsp;
                    
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