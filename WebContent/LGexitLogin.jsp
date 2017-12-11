<%@ page contentType="text/html;charset=GB2312" pageEncoding="gb2312" %>
<!DOCTYPE HTML><html>
<head><meta charset=gb2312>
<title>退出登录</title>
<%@ include file="imports.txt" %>
</head><body>
<p></p>
<%@ include file="LGhead.txt" %>
<%   
     String logname=(String)session.getAttribute("logname");
     if(logname!=null){  
         int m=logname.indexOf(",");
         logname=logname.substring(0,m);
         session.invalidate();
         out.print("<h3 class=\"text-info\">用户<u>"+logname+"</u>退出</h3>");
     }else{
        response.sendRedirect("LGlogin.jsp");
     } 
%> 
</body></html>
