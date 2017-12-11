<%@ page language="java" contentType="text/html;charset=GB2312" pageEncoding="GB2312"%>
<%@ page import="com.res.MyResource"%>
<!DOCTYPE HTML><html>
<head><meta charset="GB2312"/>
<title>关于</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt" %>
<div class="container">
<%pageContext.setAttribute("ss", MyResource.getAbout());%>
<h3 class="text-primary">${pageScope.ss[0]}</h3>
<h3 class="text-primary">${pageScope.ss[1]}&nbsp;${pageScope.ss[2]}</h3>
</div></body></html>
