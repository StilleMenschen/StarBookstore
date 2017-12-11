<%@ page import="com.res.MyResource"%>
<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("gb2312");%>
<!DOCTYPE HTML><html>
<head><meta charset="gb2312">
<title>删除订单</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt"%>
<%
	String orderNumber = request.getParameter("deletedOrderNumber");
	int number = Integer.parseInt(orderNumber);
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	try {
		Class.forName(MyResource.DRIVER);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	try {
		con = DriverManager.getConnection(MyResource.getURI());
		String condition = "DELETE FROM lgorderForm WHERE orderNumber=?";
		ps = con.prepareStatement(condition);
		ps.setInt(1, number);
		if(0<ps.executeUpdate()){
			out.print("<h3 class=\"text-success\">订单号为" + number + "的订单被删除</h3>");
		}else{
			out.print("<h3 class=\"text-danger\">没有订单被删除</h3>");
		}
		ps.close();
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
<a href="LGqueryOrderForm.jsp" class="btn btn-info">我知道了</a>
</body></html>
