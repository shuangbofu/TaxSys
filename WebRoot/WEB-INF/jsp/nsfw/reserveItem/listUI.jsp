<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>预约服务管理</title>
    <script type="text/javascript">
        
    </script>
</head>
<body class="rightBody">
<form name="form1" action="" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>预约事项</strong></div> </div>
                <div class="search_art">
                    <li>
                        事项编号：<s:textfield name="item.no" cssClass="s_text"  cssStyle="width:160px;"/>
                    </li>
					<li>
                        事项名称：<s:textfield name="item.name" cssClass="s_text" cssStyle="width:160px;"/>
                    </li>
					<li>
                        处理部门：<s:select name="item.dealDept" list="#{'':'全部','部门A':'部门A','部门B':'部门B'}"/>
                    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="doSearch()"/></li>
                    <li style="float:right;">
                        <input type="button" value="新增" class="s_button" onclick="doAdd()"/>&nbsp;
                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll()"/>&nbsp;
                    </li>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0">
                        <tr class="t_tit">
                            <td width="30" align="center"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td align="center">事项编号</td>
                            <td width="120" align="center">事项名称</td>
                            <td width="120" align="center">处理部门</td>
                            <td width="140" align="center">处理人</td>
                            <td width="80" align="center">状态</td>
                            <td width="120" align="center">操作</td>
                        </tr>
                       
                            <tr bgcolor="f8f8f8">
                                <td align="center"><input type="checkbox" name="selectedRow" value=''/></td>
                                <td align="center"></td>
                                <td align="center">
                                		
                                </td>
                                <td align="center"></td>
                                <td align="center"></td>
                                <td align="center"></td>
                                <td align="center">
                                	
                                	
                                    <a href="#">编辑</a>
                                    <a href="#">删除</a>
                                </td>
                            </tr>
                        
                    </table>
                </div>
            </div>
        <div class="c_pate" style="margin-top: 5px;">
		<table width="100%" class="pageDown" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td align="right">
                 	总共1条记录，当前第 1 页，共 1 页 &nbsp;&nbsp;
                            <a href="#">上一页</a>&nbsp;&nbsp;<a href="#">下一页</a>
					到&nbsp;<input type="text" style="width: 30px;" onkeypress="if(event.keyCode == 13){doGoPage(this.value);}" min="1"
					max="" value="1" /> &nbsp;&nbsp;
			    </td>
			</tr>
		</table>	
        </div>

        </div>
    </div>
</form>

</body>
</html>