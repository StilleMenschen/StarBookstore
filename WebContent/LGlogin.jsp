<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="login"%>
<% request.setCharacterEncoding("gb2312"); %>
<!DOCTYPE HTML><html>
<head><meta charset=gb2312>
<title>登录页面 </title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt" %>
<form action="" method="post" accept-charset="gb2312" class="form-inline">
<div class="container">
<h3>请您登录</h3>
<div class="form-group">
 <div class="input-group">
  <div class="input-group-addon">登录名称:</div>
  <input type="text" class="form-control" name="logname" placeholder="用户名">
 </div><p></p>
 <div class="input-group">
  <div class="input-group-addon">输入密码:</div>
  <input type="password" class="form-control" name="password" placeholder="密码">
 </div><p></p>
 <input type="submit" class="btn btn-primary" value="提交"/>
</div>
</div>
</form>
<%
if(null!=request.getParameter("logname")){
	String logname=request.getParameter("logname");
    String password=request.getParameter("password");
    if(logname==null||logname.length()<=0){logname="";}
    if(password==null||password.length()<0){password="";}
%>
<login:LGLogin password="<%=password %>" logname="<%=logname %>"/>
<%if(backMess.contains("登录成功")){ %>
<script>alert("<%=backMess %>");window.location.href='LGindex.jsp';</script>
<%}else{ %>
<p class="text-danger" style="margin-top:20px;"><%=backMess %></p>
<%} } %>
</body></html>
