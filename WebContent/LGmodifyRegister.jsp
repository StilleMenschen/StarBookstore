<%@ page contentType="text/html;charset=GB2312"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyRegister"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="getRegister"%>
<%request.setCharacterEncoding("gb2312");%>
<!DOCTYPE HTML><html>
<head><meta charset="gb2312" />
<title>�޸�ע����Ϣ</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt"%>
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
%>
<getRegister:LGGetRegister logname="<%=logname%>" />
<div class="container">
<form action="" method="post" accept-charset="gb2312" class="form-inline">
<p class="text-info">������������Ϣ:</p>
<div class="form-group">
<div class="input-group">
      <div class="input-group-addon">�����ʼ�:</div>
      <input type="email" class="form-control" name="email" value="<%=oldEmail%>" placeholder="�����ʼ�">
  </div><p></p>
  <div class="input-group">
      <div class="input-group-addon">��ʵ����:</div>
      <input type="text" class="form-control" name="realname" value="<%=oldRealname%>" placeholder="��ʵ����">
  </div><p></p>
  <div class="input-group">
      <div class="input-group-addon">��ϵ�绰:</div>
      <input type="text" class="form-control" name="phone" value="<%=oldPhone%>" placeholder="��ϵ�绰">
  </div><p></p>
<div class="input-group">
      <div class="input-group-addon">ͨ�ŵ�ַ:</div>
      <input type="text" class="form-control" name="address" value="<%=oldAddress%>" placeholder="ͨ�ŵ�ַ">
  </div><p></p>
<input type="submit" class="btn btn-primary" name="enter" value="�ύ">
</div>
</form>
</div>
<%
if(null!=request.getParameter("enter")){
	String enter = request.getParameter("enter");
	String email = request.getParameter("email");
	String realname = request.getParameter("realname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	if(isModify){
%>
<modifyRegister:LGModifyRegister logname="<%=logname%>"
email="<%=email%>" phone="<%=phone%>" address="<%=address%>"
realname="<%=realname%>" />
<h2 class="text-info"><%=giveResult%></h2>
<p class="text-info">2���ˢ��ҳ��</p>
<%
response.setHeader("Refresh", "2");
}}%>
</body></html>
