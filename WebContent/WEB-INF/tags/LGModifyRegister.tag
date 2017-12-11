<%@ tag import="java.sql.*"%>
<%@ tag import="com.res.MyResource"%>
<%@ tag pageEncoding="gb2312"%>
<%@ attribute name="logname" required="true"%>
<%@ attribute name="email" required="true"%>
<%@ attribute name="address" required="true"%>
<%@ attribute name="realname" required="true"%>
<%@ attribute name="phone" required="true"%>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END"%>
<%
//	byte[] c = email.getBytes("iso-8859-1");
//	email = new String(c);
//	c = address.getBytes("iso-8859-1");
//	address = new String(c);
//	c = realname.getBytes("iso-8859-1");
//	realname = new String(c);
//	c = phone.getBytes("iso-8859-1");
//	phone = new String(c);
	try {
		Class.forName(MyResource.DRIVER);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	StringBuffer str = new StringBuffer();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	try {
		con = DriverManager.getConnection(MyResource.getURI());
		String updateCondition = "UPDATE lguser SET phone=?,email=?,address=?,realname=? WHERE logname=?";
		ps = con.prepareStatement(updateCondition);
		ps.setString(1, phone);
		ps.setString(2, email);
		ps.setString(3, address);
		ps.setString(4, realname);
		ps.setString(5, logname);
		int m = ps.executeUpdate();
		if (m == 1) {
			str.append("修改信息成功");
		} else {
			str.append("更新失败");
		}
		con.close();
	} catch (SQLException exp) {
		str.append("更新失败！");
		exp.printStackTrace();
	}
	jspContext.setAttribute("giveResult", str);
%>
