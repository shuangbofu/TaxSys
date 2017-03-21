<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/common/common.jspf" %>
<html>
<head>
    <title>角色管理</title>
    <script type="text/javascript" src="${basePath}js/CRUD.js"></script>
    <script type="text/javascript">
    
	function ajaxReverseEffect(rId) {
		var rState = false;
		var rStateText = $("#rState"+rId).text();
		if(rStateText=="有效") {
			rState = true;
		}
		$.ajax({
			url : "${basePath}role/ajaxReverseEffect.action",
			type : "POST",
			data:{
				"rId":rId,
				"rState":rState
			},
			success:function(data) {
				$("#rState"+rId).text(data);
			}
		});
	}
</script>
</head>
<body class="rightBody">
<form name="form1" action="" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>角色管理 </strong></div> </div>
                <div class="search_art">
                    <li>
                        角色名称：<input type="text" name="rName" class="s_text" id="rName"  style="width:160px;"/>
                    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="doList('')"/></li>
                    <li style="float:right;">
                    <input type="button" value="刷新" class="s_button" onclick="doRefresh()"/>&nbsp;
                        <input type="button" value="新增" class="s_button" onclick="doAdd()"/>&nbsp;
                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll('deletedRoles')"/>&nbsp;
                    </li>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0">
                        <tr class="t_tit">
                            <td width="30" align="center"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                         	<td width="30" align="center">编号</td>
                            <td width="120" align="center">角色名称</td>
                            <td align="center">权限</td>
                            <td width="80" align="center">状态</td>
                            <td width="120" align="center">操作</td>
                        </tr>
                       		
                            <tr  bgcolor="f8f8f8"  >
                               <c:forEach items="${roles }" varStatus="vs" var="role">
                            		<tr bgcolor="f8f8f8">
                                		<td align="center"><input type="checkbox" name="selectedRow" id="selectedRow" value="${role.rId }"/></td>
	                            		<td>&nbsp;${vs.count }&nbsp;</td>
	                            		<td>&nbsp;${role.rName }(${role.rState?'有效':'已失效' })&nbsp;</td>
	                            		<td>
	                            		&nbsp;
	                            		<c:forEach items="${role.privileges }" varStatus="vs" var="privilege">
	                            			${privilege.pName }<c:if test="${!vs.last }">，</c:if>
	                            		</c:forEach>
	                            		&nbsp;
	                            		</td>
	                            		<td>&nbsp;<a href="javascript:ajaxReverseEffect('${role.rId }')" id="rState${role.rId }" >${role.rState?'有效':'无效' }</a>&nbsp;</td>
					                    <td align="center">
	                                    	<a href="javascript:doEdit('rId','${role.rId}')">编辑</a>
	                                    	<a href="javascript:doDelete('rId','${role.rId}')">删除</a>
	                               		</td>       	
	                               	</tr>	
                            	</c:forEach>
                            </tr>
                           
                    </table>
                </div>
            </div>
			 <div id="tip" style="margin-left: 380px;color: red;">${tip }</div>
        </div>
    </div>
</form>

</body>
</html>