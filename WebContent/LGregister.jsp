<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="register"%>
<% request.setCharacterEncoding("gb2312"); %>
<!DOCTYPE HTML><html>
<head><meta charset="gb2312"/>
<title>注册页面</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt" %>
<div class="container">
<form action="" method="post" accept-charset="gb2312" class="form-inline">
<p class="text-warning">输入您的信息，用户名中不能包含有逗号，带*号项必须填写。</p>
<div class="form-group">
<div class="input-group has-warning">
      <div class="input-group-addon">用户名称:</div>
      <input type="text" class="form-control" name="logname" placeholder="用户名称">
  </div><p></p>
<div class="input-group has-warning">
      <div class="input-group-addon">设置密码:</div>
      <input type="password" class="form-control" name="password" placeholder="设置密码">
  </div><p></p>
<div class="input-group">
      <div class="input-group-addon">电子邮件:</div>
      <input type="email" class="form-control" name="email" placeholder="电子邮件">
  </div><p></p>
<div class="input-group">
      <div class="input-group-addon">真实姓名:</div>
      <input type="text" class="form-control" name="realname" placeholder="真实姓名">
  </div><p></p>
<div class="input-group">
      <div class="input-group-addon">联系电话:</div>
      <input type="text" class="form-control" name="phone" placeholder="联系电话">
  </div><p></p>
<div class="input-group">
      <div class="input-group-addon">通信地址:</div>
      <input type="text" class="form-control" name="address" placeholder="通信地址">
  </div><p></p>
  <input type="submit" class="btn btn-primary" value="提交">
 </div>
</form>
</div>
<%
if(null!=request.getParameter("logname")){
    String logname=request.getParameter("logname");
    String password=request.getParameter("password");
    String email=request.getParameter("email");
    String realname=request.getParameter("realname");
    String phone=request.getParameter("phone");
    String address=request.getParameter("address");
%>
<register:LGRegister logname="<%=logname%>" password="<%=password%>"
	email="<%=email%>" realname="<%=realname%>" phone="<%=phone%>"
	address="<%=address%>" />
<h3 class="text-info"><%=backMess %></h3>
<%}%>
</body>
</html>
