<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
<style type="text/css">
.main {
    margin: 0 auto;
     width: 520px;
    height: 320px;
}
.errorContent {
    padding: 85px 35px 20px 30px;
}
.errorContent img {
    margin: 6px 20px 0 0;
    width: 50px;
    height: 50px;
    float: left;
}
.errorContent .errorText {
    overflow:hidden;
}
.errorContent .errorText p {
    margin: 16px 0;
}
.errorContent .errorText .errorTitle {
    margin-bottom: 10px;
    font-size: 32px;
    line-height: 40px;
}
.errorContent .errorText p span {
    font-weight: bold;
    color: red;
}
.errorContent .errorText p a {
    color: #00a0e9;
}
</style>
<script type="text/javascript">
function countDown(secs){    
	 var jumpTo = document.getElementById('secondSpan');
	 jumpTo.innerHTML=secs; 
	 if(--secs>0){    
	     setTimeout("countDown("+secs+")",1000);    
	     }    
	 else{      
		 redirect(); 
	     }    
	 }    

	function redirect() {
		window.history.go(-1);
    }
</script>
</head>
<body onload="countDown(5)">
<form id="Form1" >
	<div class="main">
		<div class="errorContent">
		<img src='css/error.png' />
		<div class="errorText">
		<p class="errorTitle">拒绝访问!</p>
		<p>请与管理员联系以获得许可！</p>
		<p>本页 <span id="secondSpan">5</span> 秒后将自动返回上一页！</p>
		<p>如果什么都没有发生，请点击 <a href="#" onclick="javascript:redirect()">这里</a>!</p>
		</div>
		</div>
	</div>
</form>

</body>
</html>