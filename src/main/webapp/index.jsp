<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/js/easyui/demo/demo.css">
<script type="text/javascript" src="<%=basePath %>/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/json2.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/common.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/jquery.maskedinput.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/cookieExist.js"></script>

<input id="warehouseIds" type="hidden" value='${UserPermission.warehouseIds }'>
<div id="div1"></div>

<script lang="javascript">

function isBlank(tval){
	return (typeof(tval) == "undefined" || tval === null || tval === '' || $.trim(tval) === '')?true:false;
}

function playErrorSound(){
	var player = $ ("#playerError")[0];
	player.Play();
}

function popUpErrorMsg(msg){
	playErrorSound();
	alert(msg);
}

$.extend($.fn.datagrid.methods, {
    fixRownumber : function (jq) {
        return jq.each(function () {
            var panel = $(this).datagrid("getPanel");
            //获取最后一行的number容器,并拷贝一份
            var clone = $(".datagrid-cell-rownumber", panel).last().clone();
            //由于在某些浏览器里面,是不支持获取隐藏元素的宽度,所以取巧一下
            clone.css({
                "position" : "absolute",
                left : -1000
            }).appendTo("body");
            var width = clone.width("auto").width();
            //默认宽度是25,所以只有大于25的时候才进行fix
            if (width > 25) {
                //多加5个像素,保持一点边距
            $(".datagrid-header-rownumber,.datagrid-cell-rownumber", panel).width(width + 5);
                //修改了宽度之后,需要对容器进行重新计算,所以调用resize
                $(this).datagrid("resize");
                //一些清理工作
                clone.remove();
                clone = null;
            } else {
                //还原成默认状态
                $(".datagrid-header-rownumber,.datagrid-cell-rownumber", panel).removeAttr("style");
            }
        });
    }
});

</script>
