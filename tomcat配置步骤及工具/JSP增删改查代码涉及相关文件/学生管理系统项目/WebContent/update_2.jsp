<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="myweb.Test" %>
<html>
<body>
 <FONT size=3>
      <%//获取提交的学号
        String number=new String(request.getParameter("number").getBytes("iso-8859-1"),"utf-8");
      number=number.trim();
      if(number==null) number="";
      //获取提交的新的数学成绩
      String newMath=request.getParameter("math");
      if(newMath==null) newMath="0";
      float math=Float.parseFloat(newMath);
      //获取提交的新的英语成绩
      String newEnglish=request.getParameter("english");
      if(newEnglish==null) newEnglish="0";
      float english=Float.parseFloat(newEnglish);
      //获取提交的新的物理成绩
      String newPhysics=request.getParameter("physics");
      if(newPhysics==null) newPhysics="0";
      float physics=Float.parseFloat(newPhysics);
      String newJava=request.getParameter("javas");
      if(newJava==null) newJava="0";
      float javas=Float.parseFloat(newJava);
      Test t=new Test();
      String del=t.update(number,math,english,physics,javas);
      if(del.equals("修改成功")) session.setAttribute("xiugai","修改成功");
      else if(del.equals("修改失败")) session.setAttribute("xiugai","修改失败");
      else session.setAttribute("xiugai","没有这个学号");
      response.sendRedirect("update_1.jsp");
      %>
 </FONT>
</body>
</html>