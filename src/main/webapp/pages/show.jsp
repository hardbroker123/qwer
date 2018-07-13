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

<form action="GetItemsByNameAndPriceServlet" method="post">
商品名称：<input type="text" name="itemName"  />
价格区间:<input type="text" name="itemPriceMin"  />--<input type="text" name="itemPriceMax"  />
<input type="submit" name="cx" value="查询" class="btn btn-default" />
</form>
<h3>商品信息  共${itemsNum }条</h3>
<form action="DeleteItemsByIdsServlect" method="post" class="form-inline">
<input type="submit" value="批量删除"  class="btn btn-default" />
<table border="1px" class="table table-bordered table-striped table-hover">
	<thead>
	<tr>
		<td><input type="checkbox" name="" value="">全选</td>
		<td>商品编号</td>
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
<%-- 
<form action="<%=path %>InsertOrUpdateOneItemsServlet" method="post" class="form-inline">
	<table border="1px" class="table table-bordered table-striped table-hover">
		<tr>
			<td>商品编号</td>
			<td><input type="text" readonly="readonly" value="${sessionScope.items.itemId }" name="itemId" id="itemId"></td>
		</tr>
		<tr>
			<td>商品名称</td>
			<td><input type="text" value="${sessionScope.items.itemName }" name="itemName" id="itemName"></td>
			
		</tr>
		<tr>
			<td>商品类型</td>
			<td><input type="text" value="${sessionScope.items.itemType }" name="itemType" id="itemType"></td>
		</tr>
		<tr>
			<td>商品颜色</td>
			<td><input type="text" value="${sessionScope.items.itemColor }" name="itemColor" id="itemColor"></td>
		</tr>
		<tr>
			<td>商品品牌</td>
			<td><input type="text" value="${sessionScope.items.itemBrand }" name="itemBrand" id="itemBrand"></td>
		</tr>
		<tr>
			<td>商品价格</td>
			<td><input type="text" value="${sessionScope.items.itemPrice }" name="itemPrice" id="itemPrice"></td>
		</tr>
		<tr>
			<td>商品详情</td>
			<td><textarea rows="3" cols="22"   name="itemDetail" id="itemDetail">${sessionScope.items.itemDetail }</textarea></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="提交" class="btn btn-default">
				<input type="reset" value="重置" class="btn btn-default">
			</td>
		</tr>
	</table>
</form>
 --%>

<!-- 模态框（Modal） -->
<!-- 修改用户 -->
<div id="mydlg1" class="modal fade" id="myModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="myModalLabel" aria-hidden="true">
   
    <div class="modal-dialog">
        <div class="modal-content">
        
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改商品</h4>
            </div>
            <div class="container">
			<form class="form-horizontal" id="myform1"  method="post">
			
			
<!-- 			<div class="form-group">
			<label class="col-md-2 control-label">登录账号：</label>
			<div class="col-md-3 ">
			<input type="text" disabled="disabled" id="user_account1" name="user_account" class="form-control form-control-static" placeholder="请输入登陆账号">
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label">用户姓名：</label>
			<div class="col-md-3 ">
			<input type="text" id="user_name1"  name="user_name" class="form-control form-control-static" placeholder="请输入用户姓名">
			</div>
			</div>
			
			
			<div class="form-group">
			<label class="col-md-2 control-label">用户密码：</label>
			<div class="col-md-3 ">
			<input type="text" id="user_password1"  disabled="disabled" name="user_password" class="form-control form-control-static" placeholder="请输入密码">
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label">用户性别：</label>
			<div class="col-md-3">
			&nbsp;&nbsp;&nbsp;
			<input type="radio" id="nan1" checked name="user_sex" value="男">男&nbsp;&nbsp;
			<input type="radio" id="nv1" name="user_sex"  value="女">女
			</div>
			</div>
 
 			<div class="form-group">
			<label class="col-md-2 control-label">年龄：</label>
			<div class="col-md-3 ">
			<input type="text" id="user_age1"  name="user_age" class="form-control form-control-static" placeholder="请输入年龄">
			</div>
			</div>
			 -->
 			<div class="form-group">
			<label class="col-md-2 control-label">商品名称：</label>
			<div class="col-md-3 ">
			<input type="text"  id="user_birth1"  onclick="WdatePicker()"  name="user_birth" class="form-control form-control-static" placeholder="请输入出生日期">
			</div>
			</div>
 			
 			<div class="form-group">
			<label class="col-md-2 control-label">商品类型：</label>
			<div class="col-md-3 ">
			<select id="sid1"  name="dept_id" class="form-control form-control-static" placeholder="请输入Email">
			
			</select>
			</div>
			</div> 
			
 			<div class="form-group">
			<label class="col-md-2 control-label">商品颜色：</label>
			<div class="col-md-3 ">
			<input type="text" id="user_phone1" name="user_phone" class="form-control form-control-static" placeholder="请输入联系电话">
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品品牌：</label>
			<div class="col-md-3 ">
			<input type="text" id="user_phone1" name="user_phone" class="form-control form-control-static" placeholder="请输入联系电话">
			</div>
			</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品价格：</label>
			<div class="col-md-3 ">
			<input type="text" id="email1" name="email" class="form-control form-control-static" placeholder="请输入Email">
			</div>
			</div>
			
		
			
			<div class="form-group">
			<label class="col-md-2 control-label">商品详情：</label>
			<div class="col-md-3">
			<textarea rows="3" id="user_address1" name="user_address" cols="32" class="form-control form-control-static" placeholder="请输入联系地址"></textarea>
			</div>
			</div>
            <div class="modal-footer col-md-6">
            <!--用来清空表单数据-->
            <input type="reset" name="reset" style="display: none;" />
               <button type="button" onclick="upUser()" class="btn btn-primary">提交</button>
                <button class="btn btn-danger" data-dismiss="modal">关闭</button>
            </div>
            </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div> 
















</body>
</html>