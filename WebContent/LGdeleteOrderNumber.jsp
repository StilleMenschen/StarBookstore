<%@ page import="com.res.MyResource"%>
<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("gb2312");%>
<!DOCTYPE HTML><html>
<head><meta charset="gb2312">
<title>ɾ������</title>
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
			out.print("<h3 class=\"text-success\">������Ϊ" + number + "�Ķ�����ɾ��</h3>");
		}else{
			out.print("<h3 class=\"text-danger\">û�ж�����ɾ��</h3>");
		}
		ps.close();
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
<a href="LGqueryOrderForm.jsp" class="btn btn-info">��֪����</a>
</body></html>
