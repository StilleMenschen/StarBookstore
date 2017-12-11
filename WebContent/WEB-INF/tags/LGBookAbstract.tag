<%@ tag import="java.sql.*"%>
<%@ tag import="com.res.MyResource"%>
<%@ tag pageEncoding="gb2312"%>
<%@ attribute name="bookISBN" required="true"%>
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
		String sql = "SELECT * FROM lgbookForm WHERE bookISBN=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, bookISBN);
		rs = ps.executeQuery();
		str.append("<form class=\"form-horizontal\">");
		str.append("<div class=\"form-group\">");
		str.append("<label class=\"col-sm-1 control-label\">书名:</label>");
		str.append("<div class=\"col-sm-10\">");
		while (rs.next()) {
			str.append("<input type=\"text\" class=\"form-control\" value=" + rs.getString("bookName")
					+ " placeholder=\"书名\">");
			str.append("</div>");
			str.append("</div>");
			str.append("<div class=\"form-group\">");
			str.append("<label class=\"col-sm-1 control-label\">摘要:</label>");
			str.append("<div class=\"col-sm-10\">");
			str.append("<textarea class=\"form-control\" rows=\"6\" style=\"resize:none;\" >"
					+ rs.getString("bookAbstract") + "</textarea>");
		}
		str.append("</div>");
		str.append("</div>");
		str.append("<div class=\"btn-group\">");
		str.append("<button type=\"reset\" class=\"btn btn-info\">重置</button>");
		str.append("<button type=\"button\" class=\"btn btn-primary\" onclick=\"window.history.back();\">返回</button>");
		str.append("</div>");
		str.append("</form>");
		/*
		str.append("<table border=\"1\" align=\"center\">");
		str.append("<tr>");
		str.append("<th>书名</th>");
		str.append("<th>摘要</th>");
		str.append("</tr>");
		while (rs.next()) {
			str.append("<tr>");
			str.append("<td>" + rs.getString("bookName") + "</td>");
			str.append("<td><textarea rows=\"8\" cols=\"40\">"
					+ rs.getString("bookAbstract") + "</textarea></td>");
			str.append("</tr>");
		}
		str.append("</table>");
		*/
		jspContext.setAttribute("giveResult", str);
		ps.close();
		con.close();
	} catch (SQLException exp) {
		jspContext.setAttribute("giveResult", new StringBuffer("" + exp));
		exp.printStackTrace();
	}
%>
