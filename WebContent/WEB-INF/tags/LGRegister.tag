<%@ tag import="java.sql.*"%>
<%@ tag import="com.res.MyResource"%>
<%@ tag pageEncoding="gb2312"%>
<%@ attribute name="logname" required="true"%>
<%@ attribute name="password" required="true"%>
<%@ attribute name="email" required="true"%>
<%@ attribute name="address" required="true"%>
<%@ attribute name="realname" required="true"%>
<%@ attribute name="phone" required="true"%>
<%@ variable name-given="backMess" scope="AT_END"%>
<%
	boolean boo = true;
	if (logname.compareTo("") == 0 || logname.length() <= 0) {
		boo = false;
		jspContext.setAttribute("backMess", "请填写用户名！");
	} else if (password.compareTo("") == 0 || password.length() <= 0) {
		boo = false;
		jspContext.setAttribute("backMess", "请填写密码！");
	} else if (logname != null) {
		if (logname.matches("^.*[\\,\\@\\#\\$\\&\\%\\^\\*\\<\\>]+.*$")) {
			boo = false;
			jspContext.setAttribute("backMess", "注册失败(用户名中不能有：,@#$&^*<>等符号)");
		}
	}
	if (boo) {
		try {
			Class.forName(MyResource.DRIVER);
		} catch (ClassNotFoundException e) {
			out.print(e);
			e.printStackTrace();
		}
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		try {
			con = DriverManager.getConnection(MyResource.getURI());
			String sql = "INSERT INTO lguser VALUES (?,?,?,?,?,?)";
			//byte[] b = sql.getBytes("iso-8859-1");
			//sql = new String(b);
			ps = con.prepareStatement(sql);
			ps.setString(1, logname);
			ps.setString(2, password);
			ps.setString(3, phone);
			ps.setString(4, email);
			ps.setString(5, address);
			ps.setString(6, realname);
			if (0 < ps.executeUpdate()) {
				//byte[] c = logname.getBytes("iso-8859-1");
				//logname = new String(c);
				String mess = logname + "注册成功";
				jspContext.setAttribute("backMess", mess);
			} else {
				jspContext.setAttribute("backMess", "注册失败");
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			jspContext.setAttribute("backMess", "没有填写用户名或用户名已经被注册");
			e.printStackTrace();
		}
	}
%>
