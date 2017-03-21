<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/common/common.jspf" %>
<html>
<head>
    <%-- <%@include file="/common/header.jsp"%> --%>
    <title>用户管理</title>
    
</head>
<body class="rightBody">
<form id="form" name="form" action="${basePath }/user/insert.action" method="post" >
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>用户管理</strong>&nbsp;-&nbsp;新增用户</div></div>
    <div class="tableH2">新增用户</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">所属部门：</td>
            <td><select id="uDept" name="uDept.dId">
            	<c:forEach items="${depts }" var="dept">
            		<option value="${dept.dId }" id="${dept.dId }" >${dept.dName }</option>
            	</c:forEach>
            </select></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">头像：</td>
            <td>
                <input type="file" name="uHeadImg"/>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">用户名：</td>
            <td><input type="text" name="uName"/>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">帐号：</td>
            <td><input type="text" name="uAccount" id="uAccount"/>
            <font id="tip" style="margin-left: 0px;color: red; font-size: 10px">${tip }</font>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">密码：</td>
            <td><input type="text" name="uPassword"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">性别：</td>
            <td><input type="radio" name="uGender" value=true checked="checked"/>男
           		 <input type="radio" name="uGender" value=false>女
            </td>
        </tr>
         <tr>
            <td class="tdBg" width="200px">角色：</td>
             <td><select id="uRole" name="uRole.rId">
            	<c:forEach items="${roles }" var="role">
            	<option value="${role.rId }" id="${role.rId }" >${role.rName }</option>
            	</c:forEach>
            </select></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">角色：</td>
            <td></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">电子邮箱：</td>
            <td><input type="text" name="uEmail"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">手机号：</td>
            <td><input type="text" name="uMobile"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">生日：</td>
            <td><input type="text" name="uBirthday"/></td>
        </tr>
		<tr>
            <td class="tdBg" width="200px">状态：</td>
            <td><input type="radio" name="uState" value="1" checked="checked"/>有效
            	<input type="radio" name="uState" value="2" />无效
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">备注：</td>
            <td><textarea rows="" cols="" name="uMemo"></textarea></td>
        </tr>
    </table>
    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
   
</form>
<script type="text/javascript">
	$(function(){
		$("#uAccount").blur(function(){
			var uAccount = $(this).val();
			//alert(uAccount);
			$.ajax ({
				url:"${basePath}user/ajaxCheck.action",
				type:"POST",
				data:{
					"uAccount":uAccount
				},
				success:function(ajaxTip) {
					//alert(ajaxTip);
					$("#tip").text(ajaxTip);
				}
			});
		});
	});
	
</script>
</body>
</html>