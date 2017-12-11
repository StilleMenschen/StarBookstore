<%@tag import="com.res.MyResource"%>
<%@ tag import="java.sql.*"%>
<%@ tag pageEncoding="gb2312"%>
<%@ attribute name="logname" required="true"%>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END"%>
<%
	StringBuffer str = new StringBuffer();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	try {
		Class.forName(MyResource.DRIVER);
		con = DriverManager.getConnection(MyResource.getURI());
		String s = "SELECT * FROM lgorderForm WHERE logname=?";
		ps = con.prepareStatement(s);
		ps.setString(1, logname);
		rs = ps.executeQuery();
		if(rs.first()){
			rs.previous();
			str=execText(rs,str);
		}else{
			str = null;
		}
		jspContext.setAttribute("giveResult", str);
	} catch (Exception e) {
		jspContext.setAttribute("giveResult",new StringBuffer("" + e));
		e.printStackTrace();
	}
%>
<%!
StringBuffer execText(ResultSet rs,StringBuffer str) throws SQLException{
	str.append("<div class=\"container\">");
	str.append("<table class=\"table\">");
	str.append("<thead><tr>");
	str.append("<th>订单号</th>");
	str.append("<th>订单用户</th>");
	str.append("<th>订单信息</th>");
	str.append("<th>总价格</th>");
	str.append("<th>操作</th></tr></thead></table></div>");
	str.append("<div class=\"container mover\">");
	str.append("<table class=\"table\"><tbody>");
	while (rs.next()) {
		str.append("<tr class=\"active\">");
		String orderNumber = rs.getString(1);
		str.append("<td>" + orderNumber + "</td>");
		str.append("<td>" + rs.getString(2) + "</td>");
		str.append("<td>" + rs.getString(3) + "</td>");
		str.append("<td>￥" + rs.getString(4) + "</td>");
		String del = "<a href=\"LGdeleteOrderNumber.jsp?deletedOrderNumber="
				+ orderNumber + "\">删除</a>";
		str.append("<td>" + del + "</td>");

		str.append("</tr>");
	}
	str.append("</tbody></table></div>");
	return str;
}
%>
