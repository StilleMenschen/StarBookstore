<%@ page contentType="text/html;charset=GB2312"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="queryOrderForm"%>
<%request.setCharacterEncoding("gb2312");%>
<!DOCTYPE HTML><html>
<head><meta charset="gb2312">
<title>�鿴����</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt"%>
<%
	String logname = (String) session.getAttribute("logname");
	if (logname == null) {
		response.sendRedirect("LGlogin.jsp");
	} else {
		int m = logname.indexOf(",");
		logname = logname.substring(0, m);
	}
%>
<queryOrderForm:LGQueryOrderForm logname="<%=logname%>" />
<%if(giveResult!=null&&giveResult.length()>0){ %>
<h3 class="text-muted"><%=logname%>��ȫ������:</h3>
<%=giveResult%>
<%}else{ %>
<h3 class="text-muted">���޶�����</h3>
<%} %>
</body></html>
