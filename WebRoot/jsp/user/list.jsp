<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/common.jspf" %>
<html>
<head>
    <title>用户管理</title>
    <script type="text/javascript" src="${basePath}js/jquery/jquery-1.10.2.min.js"></script>
    <link href="${basePath}css/skin1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
      	//全选、全反选
		function doSelectAll(){
			// jquery 1.6 前
			//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
			//prop jquery 1.6+建议使用
			$("input[name=selectedRow]").prop("checked", $("#selAll").is(":checked"));		
		}
		//新增
		function doAdd() {
			document.forms[0].action = "${basePath}user/add.action";
			document.forms[0].submit();
		}
		
		function doEdit(uId) {
			document.forms[0].action = "${basePath}user/edit.action?uId="+uId;
			document.forms[0].submit();
		}
		
		function doDelete(uId) {
			document.forms[0].action = "${basePath}user/delete.action?uId="+uId;
			document.forms[0].submit();
		}
		
		function doDeleteAll() {
			//var url = "${basePath}user/deleteAll.action";
			var deletedUsers = new Array();
			var i = 0;
			$("#selectedRow:checked").each(function(){
				deletedUsers[i] = $(this).val();
				i = i+1;
			})	
		/*	$.ajax({
				url: "${basePath}user/deleteAll.action",
				data: { "deletedUsers": array },  
			    dataType: "json",  
			    type: "POST",  
			    traditional: true,  
			});*/
			document.forms[0].action = "${basePath}user/deleteAll.action?deletedUsers="+deletedUsers;	
			document.forms[0].submit();
		}
		/*
		//搜索单一关键字查询
		function doSearch() {
			var key = $("#userName").val();
			//alert(key);
			document.forms[0].action = "${basePath}user/list.action?key="+key;
			document.forms[0].submit();
		}*/
		//选择性搜索关键字查询
		function doMoreSearch() {
			var key = $("#userName").val();
			var keyField = $("#keySelect option:selected").val();
			//alert(key+":"+keyField);
			document.forms[0].action = "${basePath}user/list.action?key="+key+"&keyField="+keyField;
			document.forms[0].submit();
		}
		
		function doRefresh() {
			document.forms[0].action = "${basePath}user/list.action";
			document.forms[0].submit();
		}
		$(function(){
			//当数据填写框按下回车的时候进行doSearch()
			$("#userName").keyup(function(event){
				if(event.keyCode=="13") {
					doMoreSearch();
				}
			});
		})
		function doGoPage(value) {
			value = parseInt(value);
			var max = parseInt($("#currText").attr("max"));
			if(value > max) {
				alert("输入的页数不能大于"+max+"！！！");
			} else {
				document.forms[0].action = "${basePath }user/list.action?currentPage="+value;
				document.forms[0].submit();
			}
		}
    </script>
</head>
<body class="rightBody">
<form name="form1" action="" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>用户管理</strong></div> </div>
                <div class="search_art">
				    <li>
	                    <select style=" margin-top:0px; width:64px;height:22px;" name="keySelect" id="keySelect" >
		                 	<option value="uName">用户名</option>
		                 	<option value="uAccount">账号</option>
		                 	<option value="uEmail">电子邮箱</option>
		                 	<option value="uMobile">手机号</option>
		                 	<option value="uBirthday">生日</option>
		                 	<option value="uMemo">备注</option>
                		</select>
                    </li>
                    <li>
				        <input type="text" name="user.name" cssClass="s_text" id="userName"  cssStyle="width:160px;"/>
				    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="doMoreSearch()"/></li>
                    <li style="float:right;">
                        <input type="button" value="刷新" class="s_button" onclick="doRefresh()"/>&nbsp;
                        <input type="button" value="新增" class="s_button" onclick="doAdd()"/>&nbsp;
                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll()"/>&nbsp;
                        <input type="button" value="导出" class="s_button" onclick="doExportExcel()"/>&nbsp;
                    	<input name="userExcel" type="file"/>
                        <input type="button" value="导入" class="s_button" onclick="doImportExcel()"/>&nbsp;

                    </li>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0">
                        <tr class="t_tit">
                            <td width="30" align="center">编号</td>
                            <td width="20" align="center"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td width="100" align="center">用户名</td>
                            <td width="80" align="center">帐号</td>
                            <td width="80" align="center">所属部门</td>
                            <td width="30" align="center">性别</td>
                            <td width="100" align="center">电子邮箱</td>
                            <td width="60" align="center">手机号</td>
                            <td width="70" align="center">生日</td>
                            <td width="40" align="center">状态</td>
                            <td width="160" align="center">备注</td>
                            <td width="80" align="center">角色</td>
                            <td width="80" align="center">操作</td>
                        </tr>
                        
                            	<c:forEach items="${page.pageData }" varStatus="vs" var="user">
                            		<tr bgcolor="f8f8f8">
	                            		<td>&nbsp;${vs.count }&nbsp;</td>
                                		<td align="center"><input type="checkbox" name="selectedRow" id="selectedRow" value="${user.uId }"/></td>
	                            		<td>&nbsp;${user.uName }&nbsp;</td>
	                            		<td>&nbsp;${user.uAccount }&nbsp;</td>
	                            		<td>&nbsp;${user.uDept.dName }&nbsp;</td>
	                            		<td>&nbsp;${user.uGender?'男':'女' }&nbsp;</td>
	                            		<td>&nbsp;${user.uEmail }&nbsp;</td>
	                            		<td>&nbsp;${user.uMobile }&nbsp;</td>
	                            		<td>&nbsp;<fmt:formatDate value="${user.uBirthday }" type="DATE" dateStyle="default" />&nbsp;</td>
	                            		<td>&nbsp;${user.uState?'有效':'无效' }&nbsp;</td>
	                            		<td>&nbsp;${user.uMemo }&nbsp;</td>
	                            		<td>&nbsp;${user.uRole.rName==null?'暂无':user.uRole.rName }&nbsp;</td>
					                    <td align="center">
	                                    	<a href="javascript:doEdit('${user.uId}')">编辑</a>
	                                    	<a href="javascript:doDelete('${user.uId}')">删除</a>
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
                 	${page.totalRecordsCount }条记录，当前第
                 	
                 	 ${page.currentPage }页，
                 	 
                 	 共${page.pageCount }页 &nbsp;&nbsp;
                            
                   	<a id="firstPage" href="${basePath }user/list.action?currentPage=1">首页</a>&nbsp;&nbsp;
                    <a id="prePage" href="${basePath }user/list.action?currentPage=${page.currentPage-1 }">上一页</a>&nbsp;&nbsp;
                    
                    <a id="nextPage" href="${basePath }user/list.action?currentPage=${page.currentPage+1 }&pageCount=${page.pageCount}">下一页</a>&nbsp;&nbsp;
                    
                   	<a id="firstPage" href="${basePath }user/list.action?currentPage=${page.pageCount }">尾页</a>&nbsp;&nbsp;
                    
					转到第&nbsp;<input id="currText" type="text" style="width: 30px;" onkeypress="if(event.keyCode == 13){doGoPage(this.value);}" min="1"
					max="${page.pageCount }" value="${page.currentPage }" />页 &nbsp;&nbsp;
			    </td>
			</tr>
			
		</table>	
        </div>
        </div>
    </div>
</form>

</body>
</html>