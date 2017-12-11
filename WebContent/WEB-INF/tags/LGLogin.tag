<%@ tag import="java.sql.*"%>
<%@ tag import="com.res.MyResource"%>
<%@ tag pageEncoding="gb2312"%>
<%@ attribute name="logname" required="true"%>
<%@ attribute name="password" required="true"%>
<%@ variable name-given="backMess" scope="AT_END"%>
<%
	/* byte[] a = logname.getBytes("iso-8859-1");
	logname = new String(a);
	byte[] b = password.getBytes("iso-8859-1");
	password = new String(b); */
	String mess = "";
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	if (logname == null || logname.length() <= 0 || password == null || password.length() <= 0) {
		mess = "还没有登录或您输入的用户名不存在、或密码不般配";
	} else {
		String loginMess = (String) session.getAttribute("logname");
		if (loginMess == null) {
			loginMess = "";
		}
		String str = logname + "," + password;
		if (loginMess.equals(str) || loginMess.compareTo(str) == 0) {
			mess = logname + "已经登录了";
		} else {
			try {
				Class.forName(MyResource.DRIVER);
				con = DriverManager.getConnection(MyResource.getURI());
				String sql = "SELECT * FROM lguser WHERE logname=? AND password=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, logname);
				ps.setString(2, password);
				rs = ps.executeQuery();
				if (rs.next()) {
					mess = logname + "登录成功";
					str = logname + "," + password;
					session.setAttribute("logname", str);
				} else {
					mess = "您输入的用户名" + logname + "不存在，或密码不般配";
				}
				ps.close();
				con.close();
			} catch (Exception e) {
				mess = "问题:" + e;
				e.printStackTrace();
			}
		}
	}
	jspContext.setAttribute("backMess", mess);
%>
