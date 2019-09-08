<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="B.jsp" method="post">
  <select name="myselect">
      <option value="zero">请选择</option>
       <option value="one">第一项</option>
        <option value="two">第二项</option>
         <option value="three">第三项</option>
  </select><br/><br/>
  性别：<input type="radio" name="rgroup" value="male">男
  <input type="radio" name="rgroup" value="female">女<br/><br/>
  已婚：<input type="checkbox" name="cbox"><br/><br/>
  <input type="text" name="mydate" onClick="return SelectDate(this,'yyyy-MM-dd');"><br/><br/>
  <input type="submit" value="提交">
</form>
</body>
</html>
<script language="javascript" src="WebCalendar.js"></script>