<%@ page contentType="text/html;charset=GB2312"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="previewOrderForm"%>
<%request.setCharacterEncoding("gb2312");%>
<!DOCTYPE HTML><html>
<head><meta charset=gb2312>
<title>��ǰ����(Ԥ��)</title>

<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt"%>
<%
	String logname = (String) session.getAttribute("logname");
	if (logname != null) {
		int m = logname.indexOf(",");
		logname = logname.substring(0, m);
%>
<previewOrderForm:LGPreviewOrderForm logname="<%=logname%>" />
<div class="container">
<h3 class="text-warning">�������ύ��������ť��ȷ�϶���</h3>
<h4>������Ϣ</h4>
<table class="table table-bordered">
<thead><tr class="active">
<th>������Ϣ</th><th>�ܼ۸�</th>
</tr></thead><tbody>
<tr class="active">
<td><%=giveResult%></td>
<td>��<%=totalPrice%></td>
</tr></tbody></table>
<form action="LGmakeBookForm.jsp" method="post" accept-charset="gb2312">
<input type="hidden" name="confirm" value="buy">
<input type="hidden" name="orderContent" value="<%=giveResult%>">
<input type="hidden" name="totalPrice" value="<%=totalPrice%>">
<div class="btn-group">
	<button type="button" class="btn btn-warning" onclick="window.history.back();">��������</button>
	<input type="submit" class="btn btn-success" value="�ύ����" />
</div></form></div>
<%}else{response.sendRedirect("LGlogin.jsp");}%>
</body></html>
