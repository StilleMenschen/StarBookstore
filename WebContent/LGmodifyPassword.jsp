<%@ page contentType="text/html;charset=GB2312"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyPassword"%>
<%	request.setCharacterEncoding("gb2312");%>
<!DOCTYPE HTML><html>
<head><meta charset=gb2312>
<title>�޸�����</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt"%>
<div class="container">
<form action="" method="post" accept-charset="gb2312" class="form-inline">
<h3 class="text-muted">���������ĵ�ǰ�������������:</h3>
  <div class="form-group">
    <label>��ǰ����:</label>
    <input type="password" class="form-control" name="oldPassword" placeholder="��ǰ����">
  </div>
  <div class="form-group">
    <label>������:</label>
    <input type="password" class="form-control" name="newPassword" placeholder="������">
  </div><p></p>
  <input type="submit" class="btn btn-primary" value="�ύ" />
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
		out.print("<p>�����޸�Ϊ��ͬ������</p>");
	}else{
	if (ok && isModify) {
%>
<modifyPassword:LGModifyPassword logname="<%=logname%>"
	oldPassword="<%=oldPassword%>" newPassword="<%=newPassword%>" />
<h2 class="text-info"><%=giveResult%></h2>
<%}}%>
</body></html>
