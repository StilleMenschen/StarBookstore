<%@ tag import="com.res.MyResource"%>
<%@ tag import="java.sql.*"%>
<%@ tag import="java.util.*"%>
<%@ tag pageEncoding="gb2312"%>
<%@ attribute name="logname" required="true"%>
<%@ attribute name="orderContent" required="true"%>
<%@ attribute name="totalPrice" required="true"%>
<%@ variable name-given="giveResult"
	variable-class="java.lang.StringBuffer" scope="AT_END"%>
<%@ variable name-given="dingdanNumber" variable-class="java.lang.Long"
	scope="AT_END"%>
<%
	String user = (String) session.getAttribute("logname");
	if (user == null) {
		response.sendRedirect("LGlogin.jsp");
	}
	float sum = Float.parseFloat(totalPrice);
	Connection con;
	Statement ps;
	ResultSet rs;
	int orderNumber = 0;
	int max = orderNumber;
	String sqlStatement = "";
	try {
		Class.forName(MyResource.DRIVER);
		con = DriverManager.getConnection(MyResource.getURI());
		ps = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		rs = ps.executeQuery("SELECT * FROM lgorderForm");
		while (rs.next()) {
			int n = rs.getInt("orderNumber");
			if (n >= max)
				max = n;
		}
		orderNumber = max + 1;
		sqlStatement = "INSERT INTO lgorderForm VALUES (" + orderNumber + ",'" + logname + "','" + orderContent
				+ "'," + sum + ")";
		//byte [] bb=psStatement.getBytes("iso-8859-1");
		//psStatement = new String(bb);
		ps.executeUpdate(sqlStatement);
		StringBuffer strMess = new StringBuffer();
		sqlStatement = "SELECT * FROM lgorderForm WHERE orderNumber = " + orderNumber;
		rs = ps.executeQuery(sqlStatement);
		strMess.append("<table class=\"table\">");
		strMess.append("<tr class=\"info\">");
		strMess.append("<th>订单号</th>");
		strMess.append("<th>订单内容</th>");
		strMess.append("<th>总价格</th>");
		strMess.append("</tr>");
		while (rs.next()) {
			String idNumber = rs.getString("orderNumber");
			String orderMess = rs.getString("orderMess");
			float priceSum = rs.getFloat("sum");
			strMess.append("<tr class=\"info\">");
			strMess.append("<td>" + idNumber + "</td>");
			strMess.append("<td>" + orderMess + "</td>");
			strMess.append("<td>￥" + priceSum + "</td>");
			strMess.append("</tr>");
		}
		strMess.append("</table>");
		jspContext.setAttribute("giveResult", strMess);
		jspContext.setAttribute("dingdanNumber", new Long(orderNumber));
		ps.close();
		con.close();
		Enumeration<String> enums = session.getAttributeNames();
		while (enums.hasMoreElements()) {
			String key = enums.nextElement();
			if (key.matches("^\\d+," + logname + "$")) {
				session.removeAttribute(key);
			}
		}
	} catch (Exception e) {
		jspContext.setAttribute("giveResult", new StringBuffer("" + e));
		jspContext.setAttribute("dingdanNumber", new Long(-1));
		e.printStackTrace();
	}
%>
