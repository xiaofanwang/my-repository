<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../index.jsp"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>商品温区设置</title>
</head>
<body>
	<div style="padding:0px;height: 34px;font-size:15px;font-weight:bold;">商品温区设置</div>
	<div>
		<table>
			<tr>
				<td>SKU：&nbsp;&nbsp;<input id="skuId" class="easyui-numberbox" type="text" style="width:100px;" precision="0"/></td>
				<td style="padding-left: 15px;width:400px;white-space:nowrap;">三級分类：
					<select name="product.productClass1" id="productClass1" class="easyui-combobox" style="width:27%;" onchange="getProductChildClass('1',this.value)"></select>
					<select name="product.productClass2" id="productClass2" class="easyui-combobox" style="width:27%;" onchange="getProductChildClass('2',this.value)"></select>
					<select name="product.productClass3" id="productClass3" class="easyui-combobox" style="width:27%;" onchange="getTaxCodeByClass(this.value)"></select>
				</td>
				<td style="padding-left: 15px;width:200px;white-space:nowrap;">存储温区：
					<select name="product.productClass1" id="productClass1" class="easyui-combobox" style="width:60%;" onchange="getProductChildClass('1',this.value)"></select>
				</td>
				<td style="padding-left: 15px;"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px;" onclick="return querySalesPolicy();">查询</a></td>
			</tr>
			<tr>
				<td>UPC：&nbsp;&nbsp;<input id="Id" class="easyui-numberbox" type="text" style="width:100px;" precision="0"/></td>
				<td style="padding-left: 15px;width:200px;white-space:nowrap;">干燥属性：
					<input type="radio" name="dryFlag" value="O" />不区分
					<input type="radio" name="dryFlag" value="Y" />是
					<input type="radio" name="dryFlag" value="N" />否
				</td>
				<td style="padding-left: 15px;width:200px;white-space:nowrap;">配送温区：
					<select name="product.productClass1" id="productClass1" class="easyui-combobox" style="width:60%;" onchange="getProductChildClass('1',this.value)"></select>
				</td>
				<td style="padding-left: 15px;"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:80px;" onclick="return resetQueryCondtion();">重置</a></td>
			</tr>
			<tr>
				<td colspan="3"></td>
				<td style="padding-left: 15px;"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="width:80px;" onclick="return resetQueryCondtion();">设置</a></td>
			</tr>
		</table>
	</div>
	<div style="padding-top:10px;">
		<table id="skuConfDataGrid" class="easyui-datagrid" style="width:883px;height:350px" 
            data-options="rownumbers:true,
            			  singleSelect:true,
            			  url:'',
            			  method:'get',
            			  pageSize : 15,
						  pageList : [15, 20, 30, 40, 50 ],
						  pagination : true,
						  striped : true">
        <thead>
            <tr>
                <th data-options="field:'ck',checkbox:true"></th>
                <th data-options="field:'skuId',width:100,align:'center'">SKU</th>
                <th data-options="field:'productid',width:150,align:'center'">商品名称</th>
                <th data-options="field:'listprice',width:100,align:'center'">UPC</th>
                <th data-options="field:'unitcost',width:80,align:'center'">是否干燥</th>
                <th data-options="field:'attr1',width:120,align:'center'">存储温区</th>
                <th data-options="field:'status',width:160,align:'center'">配送温区</th>
            </tr>
        </thead>
    </table>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$('#skuConfDataGrid').datagrid('loadData', {total: 0, rows: [] });
});

//获取三级分类，温区，配送温区值
$.post("/skutempconf/initQuery.do",function(data){
	
});
</script>
</html>
