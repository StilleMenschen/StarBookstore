<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bookAbstract" %>
<% request.setCharacterEncoding("gb2312"); %>
<!DOCTYPE HTML><html>
<head><meta charset=gb2312>
<title>图书摘要（abstract）</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt" %>
<%String bookISBN=request.getParameter("bookISBN");%>      
<bookAbstract:LGBookAbstract bookISBN="<%=bookISBN%>" />
<p></p>
<div class="container"><%=giveResult%></div>
</body></html>
