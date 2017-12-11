<%@	tag import="com.res.MyResource"%>
<%@ tag import="java.sql.*"%>
<%@ tag pageEncoding="gb2312"%>
<%@ attribute name="logname" required="true"%>
<%@ attribute name="oldPassword" required="true"%>
<%@ attribute name="newPassword" required="true"%>
<%@ variable name-given="giveResult"
	variable-class="java.lang.StringBuffer" scope="AT_END"%>
<%
	try {
		Class.forName(MyResource.DRIVER);
	} catch (ClassNotFoundException e) {
		out.print(e);
		e.printStackTrace();
	}
	StringBuffer str = new StringBuffer();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	try {
		con = DriverManager.getConnection(MyResource.getURI());
		String s = "SELECT * FROM lguser WHERE logname=? AND password=?";
		ps = con.prepareStatement(s);
		ps.setString(1, logname);
		ps.setString(2, oldPassword);
		rs = ps.executeQuery();
		if (rs.next()) {
			String updateString = "UPDATE lguser SET password=? WHERE logname=?";
			ps = con.prepareStatement(updateString);
			ps.setString(1, newPassword);
			ps.setString(2, logname);
			int m = ps.executeUpdate();
			if (m == 1) {
				str.append("密码更新成功");
			} else {
				str.append("密码更新失败");
			}
		} else {
			str.append("密码更新失败");
		}
		ps.close();
		con.close();
	} catch (SQLException exp) {
		str.append("密码更新失败" + exp);
		exp.printStackTrace();
	}
	jspContext.setAttribute("giveResult", str);
%>
