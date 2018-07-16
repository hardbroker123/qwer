<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	String path=request.getScheme()+"://"
			+request.getServerName()+":"
			+request.getServerPort();
	path=path+request.getContextPath()+"/";

%>
<%  
	String path1 = request.getContextPath();  
	String basePath = request.getScheme()+"://"
	+request.getServerName()+":"
	+request.getServerPort()+path+"/";
	
	pageContext.setAttribute("basePath", basePath);
%><br />
<!-- request=/qwer -->
<%-- request=<%=request.getContextPath()%><br /> --%>
<!DOCTYPE>
<html>
<head>
<base href="<%=path%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<script type="text/javascript">
		$(function(){
			$("#saveUser").click(function(){
					save();
			});
		    $("#upUser").click(function(){
					up();
			});
		});
			
		function save(){
			
			var itemName= $("#itemName").val();
			var itemType= $("#itemType").val();
			var itemColor= $("#itemColor").val();
			var itemBrand= $("#itemBrand").val();
			var itemDetail= $("#itemDetail").val();
			var itemPrice= $("#itemPrice").val();
			var item_Pic = $("#item_Pic").val();
			
			if(itemName == ''){
				alert('商品名称不能为空');
				$("#itemName").focus();
				return;
			}
			if(itemColor == ''){
				alert('商品颜色不能为空');
				$("#itemColor").focus();
				return;
			}
			if(itemType == ''){
				alert('商品类型不能为空');
				$("#itemType").focus();
				return;
			}
			if(itemBrand == ''){
				alert('商品品牌不能为空');
				$("#itemBrand").focus();
				return;
			}
			if(itemDetail == ''){
				alert('商品详情不能为空');
				$("#itemDetail").focus();
				return;
			}
			if(itemPrice == ''){
				alert('商品价格不能为空');
				$("#itemPrice").focus();
				return;
			}
			$.ajax({
				url:"pages/insertOneItem.action",
				type:"post",
				/* 返回值数据类型 */
				dataType:"text",
				/* contentType:"application/json;charset=utf-8", */
				/* data:$("#myform").serialize(), */ 
				/* 传的值是key value形式 */
				data:{itemName:itemName,itemType:itemType,itemColor:itemColor,itemBrand:itemBrand,itemPrice:itemPrice,itemDetail:itemDetail,itemPic:item_Pic}, 
				success:function(data,status){
					if(data=="success"){
						alert("添加成功");
						$('#myform').modal('hide');
					}
				},
				error:function(){
					/* alert($("#myform").serialize()); */
					alert("请求失败");
				}
			  });
			}
			function up(){
			var itemName= $("#itemName").val();
			var itemType= $("#itemType").val();
			var itemColor= $("#itemColor").val();
			var itemBrand= $("#itemBrand").val();
			var itemDetail= $("#itemDetail").val();
			var itemPrice= $("#itemPrice").val();
			
			
			if(itemName == ''){
				alert('商品名称不能为空');
				$("#itemName").focus();
				return;
			}
			if(itemColor == ''){
				alert('商品颜色不能为空');
				$("#itemColor").focus();
				return;
			}
			if(itemType == ''){
				alert('商品类型不能为空');
				$("#itemType").focus();
				return;
			}
			if(itemBrand == ''){
				alert('商品品牌不能为空');
				$("#itemBrand").focus();
				return;
			}
			if(itemDetail == ''){
				alert('商品详情不能为空');
				$("#itemDetail").focus();
				return;
			}
			if(itemPrice == ''){
				alert('商品价格不能为空');
				$("#itemPrice").focus();
				return;
			}
			$.ajax({
				url:"pages/insertOneItem.action",
				type:"post",
				
				dataType:"json",
				data:{itemId:itemId}, 
				success:function(data,status){
					if(data=="success"){
						alert("修改成功");
						$('#myform').modal('hide');
					}
				},
				error:function(){
					alert("请求失败");
				}
			  });
			}
</script>

<form action="" method="post">
商品名称：<input type="text" name="itemName"  />
价格区间:<input type="text" name="itemPriceMin"  />--<input type="text" name="itemPriceMax"  />
<input type="submit" name="cx" value="查询" class="btn btn-default" />
</form>
<h3>商品信息  共<span>4</span>条</h3>
<table id="test-table" class="table table-hover table-striped table-condensed table-bordered"></table>
<form action="" method="post" class="form-inline" >
<!--toolbar  -->
<div id="toolbar" class="btn-toolbar">
    <button  type="button" class="btn btn-success" data-toggle="modal" data-target="#mydlg">
      <span class="glyphicon glyphicon-plus" aria-hidden="true" >添加</span>
    </button>
    <button  type="button" onclick="delMany()" class="btn btn-danger">
      <span class="glyphicon glyphicon-trash" aria-hidden="true">删除</span>
    </button>
</div>
<input type="submit" value="批量删除"  class="btn btn-default" />
<table border="1px" class="table table-bordered table-striped table-hover">
	<thead>
	<tr>
		<td><input type="checkbox" name="" value="">全选</td>
		<td>商品编号</td>
		<td>商品展示</td>
		<td>商品名称</td>
		<td>商品类型</td>
		<td>商品颜色</td>
		<td>商品品牌</td>
		<td>商品价格</td>
		<td>商品详情</td>
		<td>操作</td>
	</tr>
	</thead>
	<tbody>
<c:forEach items="${sessionScope.itemsList}" var="it">

	<tr>
		<td><input type="checkbox" name="itemIds" value="${it.itemId}"></td>
		<td>${it.itemId}</td>
		<td>${it.itemPic}</td>
		<td>${it.itemName}</td>
		<td>${it.itemType}</td>
		<td>${it.itemColor}</td>
		<td>${it.itemBrand}</td>
		<td>${it.itemPrice}</td>
		<td>${it.itemDetail}</td>
		<td>
			<a data-toggle="modal" data-target="#mydlg1" href="GetOneItemsServlet?itemsId=${it.itemId}">修改</a>
			<a href="DeleteOneItemsServlet?itemsId=${it.itemId}&itemsName=abc">删除</a>
		</td>
	</tr>
</c:forEach>
</tbody>
</table>
</form>
<hr />


<!-- 模态框（Modal） -->
<!-- 修改商品-->
<div id="mydlg1" class="modal fade" id="myModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="myModalLabel" aria-hidden="true">
   
    <div class="modal-dialog">
        <div class="modal-content">
        
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改商品</h4>
            </div>
            <div class="container">
			<form class="form-horizontal" id="myform1"  method="post">

 			<div class="form-group">
			<label class="col-md-2 control-label">商品编号：</label>
			<div class="col-md-3 ">
			<input type="text"  id="user_birth1"  onclick="WdatePicker()"  name="user_birth" class="form-control form-control-static" >
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品名称：</label>
			<div class="col-md-3 ">
			<input type="text"  id="user_birth1"  onclick="WdatePicker()"  name="user_birth" class="form-control form-control-static" >
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品图片：</label>
			<div class="col-md-3 ">
			<input type="file"  id="user_birth1"  onclick="WdatePicker()"  name="user_birth" class="form-control form-control-static" >
			</div>
			</div>
 			
 			<div class="form-group">
			<label class="col-md-2 control-label">商品类型：</label>
			<div class="col-md-3 ">
			<input type="text" id="user_age1"  name="user_age" class="form-control form-control-static" >
			</div>
			</div>
			
 			<div class="form-group">
			<label class="col-md-2 control-label">商品颜色：</label>
			<div class="col-md-3 ">
			<input type="text" id="user_phone1" name="user_phone" class="form-control form-control-static" >
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品品牌：</label>
			<div class="col-md-3 ">
			<input type="text" id="user_phone1" name="user_phone" class="form-control form-control-static" >
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品价格：</label>
			<div class="col-md-3 ">
			<input type="text" id="email1" name="email" class="form-control form-control-static" >
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品详情：</label>
			<div class="col-md-3">
			<textarea rows="3" id="user_address1" name="user_address" cols="32" class="form-control form-control-static" ></textarea>
			</div>
			</div>
            <div class="modal-footer col-md-6">
            <!--用来清空表单数据-->
            <input type="reset" name="reset" style="display: none;" />
               <button type="button" id="upUser" class="btn btn-primary">提交</button>
                <button class="btn btn-danger" data-dismiss="modal">关闭</button>
            </div>
            </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div> 

<!-- 模态框（Modal） -->
<!-- 添加用户 -->
<div id="mydlg" class="modal fade" id="myModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="myModalLabel" aria-hidden="true">
   
    <div class="modal-dialog">
        <div class="modal-content">
        
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加商品</h4>
            </div>
            <div class="container">
			<form class="form-horizontal" id="myform"  method="post">
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品编号：</label>
			<div class="col-md-3 ">
			<input type="text"  id="itemId"   name="itemId" class="form-control form-control-static" readonly="readonly" >
			</div>
			</div>
			
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品名称：</label>
			<div class="col-md-3 ">
			<input type="text" onblur="validAccount()" id="itemName" name="itemName" class="form-control form-control-static" placeholder="请输入商品名称">
			</div>
			<label class="control-label"><span id="mid" style="color:red"></span></label>
			</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品图片：</label>
			<div class="col-md-3 ">
			<input type="file" id="item_Pic"  name="item_Pic" class="form-control form-control-static" placeholder="请输入用户姓名">
			</div>
			</div>
			
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品类型：</label>
			<div class="col-md-3 ">
			<input type="text" id="itemType"  name="itemType" class="form-control form-control-static" placeholder="请输入商品类型">
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品颜色：</label>
			<div class="col-md-3 ">
			<input type="text" id="itemColor" name="itemColor" class="form-control form-control-static" placeholder="请输入商品颜色">
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品品牌：</label>
			<div class="col-md-3 ">
			<input type="text" id="itemBrand" name="itemBrand" class="form-control form-control-static" placeholder="请输入商品品牌">
			</div>
			</div>
 
 			<div class="form-group">
			<label class="col-md-2 control-label">商品价格：</label>
			<div class="col-md-3 ">
			<input type="text" id="itemPrice"  name="itemPrice" class="form-control form-control-static" placeholder="请输入商品价格">
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品详情：</label>
			<div class="col-md-3">
			<textarea rows="3" id="itemDetail" name="itemDetail" cols="32" class="form-control form-control-static" placeholder="请输入商品详情"></textarea>
			</div>
			</div>
            <div class="modal-footer col-md-6">
            <!--用来清空表单数据-->
            <input type="reset" name="reset" style="display: none;" />
                <button class="btn btn-danger" data-dismiss="modal">关闭</button>
               <button type="button" id="saveUser" class="btn btn-primary">提交</button>
            </div>
            </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div> 

</body>
</html>