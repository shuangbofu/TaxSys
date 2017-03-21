//全选、全反选
function doSelectAll(){
	// jquery 1.6 前
	//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
	//prop jquery 1.6+建议使用
	$("input[name=selectedRow]").prop("checked", $("#selAll").is(":checked"));		
}
//新增
function doAdd(){
	document.forms[0].action = "add.action";
	document.forms[0].submit();
}
//编辑
function doEdit(name,id){
	document.forms[0].action = "edit.action?"+name+"=" + id;
	document.forms[0].submit();
}
//删除
function doDelete(name,id){
	document.forms[0].action = "delete.action?"+name+"=" + id;
	document.forms[0].submit();
}
//刷新
function doRefresh() {
	document.forms[0].action = "list.action";
	document.forms[0].submit();
}
//批量删除
function doDeleteAll(name){
	var deletedArray = new Array();
	var i = 0;
	$("#selectedRow:checked").each(function(){
		deletedArray[i] = $(this).val();
		i = i+1;
	})	
	document.forms[0].action = "deleteAll.action?"+name+"="+deletedArray;
	document.forms[0].submit();
}
//选择性搜索关键字查询
function doList(command) {
	document.forms[0].action = "list.action?command="+command;
	document.forms[0].submit();
}
//搜索框回车搜索
$(function(){
	//当数据填写框按下回车的时候进行doSearch()
	$("#key").keyup(function(event){
		if(event.keyCode=="13") {
			doList();
		}
	});
	$("select option[value='${sessionScope.page.keyField}']").attr("selected","selected");
})
//分页输入框页面跳转
function doGoPage(value) {
	value = parseInt(value);
	var max = parseInt($("#currText").attr("max"));
	var min = parseInt($("#currText").attr("min"));
	if(value > max) {
		alert("输入的页数不能大于"+max+"！！！");
	} else if(value < min) {
		alert("输入的页数不能小于"+min+"！！！");
	} else {
		document.forms[0].action = "list.action?currentPage="+value;
		document.forms[0].submit();
	}
}