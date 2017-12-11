<%@ page contentType="text/html;charset=GB2312" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="findBook"%>
<% request.setCharacterEncoding("gb2312"); %>
<!DOCTYPE HTML><html>
<head><meta charset=gb2312>
<title>��ѯͼ��</title>
<%@ include file="imports.txt" %></head>
<body><%@ include file="LGhead.txt" %>
<div style="height:16px;width:768px;margin:0 auto;"></div>
<form action="" method="post" accept-charset="gb2312">
<div class="container">
<div class="input-group">
 <span class="input-group-addon">�����ѯ����:</span>
 <input type="text" class="form-control" name="findContent" placeholder="��ѯ����">
 <span class="input-group-btn">
  <input type="submit" class="btn btn-primary" value="�ύ" />
 </span>
</div>
</div>
<div class="form-inner">
<select name="condition">
<option selected="selected" value="bookISBN">ISBN</option>
<option value="bookName">����</option>
<option value="bookAuthor">����</option>
</select>
<label class="radio-inline"><input type="radio" name="findMethod" value="start">ǰ��һ��</label>
<label class="radio-inline"><input type="radio" name="findMethod" value="end">��һ��</label>
<label class="radio-inline"><input type="radio" name="findMethod" value="contains" checked="checked">����</label>
</div>
</form>
<%
if(null!=request.getParameter("findContent")){
   String findContent = request.getParameter("findContent");
   String condition = request.getParameter("condition");
   String findMethod = request.getParameter("findMethod");
   if(findContent==null){
      findContent="";
   }
   if(condition==null){
      condition="";
   }
   if(findMethod==null){
      findMethod="";
   }
%>
<findBook:LGFindBook findContent="<%=findContent%>"
 condition="<%=condition%>" findMethod="<%=findMethod%>"/>
<%=giveResult%>
<%}else{ %>
<p class="text-warning noresult">���޲�ѯ���</p>
<%}%>
</body></html>
