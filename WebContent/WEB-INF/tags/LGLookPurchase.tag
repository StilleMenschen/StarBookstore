<%@ tag import="java.sql.*"%>
<%@ tag import="java.util.*"%>
<%@ tag import="com.res.MyResource"%>
<%@ tag pageEncoding="gb2312"%>
<%@ attribute name="logname" required="true"%>
<%@ variable name-given="giveResult"
	variable-class="java.lang.StringBuffer" scope="AT_END"%>
<%@ variable name-given="price" variable-class="java.lang.Float"
	scope="AT_END"%>
<%
	float totalPrice = 0;
	String bookISBN;
	String bookName;
	String bookPublish;
	float bookPrice;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	StringBuffer str = new StringBuffer();
	try {
		Class.forName(MyResource.DRIVER);
	} catch (ClassNotFoundException e) {
		str.append(e);
		e.printStackTrace();
	}
	Enumeration<String> keys = session.getAttributeNames();
	str.append("<table class=\"table table-striped\">");
	while (keys.hasMoreElements()) {
		String key = (String) keys.nextElement();
		boolean isTrue = (!(key.equals("logname")))
				&& (key.endsWith(logname));
		if (isTrue) {
			bookISBN = (String) session.getAttribute(key);
			String sqlStatement = "SELECT * FROM lgbookForm WHERE bookISBN = ?";
			try {
				con = DriverManager.getConnection(MyResource.getURI());
				ps = con.prepareStatement(sqlStatement);
				ps.setString(1, bookISBN);
				rs = ps.executeQuery();
				while (rs.next()) {
					bookISBN = rs.getString("bookISBN");
					bookName = rs.getString("bookName");
					bookPublish = rs.getString("bookPublish");
					bookPrice = rs.getFloat("bookPrice");
					totalPrice = totalPrice + bookPrice;
					str.append("<tr>");
					str.append("<td>" + bookISBN + "</td>");
					str.append("<td>" + bookName + "</td>");
					str.append("<td>" + bookPublish + "</td>");
					str.append("<td>£¤" + bookPrice + "</td>");
					String del = "<a href=\"LGlookPurchase.jsp?deletedISBN="
							+ bookISBN + "\">É¾³ý</a>";
					str.append("<td>" + del + "</td>");
					str.append("</tr>");
				}
				ps.close();
				con.close();
			} catch (SQLException exp) {
				str.append(exp);
				exp.printStackTrace();
			}
		}
	}
	str.append("</table>");
	jspContext.setAttribute("giveResult", str);
	jspContext.setAttribute("price", new Float(totalPrice));
%>
