<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="register"%>
<% request.setCharacterEncoding("gb2312"); %>
<!DOCTYPE HTML><html>
<head><meta charset="gb2312"/>
<title>ע��ҳ��</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt" %>
<div class="container">
<form action="" method="post" accept-charset="gb2312" class="form-inline">
<p class="text-warning">����������Ϣ���û����в��ܰ����ж��ţ���*���������д��</p>
<div class="form-group">
<div class="input-group has-warning">
      <div class="input-group-addon">�û�����:</div>
      <input type="text" class="form-control" name="logname" placeholder="�û�����">
  </div><p></p>
<div class="input-group has-warning">
      <div class="input-group-addon">��������:</div>
      <input type="password" class="form-control" name="password" placeholder="��������">
  </div><p></p>
<div class="input-group">
      <div class="input-group-addon">�����ʼ�:</div>
      <input type="email" class="form-control" name="email" placeholder="�����ʼ�">
  </div><p></p>
<div class="input-group">
      <div class="input-group-addon">��ʵ����:</div>
      <input type="text" class="form-control" name="realname" placeholder="��ʵ����">
  </div><p></p>
<div class="input-group">
      <div class="input-group-addon">��ϵ�绰:</div>
      <input type="text" class="form-control" name="phone" placeholder="��ϵ�绰">
  </div><p></p>
<div class="input-group">
      <div class="input-group-addon">ͨ�ŵ�ַ:</div>
      <input type="text" class="form-control" name="address" placeholder="ͨ�ŵ�ַ">
  </div><p></p>
  <input type="submit" class="btn btn-primary" value="�ύ">
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
