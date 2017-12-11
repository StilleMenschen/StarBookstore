<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="lookPurchase"%>
<!DOCTYPE HTML><html>
<head><meta charset="gb2312"/>
<title>查看购物车</title>
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
<h2 class="text-info"><%=logname%>的购物车中有如下图书:</h2>
<div class="container"><%=giveResult %></div>
<p class="text-info">书籍价格总计:￥<%=String.format("%.2f", price) %></p>
<form action="LGpreviewOrderForm.jsp" method="post" accept-charset="gb2312">
<div class="btn-group">
<button type="button" class="btn btn-info" onclick="window.history.back();">返回</button>
<input type="submit" class="btn btn-primary" value="生成订单" />
</div>
</form>
<%}else{%>
<h2 class="text-warning"><%=logname%>购物车中没有图书！</h2>
<%}%>
</body></html>
