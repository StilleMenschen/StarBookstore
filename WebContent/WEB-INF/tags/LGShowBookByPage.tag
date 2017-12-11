<%@ tag import="java.sql.*"%>
<%@ tag import="com.sun.rowset.*"%>
<%@ tag import="com.res.MyResource"%>
<%@ tag pageEncoding="gb2312"%>
<%@ attribute name="bookAmountInPage" required="true"%>
<%@ attribute name="page" required="true"%>
<%@ attribute name="zuduanAmount" required="true"%>
<%@ variable name-given="showPage" variable-class="java.lang.Integer" scope="AT_END"%>
<%@ variable name-given="pageAllCount" variable-class="java.lang.Integer" scope="AT_END"%>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END"%>
<%
	try {
		Class.forName(MyResource.DRIVER);
	} catch (ClassNotFoundException e) {
		out.print(e);
		e.printStackTrace();
	}
	Connection con;
	Statement ps;
	ResultSet rs;
	int pageSize = Integer.parseInt(bookAmountInPage); //ÿҳ��ʾ�ļ�¼��
	int allPages = 0; //��ҳ�����ҳ��
	int currentPage = Integer.parseInt(page); //��ǰ��ʾҳ 
	StringBuffer presentPageResult; //��ǰҳ�ϵ�����
	CachedRowSetImpl rowSet;
	presentPageResult = new StringBuffer();
	try {
		con = DriverManager.getConnection(MyResource.getURI());
		ps = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		String s = "SELECT * FROM lgbookForm";
		rs = ps.executeQuery(s);
		int m = 0, n = 0;
		rowSet = new CachedRowSetImpl(); //�����м�����
		rowSet.populate(rs);
		con.close(); //�ر����� 
		rowSet.last();
		m = rowSet.getRow(); //������
		if (m >= 1) {
			n = pageSize;
			allPages = ((m % n) == 0) ? (m / n) : (m / n + 1);
			if (currentPage > allPages) {
				currentPage = 1;
			}
			if (currentPage <= 0) {
				currentPage = allPages;
			}
			jspContext.setAttribute("showPage", new Integer(currentPage));
			jspContext.setAttribute("pageAllCount", new Integer(allPages));
			presentPageResult.append("<table class=\"table table-hover\">");
			presentPageResult.append("<thead><tr>");
			presentPageResult.append("<th>����</th>");
			presentPageResult.append("<th>ISBN</th>");
			presentPageResult.append("<th>ͼ������</th>");
			presentPageResult.append("<th>����</th>");
			presentPageResult.append("<th>�۸�</th>");
			presentPageResult.append("<th>������</th>");
			presentPageResult.append("<th>����</th></tr></thead><tbody>");
			rowSet.absolute((currentPage - 1) * pageSize + 1);
			int clos = 6;
			clos = Integer.parseInt(zuduanAmount);
			for (int i = 1; i <= pageSize; i++) {
				presentPageResult.append("<tr>");
				String bookISBN = "";
				for (int k = 1; k <= clos; k++) {
					if (k == 1) {
						String bookPic = "<img src=\"" + rowSet.getString(k)
								+ "\" width=\"70\" height\"=100\" />";
						presentPageResult.append("<td>" + bookPic + "</td>");
					} else if (k == 2) {
						bookISBN = rowSet.getString(k);
						String bookISBNLink = "<a href=\"LGlookBookAbstract.jsp?bookISBN=" + bookISBN + "\">"
								+ bookISBN + "</a>";
						presentPageResult.append("<td>" + bookISBNLink + "</td>");
					} else if (k == 3) {
						String bookName = rowSet.getString(k);
						String bookNameLink = "<a href=\"LGlookBookAbstract.jsp?bookISBN=" + bookISBN + "\">"
								+ bookName + "</a>";
						presentPageResult.append("<td>" + bookNameLink + "</td>");
					} else {
						presentPageResult.append("<td>" + rowSet.getString(k) + "</td>");
					}

				}
				String buy = "<a href=\"LGlookPurchase.jsp?buyISBN=" + bookISBN + "\">����</a>";
				presentPageResult.append("<td>" + buy + "</td>");
				presentPageResult.append("</tr>");
				boolean boo = rowSet.next();
				if (boo == false)
					break;
			}
			presentPageResult.append("</tbody></table>");
			jspContext.setAttribute("giveResult", presentPageResult);
		} else {
			jspContext.setAttribute("showPage", new Integer(0));
			jspContext.setAttribute("pageAllCount", new Integer(0));
			jspContext.setAttribute("giveResult", new StringBuffer("û��ͼ������"));
		}
		con.close();
	} catch (SQLException exp) {
		jspContext.setAttribute("showPage", new Integer(0));
		jspContext.setAttribute("pageAllCount", new Integer(0));
		jspContext.setAttribute("giveResult", new StringBuffer("" + exp));
	}
%>
