<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="showBookByPage"%>
<% request.setCharacterEncoding("gb2312"); %>
<!DOCTYPE HTML><html>
<head><meta charset=gb2312>
<title>���ͼ����Ϣ</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt" %>
<% String number=request.getParameter("page");
    if(number==null||number.length()<=0){ number="1"; }
    String amount="5"; //ÿҳ��ʾ�ļ�¼��Ŀ
%>
<h4 class="text-warning">ÿҳ�����ʾ<%=amount %>��ͼ��</h4>
<showBookByPage:LGShowBookByPage zuduanAmount="6" bookAmountInPage="<%=amount %>" page="<%=number %>"/>
<div class="container"><%=giveResult%></div>
<p class="text-muted">��<%=pageAllCount%>ҳ,��ǰΪ��<%=showPage%>ҳ</p>
<% int m=showPage.intValue(); %>
<%if(1<pageAllCount){ %>
<a href ="LGlookBook.jsp?page=<%=m-1%>">��һҳ</a>
<a href ="LGlookBook.jsp?page=<%=m+1%>">��һҳ</a>
<form action="" method="get" accept-charset="gb2312" class="form-inline">
<div class="input-group">
 <span class="input-group-addon">����ҳ��:</span>
  <input type="text" class="form-control" name="page" placeholder="ҳ��" >
 <span class="input-group-btn">
  <input type="submit" class="btn btn-primary" value="�ύ" />
 </span>
 </div>
</form>
<%} %>
</body></html>
