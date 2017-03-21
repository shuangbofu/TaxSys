<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/common.jspf" %>
<html>
<head>
    <title>用户管理</title>
	<script type="text/javascript" src="${basePath}js/CRUD.js"></script>
    <script type="text/javascript">
		
		function ajaxReverseEffect(uId) {
			var uState = false;
			var uStateText = $("#uState"+uId).text();
			if(uStateText=="未锁定") {
				uState = true;
			}
			$.ajax({
				url : "${basePath}user/ajaxReverseEffect.action",
				type : "POST",
				data:{
					"uId":uId,
					"uState":uState
				},
				success:function(data) {
					
					$("#uState"+uId).text(data);
				}
			});
		}
		$(function(){
			
			value = $("#keyEntity").val();
			$("#key").attr("name",value);
			
			$("#keyEntity").change(function(){
				value = $(this).val();
				alert(value);
				$("#key").attr("name",value);
			})
			//alert($("#uState").val());
			$("#uState option[value='${page.keyEntity.uState}']").attr("selected","selected");
			$("#uDept option[value='${page.keyEntity.uDept.dId}']").attr("selected","selected");
			
		})
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
				    <%--
	                    <select style=" margin-top:0px; width:64px;height:22px;" name="keyField" id="keyField">
		                 	<option value="uName">用户名</option>
		                 	<option value="uAccount">账号</option>
		                 	<option value="uEmail">电子邮箱</option>
		                 	<option value="uMobile">手机号</option>
		                 	<option value="uBirthday">生日</option>
		                 	<option value="uMemo">备注</option>
                		</select>
                	 --%>	
                		<select style=" margin-top:0px; width:50px;height:22px;" name="uState" id="uState">
                			<option value="">不选</option>
                			<option value="true">未锁定</option>
                			<option value="false">已锁定</option>
                		</select>
                		<select style=" margin-top:0px; width:50px;height:22px;" name="uDept.dId" id="uDept">
                			<option value="">不选</option>
                			<c:forEach items="${depts }" var="dept">
                				<option value="${dept.dId }">${dept.dName }</option>
                			</c:forEach>
                		</select>
                		
                		 <select style=" margin-top:0px; width:64px;height:22px;" name="keyEntity" id="keyEntity">
		                 	<option value="uName">用户名</option>
		                 	<option value="uAccount">账号</option>
		                 	<option value="uEmail">电子邮箱</option>
		                 	<option value="uMobile">手机号</option>
		                 	<option value="uBirthday">生日</option>
		                 	<option value="uMemo">备注</option>
                		</select>
                    </li>
                    <li>
				        <input type="text" name="" class="s_text" id="key" value="" style="width:120px;"/>
				    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="javascript:doList('search')"/></li>
                    <li style="float:right;">
                        <input type="button" value="刷新" class="s_button" onclick="doRefresh()"/>&nbsp;
                        <input type="button" value="新增" class="s_button" onclick="doAdd()"/>&nbsp;
                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll('deletedUsers')"/>&nbsp;
                        <input type="button" value="导出" class="s_button" onclick="doExportExcel()"/>&nbsp;
                    	<input name="userExcel" type="file"/>
                        <input type="button" value="导入" class="s_button" onclick="doImportExcel()"/>&nbsp;

                    </li>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0">
                        <tr class="t_tit">
                            <td width="25" align="center">编号</td>
                            <td width="20" align="center"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td width="80" align="center">头像</td>
                            <td width="80" align="center">用户名</td>
                            <td width="60" align="center">帐号</td>
                            <td width="80" align="center">角色</td>
                            <td width="60" align="center">所属部门</td>
                            <td width="20" align="center">性别</td>
                            <td width="60" align="center">电子邮箱</td>
                            <td width="60" align="center">手机号</td>
                            <td width="70" align="center">生日</td>
                            <td width="50" align="center">状态</td>
                            <td width="160" align="center">备注</td>
                            <td width="50" align="center">操作</td>
                        </tr>
                        
                            	<c:forEach items="${sessionScope.page.pageData }" varStatus="vs" var="user">
                            		<tr bgcolor="f8f8f8">
	                            		<td>&nbsp;${vs.count+sessionScope.page.startIndex }&nbsp;</td>
                                		<td align="center"><input type="checkbox" name="selectedRow" id="selectedRow" value="${user.uId }"/></td>
	                            		<td>
	                            		  	<c:if test="${empty user.uHeadimg }">
											<img src="${basePath}/images/home/gs09.png" width="70" height="70" />
				                            </c:if>
				                            <c:if test="${not empty user.uHeadimg }">
				                            	<img src="${basePath }images/headImg/${user.uHeadimg }" width="70" height="70"/>
				                            </c:if>
	                            		</td>
	                            		<td>&nbsp;${user.uName }&nbsp;</td>
	                            		<td>&nbsp;${user.uAccount }&nbsp;</td>
	                            		<td>&nbsp;${user.uRole.rName==null?'暂无':user.uRole.rName }&nbsp;</td>
	                            		<td>&nbsp;${user.uDept.dName }&nbsp;</td>
	                            		<td>&nbsp;${user.uGender?'男':'女' }&nbsp;</td>
	                            		<td>&nbsp;${user.uEmail }&nbsp;</td>
	                            		<td>&nbsp;${user.uMobile }&nbsp;</td>
	                            		<td>&nbsp;<fmt:formatDate value="${user.uBirthday }" type="DATE" dateStyle="default" />&nbsp;</td>
	                            		<td>&nbsp;<a href="javascript:ajaxReverseEffect('${user.uId }')" id="uState${user.uId }" >${user.uState?'未锁定':'已锁定' }</a>&nbsp;</td>
	                            		<td>&nbsp;${user.uMemo }&nbsp;</td>
					                    <td align="center">
	                                    	<a href="javascript:doEdit('uId','${user.uId}')">编辑</a>
	                                    	<a href="javascript:doDelete('uId','${user.uId}')">删除</a>
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
<script type="text/javascript">
</script>
</body>
</html>