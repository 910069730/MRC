<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>删除记录</title>
</head>
<body>
<center>
    <font size=5><b>删除记录</b></font>
    <font size=4>
    <form action="del_2.jsp" method=post name="delform">
       <table>
          <tr>
              <th align=left>
                  <font size=4> 输入学号:</font><Input type="text" name="number">
              </th>
          </tr>
              <th align=center><br/>
                  <Input type="submit" name="b" onClick="datacheck()" value="删除">
              </th>
          </tr>
       </table>
    </form><br/><br/>
    <%
      String del=(String)session.getAttribute("del");
    if(del==null) del="";
    out.println(del);
    %>
    <br/><br/>
    <a href ="LoginSuccess.jsp">返回</a>
    </font>
</center>
</body>
</html>
<script>
//下面是对学号检查的函数定义
//确保前台数据的合法
   function datachack(){
	   //下面的if判断语句将检查是否输入学号
	   if(delform.number.value==""){
		   window.alert("您必须输入学号!"); //显示错误信息
		   document.delform.elements(0).focus(); //将光标移至账号输入栏
		   return;
	   }
	   form.submit(); //送出表单中的资料
   }
</script>