
$.ajaxSetup ({
   cache: false //关闭AJAX相应的缓存
});

$(function(){
	
	$.extend($.fn.validatebox.defaults.rules, {   
	    maxLength: {   
	        validator: function(value, param){   
	            return param[0] >= value.length;   
	        },   
	        message: '请输入最大{0}位字符.'  
	    }   
	});
	
	
});
//处理日期格式 (val java对象格式处理方式)
function wmsInvList_Dateformattime(val) {
	if(val == null || $.trim(val) == ''){
		return "";
	}
	var year=parseInt(val.year)+1900;
	var month=(parseInt(val.month)+1);
	month=month>9?month:('0'+month);
	var date=parseInt(val.date);
	date=date>9?date:('0'+date);
	var hours=parseInt(val.hours);
	hours=hours>9?hours:('0'+hours);
	var minutes=parseInt(val.minutes);
	minutes=minutes>9?minutes:('0'+minutes);
	var seconds=parseInt(val.seconds);
	seconds=seconds>9?seconds:('0'+seconds);
	var time=year+'-'+month+'-'+date +' '+hours+':'+minutes+':'+seconds;  //时分秒
	return time;
};

var commonu = {
		warmBox :null,//保温箱配置
		posCodeKey : "posId", //缓存中POS key
		orderHandOverStatus:{
			//1:新增, 2(称重), 3:打印批次截单, 4.批次截单, 5:批次交接 
			1:'新增',
			2:'称重',
			3:'打印批次截单',
			4:'批次截单',
			5:'批次交接',
			6:'完成'
		},
		//损益单据状态
		wmspl_billState:{
			1:'存盘',
			2:'确认',
			3:'审核通过',
			4:'审核不通过',
			save:1,
			confirm:2,
			verifyOk:3,
			verfiryNo:4
		},
		salesSrRecvHeaderStatus:{
			//销退质检状态
			0:'销退申请',
			1:'到货登记',
			2:'质检确认',
			3:'质检完成'
		},
		plType:{ //损益类型
			bs:1, //报损
			by:2  //报益
		},
		owner : { //货主列表
			1:'春播科技'
		},
		rf_taskType : {
			1:"上架",
			2:"下架",
			3:"盘点",
			4:"移库"
		},
		rf_taskStatus : {
			0:"新增",
			1:"已认领",
			2:"正在执行",
			3:"已完成"
		},
		rf_tsskSrcType : {
			1:'销售下架',
			2:'采购收货',
			3:'销退上架',
			4:'采退下架', 
			5:'计划盘点',
			6:'移库',
			8:'领料下架',
			9:'领料下架取消回库', 
			10:'实物报缺',
			11:"取消订单"
		},
		srcTransType:{
			1:'销退业务',
			2:'领用业务',
			3:'借用',
			4:'归还',
			5:'报废',
			6:'库房盘点'
		}
};
commonu.getWarmBoxConf = function(){
	
	//
	$.ajax({
		type:"post",
		url:"qulitycheck_warmBoxConf",
		async:false,
		dataType:"json",
		success:function(da){
			if(da.result){
				commonu.warmBox = da.data;
			}
		}
	});
};
commonu.showMessage = function(message){
	 $.messager.show({
         title:'<span style="color:red;face:verdana">提示</span>',
         msg:"<span style='color:red;face:verdana'>"+message+"</span>",
         showType:'slide',
         style:{
             right:'',
             top:document.body.scrollTop+document.documentElement.scrollTop,
             bottom:''
         }
     });
};

commonu.showInfo = function(message){
	 $.messager.show({
        title:'提示',
        width:430,
        height:200,
        msg:"<span>"+message+"</span>",
        showType:'slide',
        style:{
            right:'',
            top:document.body.scrollTop+document.documentElement.scrollTop,
            bottom:''
        }
    });
};

commonu.Dateformattime = function(val) {
	if(val == null || $.trim(val) == ''){
		return "";
	}
	var year=parseInt(val.year)+1900;
	var month=(parseInt(val.month)+1);
	month=month>9?month:('0'+month);
	var date=parseInt(val.date);
	date=date>9?date:('0'+date);
	var hours=parseInt(val.hours);
	hours=hours>9?hours:('0'+hours);
	var minutes=parseInt(val.minutes);
	minutes=minutes>9?minutes:('0'+minutes);
	var seconds=parseInt(val.seconds);
	seconds=seconds>9?seconds:('0'+seconds);
	var time=year+'-'+month+'-'+date +' '+hours+':'+minutes+':'+seconds;  //时分秒
	return time;
};

//仓库列表
commonu.getWarehouse = function(){
	
	if(commonu.warehouse != null){
		return commonu.warehouse;
	}
	var id = $("#warehouseIds").val();
	if(id == null || $.trim(id) == ''){
		return null;
	}
	var ids = new Array();
	ids = id.split(",");
	if(ids.length != 1){
		return null;
	}
	
	$.ajax({
		type : 'POST',
		async : false,
		data : {
			'condition':id
		},
		url: 'getWarehouseObj', 
        datatype : "json", //参数的类型
        timeout: 20000,
		success: function(data){
			if(data.success){
				commonu.warehouse = data.obj;
			}
		},
	    error: function(data) {
	    }
  	});
};
commonu.getPOSNO = function(){
	var posId = getCookie("posId");
	if(posId == null || $.trim(posId) == ''){
		var mydiv = document.createElement("div"); 
		$(mydiv).window({
		    href: 'receive_toPosJsp',
		    closed:false,
		    width:350,
		    height:180,
		    modal:true,
		    title:"POS台号登记"
	   	}); 
	}
	return posId;
};

commonu.systemErrorMessage = function(){
	$.messager.show({
        title:'<span style="color:red;face:verdana">提示</span>',
        msg:"<span style='color:red;face:verdana'>系统异常！</span>",
        showType:'slide',
        style:{
            right:'',
            top:document.body.scrollTop+document.documentElement.scrollTop,
            bottom:''
        }
    });
};

commonu.tooltipFn = function(value,className){
	var abValue = value;  
	if (value.length>=18) {  
	    abValue = value.substring(0,15) + '...';  
	}  
	var content = '<div title="' + value + '" class="'+className+'" >' + abValue + '</div>';  
	return content;
};
commonu.tooltipShowFn = function(className){
	$.each($('.'+className),function(i,v){
		var title = $(v).attr("title");
		$(v).tooltip({    
			position: 'right',    
			content: '<span style="color:#fff">'+title+'</span>',    
			onShow: function(){$(this).tooltip('tip').css({            
				backgroundColor: '#666',            
				borderColor: '#666'        
				});    
				}
			});
	});
};


//POS
/**
 * 获取POS台号，如果获取不到则弹出pos台设置框
 * callBackFn 回调函数，设置完成
 */
commonu.getPosCode = function(callBackFn){
	
	var posCode = commonu.posCode;
	if($.trim(posCode) == ''){
		//1:获取cookies中posCode
		posCode = getCookie(commonu.posCodeKey);
	}
	//2：依然获取不到时设置pos
	if($.trim(posCode) == ''){
		//setCookie
		commonu.openPosWindow(callBackFn);
	}else{
		//设置PosCode
		callBackFn(posCode);
	}
};
/**
 * 删除pos,清除cookie
 */
commonu.clearPosCode = function(callBackFn){
	//
	delCookie(commonu.posCodeKey);
	commonu.openPosWindow(callBackFn);
};
/**
 * 弹出pos设置
 */
commonu.openPosWindow = function(callBackFn){
	//onClose
	layer.open({
        type: 2,
        title: '<strong>POS台号设置</strong>',
        maxmin: false,
        shadeClose: false, //点击遮罩关闭层
        area : ['400px' , '200px'],
        content: 'sys_setPosCodeView',
        end:function(){
        	var code = posCode = getCookie(commonu.posCodeKey);
        	callBackFn(code);
        }
    });
	
};

//获取打印机列表
commonu.getPrinterDataList = function(){
	//打印机设置
	LODOP = getLodop();
	var countPrint = LODOP.GET_PRINTER_COUNT();
	var arrayPrint = new Array();
	for (var n = 0; n < countPrint; n++) {
		arrayPrint.push(LODOP.GET_PRINTER_NAME(n));
	}
	var printObjs = new Array();
	for (var m = 0; m < arrayPrint.length; m++) {
		var obj = {
			id : m + 1,
			text : arrayPrint[m]
		};
		printObjs[m] = obj;
	}
	
	return printObjs;
};
