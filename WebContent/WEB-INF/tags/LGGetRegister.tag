<%@ tag import="java.sql.*"%>
<%@ tag import="com.res.MyResource"%>
<%@ tag pageEncoding="gb2312"%>
<%@ attribute name="logname" required="true"%>
<%@ variable name-given="oldEmail" scope="AT_END"%>
<%@ variable name-given="oldAddress" scope="AT_END"%>
<%@ variable name-given="oldRealname" scope="AT_END"%>
<%@ variable name-given="oldPhone" scope="AT_END"%>
<%
	try {
		Class.forName(MyResource.DRIVER);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	StringBuffer str = new StringBuffer();
	Connection con;
	Statement sql;
	ResultSet rs;
	try {
		con = DriverManager.getConnection(MyResource.getURI());
		String query = "SELECT phone,email,address,realname "
				+ " FROM lguser WHERE logname='" + logname + "'";
		sql = con.createStatement();
		rs = sql.executeQuery(query);
		if (rs.next()) {
			jspContext.setAttribute("oldPhone", rs.getString("phone"));
			jspContext.setAttribute("oldEmail", rs.getString("email"));
			jspContext.setAttribute("oldAddress",
					rs.getString("address"));
			jspContext.setAttribute("oldRealname",
					rs.getString("realname"));
		} else {
			jspContext.setAttribute("oldPhone", "");
			jspContext.setAttribute("oldEmail", "");
			jspContext.setAttribute("oldAddress", "");
			jspContext.setAttribute("oldRealname", "");
		}
		con.close();
	} catch (SQLException exp) {
		jspContext.setAttribute("oldPhone", "");
		jspContext.setAttribute("oldEmail", "");
		jspContext.setAttribute("oldAddress", "");
		jspContext.setAttribute("oldRealname", "");
		exp.printStackTrace();
	}
%>
