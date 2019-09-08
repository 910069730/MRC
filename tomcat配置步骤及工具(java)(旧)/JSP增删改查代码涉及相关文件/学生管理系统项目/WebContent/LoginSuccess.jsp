<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%
    //检查用户是否已经完成登录  
    String Name =(String)session.getAttribute("UserNm");
    
    //若Name变量为null代表尚未完成登录
    if(Name==null)
    	response.sendRedirect("LogFrm.htm");//将浏览器导向LogFrm.htm文件，要求用户重新登录
    	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<head>
<title>成绩管理</title>
</head>
<body>
<center>
        <font size=5 color=blue ><b>成绩管理</b></font>
        <hr><h2><font size=3 color=yellow >管理员：<%=Name %></font></h2><p></p>
        <table>
             <tr align=left>
                <td width=78><a href ="append_1.jsp">成绩录入</a></td>
                <td width=78><a href ="update_1.jsp">成绩修改</a></td>
                <td width=78><a href ="query_1.jsp">成绩查询</a></td>
                <td width=78><a href ="del_1.jsp">删除记录</a></td>
             </tr>
        </table><br>
</center>
</body>
</html>