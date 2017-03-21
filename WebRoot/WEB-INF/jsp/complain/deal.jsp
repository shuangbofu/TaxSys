<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/common.jspf" %>
<html>
<head>
    <title>投诉受理管理</title>
</head>
<body class="rightBody">
<form id="form" name="form" action="${basePath }reply/insert.action" method="post" >
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>投诉受理管理</strong>&nbsp;-&nbsp;投诉受理</div></div>
    <div class="tableH2">投诉详细信息<span style="color:red;">(
	<c:forEach items="${states }" var="state">
		<c:if test="${state.key==complain.cState }">
			${state.value }
		</c:if>
	</c:forEach>
)</span></div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
    	<tr><td colspan="2" align="center">投诉人信息</td></tr>
        <tr>
            <td class="tdBg" width="250px">是否匿名投诉：</td>
            <td>${complain.cIsnm?'是':'否' }</td>
        </tr>
	        <tr>
	            <td class="tdBg">投诉人单位：</td>
	            <td> <c:if test="${complain.cIsnm==false }">${complain.cCompany }</c:if></td>
	        </tr>
	        <tr>
	            <td class="tdBg">投诉人姓名：</td>
	            <td><c:if test="${complain.cIsnm==false }">${complain.cName }</c:if></td>
	        </tr>
	        <tr>
            <td class="tdBg">投诉人手机：</td>
            <td>
            ${fn:substring(complain.cMobile,0,3) }****${fn:substring(complain.cMobile,7,11) }
            </td>
        </tr>
        <tr><td colspan="2" align="center">投诉信息</td></tr>
        <tr>
            <td class="tdBg">投诉时间：</td>
            <td><fmt:formatDate value="${complain.cTime }" type="BOTH" dateStyle="default"></fmt:formatDate></td>
        </tr>
        <tr>
            <td class="tdBg">被投诉部门：</td>
            <td>${complain.cTodept.dName }</td>
        </tr>
        <tr>
            <td class="tdBg">被投诉人：</td>
            <td>${complain.cToname }</td>
        </tr>
        <tr>
            <td class="tdBg">投诉标题：</td>
            <td>${complain.cTitle }</td>
        </tr>
        <tr>
            <td class="tdBg">投诉内容：</td>
            <td>${complain.cContent }</td>
        </tr>
        <tr><td colspan="2" align="center">受理信息</td></tr>
        <tr>
            <td colspan="2">
            	<c:forEach items="${replies }" var="reply" varStatus="vs">
            		<fieldset style="border: solid 1px #c0c0c0;margin-top:5px;"><legend style="color:green;font-weight:bold;">回复${vs.count }&nbsp;</legend>
            			<div style="width:100%; text-align:center;color:#ccc;maring-top:5px;">
							回复部门：${reply.replyDept.dName }&nbsp;&nbsp;
							回复人：${reply.replyEr }&nbsp;&nbsp;
							回复时间：<fmt:formatDate value="${reply.replyTime }" type="BOTH" dateStyle="default"/>
						</div>
						<div style="width:100%;maring-top:10px;font-size:13px;padding-left:5px;">${reply.replyContent }</div>
					</fieldset>
            	</c:forEach>
            </td>
        </tr>
        <tr><td colspan="2" align="center">受理操作</td></tr>
        <tr>
            <td class="tdBg">回复部门：</td>
            <td>
             <input type="hidden" name="replyDept.dId" value="${sessionScope.loginUser.uDept.dId }"/>
            ${sessionScope.loginUser.uDept.dName }
            </td>
        </tr>
        <tr>
            <td class="tdBg">回复人：</td>
            <td>
            <input type="hidden" name="replyEr" value="${sessionScope.loginUser.uName }"/>
            ${sessionScope.loginUser.uName }
            </td>
        </tr>
		<input type="hidden" name="cId" value="${complain.cId }"/>
        <tr>
            <td class="tdBg" width="200px">回复内容：</td>
            <td><textarea type="text" name="replyContent" cols="90" rows="8" ></textarea></td>
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