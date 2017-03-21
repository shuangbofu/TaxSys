<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/common.jspf" %>
<html>
<head>
    <title>信息发布管理</title>
    <script type="text/javascript" charset="utf-8" src="${basePath }js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${basePath }js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${basePath }js/ueditor/lang/zh-cn/zh-cn.js"></script>

    <script type="text/javascript">
   		window.UEDITOR_HOME_URL = "${basePath }js/ueditor/";
    	var ue = UE.getEditor('editor');
    </script>
</head>
<body class="rightBody">
<form id="form" name="form" action="${basePath }info/insert.action" method="post" >
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>信息发布管理</strong>&nbsp;-&nbsp;新增信息</div></div>
    <div class="tableH2">新增信息</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">信息分类：</td>
            <td>
            	<select id="iType" name="iType">
            		<c:forEach items="${infoTypes }" var="infoType">
            			<option value="${infoType.key }">${infoType.value }</option>
            		</c:forEach>
            	</select>
            
            </td>
            <td class="tdBg" width="200px">来源：</td>
            <td><input type="text" name="iSource" name="iSource"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">信息标题：</td>
            <td colspan="3">
            
            <s:textfield name="info.title" cssStyle="width:90%"/>
            <input type="text" style="width:90%" name="iTitle" id="iTitle"/>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">信息内容：</td>
            <td colspan="3">
            	<textarea type="text" style="width:90%;height:160px;" name="iContent" id="editor"></textarea>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">备注：</td>
            <td colspan="3">
            <textarea id="iMemo" name="iMemo" rows="3" cols="90"></textarea>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">创建人：</td>
            <td>
            	<label>${sessionScope.loginUser.uName }</label>
            	<input type="hidden" name="iCreator" id="iCreator" value="${sessionScope.loginUser.uName }"/>
            </td>
            <td class="tdBg" width="200px">创建时间：</td>
            <td>
             	<input type="hidden" name="iCreatetime" id="iCreatetime" value="<fmt:formatDate value="${iCreatetime }" dateStyle="default" type="BOTH" />"/>
             	
             	<label ><fmt:formatDate value="${iCreatetime }" dateStyle="default" type="BOTH" /></label> 
            </td>
            <input type="hidden" name="iState" id="iState" value="true" />
        </tr>
    </table>
    <!-- 默认信息状态为 发布 -->
    <s:hidden name="info.state" value="1"/>
    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
</body>
</html>