<%@ page contentType="text/html;charset=GB2312"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyPassword"%>
<%	request.setCharacterEncoding("gb2312");%>
<!DOCTYPE HTML><html>
<head><meta charset=gb2312>
<title>修改密码</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt"%>
<div class="container">
<form action="" method="post" accept-charset="gb2312" class="form-inline">
<h3 class="text-muted">请输入您的当前的密码和新密码:</h3>
  <div class="form-group">
    <label>当前密码:</label>
    <input type="password" class="form-control" name="oldPassword" placeholder="当前密码">
  </div>
  <div class="form-group">
    <label>新密码:</label>
    <input type="password" class="form-control" name="newPassword" placeholder="新密码">
  </div><p></p>
  <input type="submit" class="btn btn-primary" value="提交" />
</form>
</div>
<%
	boolean isModify = false;
	String logname = (String) session.getAttribute("logname");
	if (logname != null) {
		int m = logname.indexOf(",");
		logname = logname.substring(0, m);
		isModify = true;
	} else {
		response.sendRedirect("LGlogin.jsp");
	}
	String oldPassword = request.getParameter("oldPassword");
	String newPassword = request.getParameter("newPassword");
	boolean ok = oldPassword != null && newPassword != null;
	if (ok && oldPassword.trim().compareTo(newPassword.trim()) == 0) {
		out.print("<p>不能修改为相同的密码</p>");
	}else{
	if (ok && isModify) {
%>
<modifyPassword:LGModifyPassword logname="<%=logname%>"
	oldPassword="<%=oldPassword%>" newPassword="<%=newPassword%>" />
<h2 class="text-info"><%=giveResult%></h2>
<%}}%>
</body></html>
