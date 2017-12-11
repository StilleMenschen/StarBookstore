<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="showBookByPage"%>
<% request.setCharacterEncoding("gb2312"); %>
<!DOCTYPE HTML><html>
<head><meta charset=gb2312>
<title>浏览图书信息</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt" %>
<% String number=request.getParameter("page");
    if(number==null||number.length()<=0){ number="1"; }
    String amount="5"; //每页显示的记录数目
%>
<h4 class="text-warning">每页最多显示<%=amount %>本图书</h4>
<showBookByPage:LGShowBookByPage zuduanAmount="6" bookAmountInPage="<%=amount %>" page="<%=number %>"/>
<div class="container"><%=giveResult%></div>
<p class="text-muted">共<%=pageAllCount%>页,当前为第<%=showPage%>页</p>
<% int m=showPage.intValue(); %>
<%if(1<pageAllCount){ %>
<a href ="LGlookBook.jsp?page=<%=m-1%>">上一页</a>
<a href ="LGlookBook.jsp?page=<%=m+1%>">下一页</a>
<form action="" method="get" accept-charset="gb2312" class="form-inline">
<div class="input-group">
 <span class="input-group-addon">输入页码:</span>
  <input type="text" class="form-control" name="page" placeholder="页码" >
 <span class="input-group-btn">
  <input type="submit" class="btn btn-primary" value="提交" />
 </span>
 </div>
</form>
<%} %>
</body></html>
