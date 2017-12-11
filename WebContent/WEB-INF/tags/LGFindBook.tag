<%@ tag import="java.sql.*"%>
<%@ tag import="com.res.MyResource"%>
<%@ tag pageEncoding="gb2312"%>
<%@ attribute name="findContent" required="true"%>
<%@ attribute name="condition" required="true"%>
<%@ attribute name="findMethod" required="true"%>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END"%>
<%
	//byte b[] = findContent.getBytes("iso-8859-1");
	//findContent = new String(b);
	if (findContent.compareTo("") == 0 || findContent.length() <= 0) {
		jspContext.setAttribute("giveResult", new StringBuffer("<p class=\"text-danger\">请给出查询条件</p>"));
	} else {
		try {
			Class.forName(MyResource.DRIVER);
		} catch (ClassNotFoundException e) {
			out.print(e);
			e.printStackTrace();
		}
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		StringBuffer queryResult = new StringBuffer(); //查询结果
		try {
			con = DriverManager.getConnection(MyResource.getURI());
			String sql = "SELECT * FROM lgbookForm WHERE " + condition + " LIKE ";
			if (findMethod.equals("start")) {
				sql += " '" + findContent + "%'";
			}
			if (findMethod.equals("end")) {
				sql += " '%" + findContent + "'";
			}
			if (findMethod.equals("contains")) {
				sql += " '%" + findContent + "%'";
			}
			System.out.println("LGFindBook.tag:" + sql);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			queryResult.append("<div class=\"container\">");
			queryResult.append("<table class=\"table\">");
			queryResult.append("<thead><tr>");
			queryResult.append("<th>封面</th>");
			queryResult.append("<th>ISBN</th>");
			queryResult.append("<th>图书名称</th>");
			queryResult.append("<th>作者</th>");
			queryResult.append("<th>价格</th>");
			queryResult.append("<th>出版社</th>");
			queryResult.append("<th>操作</th></tr></thead></table></div>");
			queryResult.append("<div class=\"container mover\">");
			queryResult.append("<table class=\"table table-hover\"><tbody>");
			int clos = 6;
			while (rs.next()) {
				queryResult.append("<tr>");
				String bookISBN = "";
				for (int k = 1; k <= clos; k++) {
					if (k == 1) {
						String bookPic = "<img src=\"" + rs.getString(k) + "\" width=\"70\" height=\"100\"/>";
						queryResult.append("<td>" + bookPic + "</td>");
					} else if (k == 2) {
						bookISBN = rs.getString(k);
						String bookISBNLink = "<a href=\"LGlookBookAbstract.jsp?bookISBN=" + bookISBN + "\">"
								+ bookISBN + "</a>";
						queryResult.append("<td>" + bookISBNLink + "</td>");
					} else if (k == 3) {
						String bookName = rs.getString(k);
						String bookNameLink = "<a href=\"LGlookBookAbstract.jsp?bookISBN=" + bookISBN + "\">"
								+ bookName + "</a>";
						queryResult.append("<td>" + bookNameLink + "</td>");
					} else {
						queryResult.append("<td>" + rs.getString(k) + "</td>");
					}
				}
				String buy = "<a href=\"LGlookPurchase.jsp?buyISBN=" + bookISBN + "\">购买</a>";
				queryResult.append("<td>" + buy + "</td>");
			}
			queryResult.append("</tbody></table></div>");
			jspContext.setAttribute("giveResult", queryResult);
			con.close();
		} catch (SQLException exp) {
			jspContext.setAttribute("giveResult", new StringBuffer("<p class=\"text-danger\">请给出查询条件</p>"));
			exp.printStackTrace();
		}
	}
%>
