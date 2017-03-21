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

    <script>
   		window.UEDITOR_HOME_URL = "${basePath }js/ueditor/";
    	var ue = UE.getEditor('iContent');
    	$(function(){
	    	$("#${editedInfo.iType}").attr("selected","selected");
    	})
    </script>

</head>
<body class="rightBody">
<form id="form" name="form" action="${basePath}info/update.action" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>信息发布管理</strong>&nbsp;-&nbsp;修改信息</div></div>
    <div class="tableH2">修改信息</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">信息分类：</td>
             <td>
            	<select id="iType" name="iType">
            		<c:forEach items="${infoTypes }" var="infoType">
            			<option value="${infoType.key }" id="${infoType.key }">${infoType.value }</option>
            		</c:forEach>
            	</select>
            
            </td>
            <td class="tdBg" width="200px">来源：</td>
            <td><input type="text" name="iSource" id="iSource" value="${editedInfo.iSource }"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">信息标题：</td>
            <td colspan="3"><input type="text" name="iTitle" id="iTitle" style="width:90%" value="${editedInfo.iTitle }"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">信息内容：</td>
            <td colspan="3"><textarea type="text" id="iContent" name="iContent" style="width:90%;height:160px;" >${editedInfo.iContent }</textarea></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">备注：</td>
            <td colspan="3"><input type="text" name="iMemo" id="iMemo" cols="90" rows="3" value="${editedInfo.iMemo }" /></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">创建人：</td>
            <td>
                <label>${editedInfo.iCreator }</label>
            	<input type="hidden" name="iCreator" id="iCreator" value="${editedInfo.iCreator }"/>
            </td>
            <td class="tdBg" width="200px">创建时间：</td>
            <td>
            	<label><fmt:formatDate value="${iCreatetime }" dateStyle="default" type="BOTH" /></label>
             	<input type="hidden" name="iCreatetime" id="iCreatetime" value="<fmt:formatDate value="${iCreatetime }" dateStyle="default" type="BOTH" />"/>
            </td>
        </tr>
    </table>
    <input type="hidden" id="iId" name="iId"  value="${editedInfo.iId }"/>
    <input type="hidden" name="iState" id="iState" value="${editedInfo.iState }" />
    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
</body>
</html>