<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="makeBookForm" %>
<%request.setCharacterEncoding("gb2312");%>
<!DOCTYPE HTML><html>
<head><meta charset="gb2312"/>
<title>订单确认</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt" %>
<%
	String logname = (String) session.getAttribute("logname");
	if (logname == null) {
		response.sendRedirect("LGlogin.jsp");
	} else {
		int m = logname.indexOf(",");
		logname = logname.substring(0, m);
	}
	String confirm = request.getParameter("confirm");
	String orderContent = request.getParameter("orderContent");
	String totalPrice = request.getParameter("totalPrice");
	if (confirm == null) {confirm = "";}
	if (orderContent == null) {orderContent = "";}
	if (totalPrice == null) {totalPrice = "0";}
	if (confirm.equals("buy")||confirm.compareTo("buy")==0) {
%>
<makeBookForm:LGMakeBookForm logname="<%=logname%>"
	orderContent="<%=orderContent%>" totalPrice="<%=totalPrice%>" />
<h3>付款后发货</h3>
<p class="text-primary"><%=logname%>当前的订单号:<%=dingdanNumber%></p>
<p class="text-info">订单信息</p>
<div class="container"><%=giveResult%></div>
<%}%>
</body></html>
