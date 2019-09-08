<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%
 String selectValue=request.getParameter("myselect");
 String radioValue=request.getParameter("rgroup");
 String checkboxValue=request.getParameter("cbox");
 String mydateValue=request.getParameter("mydate");
%>
</head>
<body>
<select name="myselect">
   <% if(selectValue.equals("zero")){%>
	   <option value="zero" selected>请选择</option>
	   <option value="one" >第一项</option>
	   <option value="two" >第二项</option>
	   <option value="three" >第三项</option>  
   <%}else if(selectValue.equals("one")){%>
     <option value="zero">请选择 </option>
     <option value="one"  selected>第一项</option>
	   <option value="two" >第二项</option>
	   <option value="three" >第三项</option>  
   <%}else if(selectValue.equals("two")){%>
     <option value="zero">请选择 </option>
     <option value="one"  >第一项</option>
	   <option value="two" selected >第二项</option>
	   <option value="three" >第三项</option>  
	      <%}else if(selectValue.equals("three")){%>
     <option value="zero">请选择 </option>
     <option value="one"  >第一项</option>
	   <option value="two" >第二项</option>
	   <option value="three" selected >第三项</option> 
	   <%} %> 
</select><br><br>

<%if(radioValue==null) {%>
性别：<input type="radio" name="rgroup" value="男">男
    <input type="radio" name="rgroup" value="女">女
<%}else if(radioValue.equals("male")){ %>
性别：<input type="radio" name="rgroup" value="男" checked>男
    <input type="radio" name="rgroup" value="女">女
<%}else{ %>
性别：<input type="radio" name="rgroup" value="男">男
    <input type="radio" name="rgroup" value="女" checked>女
<%}%><br/><br/>

<%if(checkboxValue==null){%>
已婚：<input type="checkbox" name="cbox">
<%}else{%>
已婚：<input type="checkbox" name="cbox" checked>
<%}%><br/><br/>
已选择日期:<input type="text" name="mydate" onClick="return SelectDate(this,'yyyy-MM-dd');" value="<%=mydateValue%>">
</body>
</html>
<script language="javascript" src="WebCalendar.js"></script>