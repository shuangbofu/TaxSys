<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>预约服务管理</title>

    <script>
    	
    </script>
</head>
<body class="rightBody">
<form id="form" name="form" action="${basePath}nsfw/reserveItem_edit.action" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>预约事项</strong>&nbsp;-&nbsp;修改事项</div></div>
    <div class="tableH2">修改事项</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">事项编号：</td>
            <td><s:select name="xxx" list=""/></td>
            <td class="tdBg" width="200px">事项名称：</td>
            <td><s:textfield name="xxx"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">处理部门：</td>
            <td colspan="3"><s:select name="xxx" list=""/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">处理人：</td>
            <td colspan="3"><s:select name="xxx" list=""/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">备注：</td>
            <td colspan="3"><s:radio name="xxx" list="'1':'有效','0':'无效'"/></td>
        </tr>
        
    </table>
    <s:hidden name="xxx"/>
    <s:hidden name="xxx"/>
    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
</body>
</html>