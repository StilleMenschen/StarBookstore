<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="lookPurchase"%>
<!DOCTYPE HTML><html>
<head><meta charset="gb2312"/>
<title>�鿴���ﳵ</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt" %>
<%   boolean isAdd=false;
     String logname=(String)session.getAttribute("logname");
     if(logname!=null){  
       int m=logname.indexOf(",");
       logname=logname.substring(0,m);
       isAdd=true;
     }else{
        response.sendRedirect("LGlogin.jsp");
     }
     String buyISBN=request.getParameter("buyISBN");
     if((buyISBN!=null)&&isAdd){
        session.setAttribute(buyISBN+","+logname,buyISBN);
     }
     String deletedISBN=request.getParameter("deletedISBN");
     if((deletedISBN!=null)&&isAdd){
        session.removeAttribute(deletedISBN+","+logname);
     }
%>
<lookPurchase:LGLookPurchase logname="<%=logname%>"/>
<%if(price>0){%>
<h2 class="text-info"><%=logname%>�Ĺ��ﳵ��������ͼ��:</h2>
<div class="container"><%=giveResult %></div>
<p class="text-info">�鼮�۸��ܼ�:��<%=String.format("%.2f", price) %></p>
<form action="LGpreviewOrderForm.jsp" method="post" accept-charset="gb2312">
<div class="btn-group">
<button type="button" class="btn btn-info" onclick="window.history.back();">����</button>
<input type="submit" class="btn btn-primary" value="���ɶ���" />
</div>
</form>
<%}else{%>
<h2 class="text-warning"><%=logname%>���ﳵ��û��ͼ�飡</h2>
<%}%>
</body></html>
