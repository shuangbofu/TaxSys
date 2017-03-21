<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>服务预约管理</title>
</head>
<body class="rightBody">
<form id="form" name="form" action="" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>服务预约管理</strong>&nbsp;-&nbsp;服务预约</div></div>
    <div class="tableH2">预约信息<span style="color:red;">(预约成功)</span></div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
    	<tr><td colspan="2" align="center">预约信息</td></tr>
        <tr>
            <td class="tdBg" width="250px">预约编号：</td>
            <td></td>
        </tr>
        <tr>
            <td class="tdBg">预约事项编号：</td>
            <td></td>
        </tr>
        <tr>
            <td class="tdBg">预约事项名称：</td>
            <td></td>
        </tr>
        <tr>
            <td class="tdBg">预约处理部门：</td>
            <td>
            
            </td>
        </tr>
		<tr>
            <td class="tdBg">预约处理人：</td>
            <td>            
            </td>
        </tr>
		<tr>
            <td class="tdBg">预约时间：</td>
            <td>            
            </td>
        </tr>
		<tr>
            <td class="tdBg">预约地点：</td>
            <td>            
            </td>
        </tr>
		<tr>
            <td class="tdBg">预约说明：</td>
            <td>            
            </td>
        </tr>
        <tr><td colspan="2" align="center">预约人信息</td></tr>
        <tr>
            <td class="tdBg">预约人姓名：</td>
            <td></td>
        </tr>
        <tr>
            <td class="tdBg">预约人手机号：</td>
            <td></td>
        </tr>          
        
        <tr><td colspan="2" align="center">处理操作</td></tr>
        <tr>
            <td class="tdBg">回复部门：</td>
            <td>
            xxx
            <s:hidden name="" value=""/>
            </td>
        </tr>
        <tr>
            <td class="tdBg">回复人：</td>
            <td>
            xxx
            
            </td>
        </tr>
		<tr>
            <td class="tdBg" width="200px">处理结果：</td>
            <td><s:radio name="" list="#{'1':'预约成功','0':'预约失败'}"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">回复内容：</td>
            <td><s:textarea name="" cols="90" rows="8" /></td>
        </tr>
    </table>
    
    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
</body>
</html>