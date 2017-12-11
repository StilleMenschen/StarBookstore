<%@ tag import="java.util.*"%>
<%@ tag import="java.sql.*"%>
<%@ tag import="com.res.MyResource"%>
<%@ tag pageEncoding="gb2312"%>
<%@ attribute name="logname" required="true"%>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END"%>
<%@ variable name-given="totalPrice" variable-class="java.lang.Float" scope="AT_END"%>
<%
	try {
		Class.forName(MyResource.DRIVER);
	} catch (ClassNotFoundException e) {
		out.print(e);
		e.printStackTrace();
	}
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	StringBuffer orderMess = new StringBuffer();
	try {
		con = DriverManager.getConnection(MyResource.getURI());
		Enumeration<String> keys = session.getAttributeNames();
		float sum = 0;
		while (keys.hasMoreElements()) {
			String key = (String) keys.nextElement();
			boolean isTrue = (!(key.equals("logname")))
					&& (key.endsWith(logname));
			if (isTrue) {
				String bookISBN = (String) session.getAttribute(key);
				String sqlStatement = "SELECT * FROM lgbookForm WHERE bookISBN=?";
				ps = con.prepareStatement(sqlStatement);
				ps.setString(1, bookISBN);
				rs = ps.executeQuery();
				while (rs.next()) {
					bookISBN = rs.getString("bookISBN");
					String bookName = rs.getString("bookName");
					String bookAuthor = rs.getString("bookAuthor");
					String bookPublish = rs.getString("bookPublish");
					float bookPrice = rs.getInt("bookPrice");
					sum	+= bookPrice;
					orderMess.append("<p>ISBN：" + bookISBN + " 书名："
							+ bookName + "<br>作者：" + bookAuthor + " 出版社："
							+ bookPublish + "<br>价格：￥" + bookPrice+"</p>");
				}
			}
		}
		jspContext.setAttribute("giveResult", orderMess);
		jspContext.setAttribute("totalPrice", new Float(sum));
	} catch (SQLException exp) {
		jspContext.setAttribute("giveResult", new StringBuffer("没有订单"));
		jspContext.setAttribute("totalPrice", new Float(-1));
		exp.printStackTrace();
	}
%>
