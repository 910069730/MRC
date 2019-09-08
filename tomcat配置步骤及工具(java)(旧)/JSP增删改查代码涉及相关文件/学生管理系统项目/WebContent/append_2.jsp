<%@ page  contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="myweb.Test" %>
<html>
<body bgcolor="pink">
<FONT size="3">
 <%//获取提交的学号
   String number=new String(request.getParameter("number").getBytes("iso-8859-1"),"utf-8");
   if(number==null) number="";
   //获取提交的姓名
   String name=new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
   if(name==null) name="";
   //获取提交的新的数学成绩
   String m=request.getParameter("math");
   if(m==null) m="0";
   //获取提交的新的英语成绩
   String e=request.getParameter("english");
   if(e==null) e="0";
   //获取提交的新的物理成绩
   String p=request.getParameter("physics");
   if(p==null) p="0";
   String j=request.getParameter("javas");
   if(j==null) j="0";
   String cl=new String(request.getParameter("classes").getBytes("iso-8859-1"),"utf-8");
   if(cl==null) cl="";
   Test t=new Test();
   if(t.insert(number, name, m, e, p, j, cl)) session.setAttribute("tianjia", "成功");
   else session.setAttribute("tianjia","失效");
   response.sendRedirect("append_1.jsp");
 %>
 </FONT>
</body>
</html>