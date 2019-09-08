<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>成绩修改</title>
</head>
<body>
<center>
      <FONT size=5><b>成绩修改</b></FONT>
      <font size=4>
      <FORM action="update_2.jsp" Method=post>
      <br/><br/>
      输入修改者的学号：<Input type="text" name="number" value=" "><br/>
      输入新的数学成绩：<Input type="text" name="math" value="0"><br/>
      输入新的英语成绩：<Input type="text" name="english" value="0"><br/>
      输入新的物理成绩：<Input type="text" name="physics" value="0"><br/>
      输入新的物理成绩：<Input type="text" name="javas" value="0"><br/>
  <p></p><input type="submit" name="b" value="更新" ><br/>
      </FORM>
      </font>
      <%
        String xiugai=(String)session.getAttribute("xiugai");
      out.println(xiugai);
      %>
      <br/><br/>
      <a href="LoginSuccess.jsp">返回</a>
</center>
</body>
</html>