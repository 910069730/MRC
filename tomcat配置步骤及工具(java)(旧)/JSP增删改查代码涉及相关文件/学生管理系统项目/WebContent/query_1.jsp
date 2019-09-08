<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>成绩查询</title>
</head>
<body>
<center>
       <p><font size=5>成绩查询</font>
       <font size=4>
         <tr>
         <td width="93%" height="16">
          <table border="1" width="100%" cellspacing="0" cellpadding="0">
            <tr>
            <td width=100% bgcolor="#008000"><font color="#fff">成绩分类查询</font></td>
            </tr>
            <tr>
             <td width="100%" bgcolor="#ffc">
             <form method="post" action="query_2.jsp" name="form">
             按学号查询：<input type="text" name="number" value=""><br>
             按班级查询：<input type="text" name="classes" value=""><br>      
             <input type="submit" value="查询" name="g" onClick="datacheck()">
             </form>
             </td>
             </tr>
          </table>
          </td>
          </tr><br>
          <%
            String number=null;
            String name=null;
            String classes=null;
            float math,english,physics,javas,total;
            Connection con=(Connection)session.getAttribute("con");
            ResultSet rs=(ResultSet)session.getAttribute("rs");
            if(rs!=null){
            	out.print("数据查询结果");
            	out.print("<Table Border>");
            	out.print("<TR>");
            	out.print("<TH width=100>"+"学号"+"</th>");
            	out.print("<TH width=100>"+"班级"+"</th>");
            	out.print("<TH width=100>"+"姓名"+"</th>");
            	out.print("<TH width=50>"+"数学成绩"+"</th>");
            	out.print("<TH width=50>"+"英语成绩"+"</th>");
            	out.print("<TH width=50>"+"物理成绩"+"</th>");
            	out.print("<TH width=50>"+"Java成绩"+"</th>");
            	out.print("<TH width=50>"+"总成绩"+"</th>");
            	out.print("</TR>"); 	
           
          
          while(rs.next()){
              out.print("<TR>");
              number=rs.getString(1);
              name=rs.getString(2);
              classes=rs.getString(7);
              out.print("<TD>"+number+"</TD>");
              out.print("<TD>"+name+"</TD>");
              out.print("<TD>"+classes+"</TD>");
              math=rs.getInt(3);
              out.print("<TD>"+math+"</TD>");
              english=rs.getInt(4);
              out.print("<TD>"+english+"</TD>");
              physics=rs.getInt(5);
              out.print("<TD>"+physics+"</TD>");
              javas=rs.getInt(6);
              out.print("<TD>"+javas+"</TD>");
              total=math+english+physics+javas;
              out.print("<TD>"+total+"</TD>");
              out.print("</TR>");
          }
          out.print("</Table>");
          }
          else out.print("无数据");
          %>
       </font>
       <br><br>
       <a href = "LoginSuccess.jsp">返回</a>
</center>
</body>
</html>