<%@ page  contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>成绩录入</title>
</head>
<body>
<center>
  <p><font size=5><b>成绩录入</b></font></p>
  <FONT size=4>
  <FORM action="append_2.jsp" method=post>
                    同学学号:<input type="text" name="number"><br>
                    同学姓名:<input type="text" name="name"><br>
                    同学班级:<input type="text" name="classes"><br>
                    数学成绩:<input type="text" name="math"><br>
                    英语成绩:<input type="text" name="english"><br>
                    物理成绩:<input type="text" name="physics"><br> 
      Java成绩:<input type="text" name="javas"><br>
      <input type="submit" name="b" value="添加">
  </FORM>
  <br>
  <%
    String lr=(String)session.getAttribute("tianjia");
    if(lr==null) lr="";
  %>
  <p><font size="4" color="red">数据录入:<%=lr%></font></p>
  </FONT><br /> <br />
  <a href =" LoginSuccess.jsp">返回</a>
</center>
</body>
</html>