<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/common/common.jspf" %>
<html>
<head>
    <title>角色管理</title>
    <script type="text/javascript">
    
    
  	//全选、全反选
	function doSelectAll(){
		// jquery 1.6 前
		//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
		//prop jquery 1.6+建议使用
		$("input[name=selectedRow]").prop("checked", $("#selAll").is(":checked"));		
	}
  	
	//新增角色
	function doAdd() {
		document.forms[0].action = "${basePath}role/add.action";
		document.forms[0].submit();
	}
	
	function doRefresh() {
		document.forms[0].action = "${basePath}role/list.action";
		document.forms[0].submit();
	}
	function doDeleteAll() {
		
		var deletedRoles = new Array();
		var i = 0;
		$("#selectedRow:checked").each(function(){
			deletedRoles[i] = $(this).val();
			i = i+1;
		})	
		document.forms[0].action = "${basePath}role/deleteAll.action?deletedRoles="+deletedRoles;
		document.forms[0].submit();
	}
	function doDelete(rId) {
		document.forms[0].action = "${basePath}role/delete.action?rId="+rId;
		document.forms[0].submit();
	}
	
	function doEdit(rId) {
		document.forms[0].action = "${basePath}role/edit.action?rId="+rId;
		document.forms[0].submit();
	}
	
	function doSearch() {
		var key = $("#roleName").val();
		//alert(key);
		document.forms[0].action = "${basePath}role/list.action?key="+key;
		document.forms[0].submit();
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
                        角色名称：<input type="text" name="role.name" cssClass="s_text" id="roleName"  cssStyle="width:160px;"/>
                    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="doSearch()"/></li>
                    <li style="float:right;">
                    <input type="button" value="刷新" class="s_button" onclick="doRefresh()"/>&nbsp;
                        <input type="button" value="新增" class="s_button" onclick="doAdd()"/>&nbsp;
                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll()"/>&nbsp;
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
	                            		<td>&nbsp;${role.rName }&nbsp;</td>
	                            		<td>
	                            		&nbsp;
	                            		<c:forEach items="${role.privileges }" varStatus="vs" var="privilege">
	                            			${privilege.pName }&nbsp;
	                            		</c:forEach>
	                            		&nbsp;
	                            		</td>
	                            		<td>&nbsp;${role.rState?'有效':'无效' }&nbsp;</td>
					                    <td align="center">
	                                    	<a href="javascript:doEdit('${role.rId}')">编辑</a>
	                                    	<a href="javascript:doDelete('${role.rId}')">删除</a>
	                               		</td>       	
	                               	</tr>	
                            	</c:forEach>
                            </tr>
                           
                    </table>
                </div>
            </div>
			<div class="c_pate" style="margin-top: 5px;">
        </div>
        </div>
    </div>
</form>

</body>
</html>